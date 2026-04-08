import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:libclash_vpn_service/state.dart';
import 'package:libclash_vpn_service/vpn_service.dart';
import 'package:quick_actions/quick_actions.dart';
import 'package:skivpn/app/clash/clash_config.dart';
import 'package:skivpn/app/clash/clash_http_api.dart';
import 'package:skivpn/app/local_services/vpn_service.dart';
import 'package:skivpn/app/modules/auto_update_manager.dart';
import 'package:skivpn/app/modules/biz.dart';
import 'package:skivpn/app/modules/board_session_persistent_manager.dart';
import 'package:skivpn/app/modules/profile_manager.dart';
import 'package:skivpn/app/modules/setting_manager.dart';
import 'package:skivpn/app/utils/app_lifecycle_state_notify.dart';
import 'package:skivpn/app/utils/app_scheme_actions.dart';
import 'package:skivpn/app/utils/clash_yaml.dart';
import 'package:skivpn/app/utils/log.dart';
import 'package:skivpn/app/utils/move_to_background_utils.dart';
import 'package:skivpn/app/utils/path_utils.dart';
import 'package:skivpn/app/utils/platform_utils.dart';
import 'package:skivpn/app/utils/url_launcher_utils.dart';
import 'package:skivpn/app/utils/vpn_action_handler.dart';
import 'package:skivpn/i18n/strings.g.dart';
import 'package:skivpn/screens/dialog_utils.dart';
import 'package:skivpn/screens/theme_define.dart';
import 'package:skivpn/screens/webview_helper.dart';
import 'package:skivpn/screens/widgets/sheet.dart';

class HomeScreenConnectWidget extends StatefulWidget {
  const HomeScreenConnectWidget({super.key});

  @override
  State<HomeScreenConnectWidget> createState() =>
      _HomeScreenConnectWidgetState();
}

class _HomeScreenConnectWidgetState extends State<HomeScreenConnectWidget> {
  static final String _kNoSpeed = "0 B/s";
  static final String _kNoTrafficTotal = "0 B";
  static const int kMaxDelay = 99999;
  final FocusNode _focusNodeConnect = FocusNode();
  FlutterVpnServiceState _state = FlutterVpnServiceState.disconnected;
  Timer? _timerStateChecker;
  Timer? _timerConnectToCore;
  QuickActions? _quickActions;
  bool _quickActionWorking = false;
  List<ClashProxiesNode> _nodes = [];

  final ValueNotifier<String> _trafficSpeedUpload = ValueNotifier<String>(
    _kNoSpeed,
  );
  final ValueNotifier<String> _trafficSpeedDownload = ValueNotifier<String>(
    _kNoSpeed,
  );
  final ValueNotifier<String> _trafficTotalUpload = ValueNotifier<String>(
    _kNoTrafficTotal,
  );
  final ValueNotifier<String> _trafficTotalDownload = ValueNotifier<String>(
    _kNoTrafficTotal,
  );

  @override
  void initState() {
    super.initState();
    VPNService.onEventStateChanged.add(_onStateChanged);
    AppLifecycleStateNofity.onStateResumed(hashCode, _onStateResumed);
    AppLifecycleStateNofity.onStatePaused(hashCode, _onStatePaused);
    AppLifecycleStateNofity.onStateInactive(hashCode, _onStateHidden);
    ProfileManager.onEventUpdate.add(_onProfileUpdate);
    if (!AppLifecycleStateNofity.isPaused()) {
      _onStateResumed();
    }
    Biz.onEventInitAllFinish.add(() async {
      if (Platform.isAndroid) {
        if (SettingManager.getConfig().excludeFromRecent) {
          FlutterVpnService.setExcludeFromRecents(true);
        }
      }
      await _onInitAllFinish();
    });
  }

  @override
  void dispose() {
    _focusNodeConnect.dispose();
    super.dispose();
  }

  void initQuickAction() async {
    if (!Platform.isIOS && !Platform.isAndroid) {
      return;
    }
    String connect = AppSchemeActions.connectAction();
    String disconnect = AppSchemeActions.disconnectAction();
    try {
      _quickActions ??= QuickActions();
      await _quickActions!.initialize((String shortcutType) async {
        if (_quickActionWorking) {
          return;
        }
        _quickActionWorking = true;
        var state = await VPNService.getState();
        if (shortcutType == connect) {
          if (state != FlutterVpnServiceState.invalid &&
              state != FlutterVpnServiceState.disconnected) {
            MoveToBackgroundUtils.moveToBackground(
              duration: const Duration(milliseconds: 300),
            );
            _quickActionWorking = false;
            return;
          }

          bool ok = await start("quickAction");
          if (ok) {
            MoveToBackgroundUtils.moveToBackground(
              duration: const Duration(milliseconds: 300),
            );
          }
        } else if (shortcutType == disconnect) {
          if (state == FlutterVpnServiceState.connected) {
            await stop();
          }
          MoveToBackgroundUtils.moveToBackground(
            duration: const Duration(milliseconds: 300),
          );
        }
        _quickActionWorking = false;
      });

      await _quickActions!.setShortcutItems(<ShortcutItem>[
        ShortcutItem(type: connect, localizedTitle: 'ON', icon: 'ic_launcher'),
        ShortcutItem(
          type: disconnect,
          localizedTitle: 'OFF',
          icon: 'ic_launcher',
        ),
      ]);
    } catch (err, stacktrace) {
      Log.w("initQuickAction exception ${err.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    Size windowSize = MediaQuery.of(context).size;
    final tcontext = Translations.of(context);
    bool connected = _state == FlutterVpnServiceState.connected;
    final session = BoardSessionPersistentManager.instance().current();
    final profile = ProfileManager.getByUrl(session?.subscribeUrl ?? "");
    final smallTitleStyle = TextStyle(fontSize: 12, color: Colors.grey[600]);
    Icon? currentIcon = getIconByName(profile, profile?.currentProxy ?? "");

    List<Widget> widgets = [
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: connected
                          ? ThemeDefine.kColorGreenBright
                          : Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    connected
                        ? tcontext.meta.connected
                        : tcontext.meta.disconnected,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              Stack(
                children: [
                  SizedBox(
                    width: 60,
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Switch.adaptive(
                        value: _state == FlutterVpnServiceState.connected,
                        focusNode: _focusNodeConnect,
                        onChanged: (bool value) async {
                          if (value) {
                            await start("switch");
                          } else {
                            await stop();
                          }
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    left: 8,
                    top: 12,
                    child: SizedBox(
                      width: 25,
                      height: 25,
                      child:
                          _state == FlutterVpnServiceState.connecting ||
                              _state == FlutterVpnServiceState.disconnecting ||
                              _state == FlutterVpnServiceState.reasserting
                          ? const RepaintBoundary(
                              child: CircularProgressIndicator(
                                color: ThemeDefine.kColorGreenBright,
                              ),
                            )
                          : null,
                    ),
                  ),
                ],
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(tcontext.homeScreen.traffic, style: smallTitleStyle),
              const SizedBox(width: 10),
              const Icon(
                Icons.arrow_upward,
                color: ThemeDefine.kColorGreenBright,
                size: 16,
              ),
              ValueListenableBuilder<String>(
                builder: _buildWithTrafficSpeedValue,
                valueListenable: _trafficTotalUpload,
              ),
              const SizedBox(width: 10),
              const Icon(
                Icons.arrow_downward,
                color: ThemeDefine.kColorGreenBright,
                size: 16,
              ),
              ValueListenableBuilder<String>(
                builder: _buildWithTrafficSpeedValue,
                valueListenable: _trafficTotalDownload,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(tcontext.homeScreen.speed, style: smallTitleStyle),
              const SizedBox(width: 10),
              const Icon(
                Icons.arrow_upward,
                color: ThemeDefine.kColorGreenBright,
                size: 16,
              ),
              ValueListenableBuilder<String>(
                builder: _buildWithTrafficSpeedValue,
                valueListenable: _trafficSpeedUpload,
              ),
              const SizedBox(width: 10),
              const Icon(
                Icons.arrow_downward,
                color: ThemeDefine.kColorGreenBright,
                size: 16,
              ),
              ValueListenableBuilder<String>(
                builder: _buildWithTrafficSpeedValue,
                valueListenable: _trafficSpeedDownload,
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(),
          SizedBox(
            height: 40,
            child: InkWell(
              onTap: () {
                onTapProxy(profile);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.language_outlined,
                        color: ThemeDefine.kColorGreenBright,
                      ),
                      const SizedBox(width: 5),
                      SizedBox(
                        width: windowSize.width - 20 * 2 - 20 * 2 - 20 * 2 - 60,
                        child: Text(
                          translateProxyName(profile?.currentProxy ?? ""),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (currentIcon != null) ...[
                          currentIcon,
                          const SizedBox(width: 5),
                        ],
                        Icon(Icons.keyboard_arrow_right),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
        ],
      ),
    ];

    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(children: widgets),
      ),
    );
  }

  Icon? getIconByName(ProfileSetting? profile, String name) {
    if (profile == null) {
      return null;
    }
    int minDelay = kMaxDelay;
    for (var p in profile.proxies) {
      if (p.delay != null && p.delay! < minDelay) {
        minDelay = p.delay!;
      }
    }
    int delay = kMaxDelay;
    if (_nodes.isNotEmpty) {
      for (var node in _nodes) {
        if (node.name == name) {
          if (node.delay != null) {
            delay = node.delay!;
          }
          break;
        }
      }
    }
    if (delay == kMaxDelay) {
      if (name == ProfileSetting.getAutoSelectGroupName() ||
          name == ProfileSetting.getLoadBalanceGroupName()) {
        delay = minDelay;
      } else {
        for (var p in profile.proxies) {
          if (p.name == name) {
            if (p.delay != null) {
              delay = p.delay!;
            }
            break;
          }
        }
      }
    }

    return getIconByDelay(delay);
  }

  Icon? getIconByProxy(
    ProfileSetting? profile,
    ClashYamlOubboundOptions proxy,
  ) {
    if (profile == null) {
      return null;
    }
    int minDelay = kMaxDelay;
    for (var p in profile.proxies) {
      if (p.delay != null && p.delay! < minDelay) {
        minDelay = p.delay!;
      }
    }
    int delay = kMaxDelay;
    if (_nodes.isNotEmpty) {
      for (var node in _nodes) {
        if (node.name == proxy.name) {
          if (node.delay != null) {
            delay = node.delay!;
          }
          break;
        }
      }
    }
    if (delay == kMaxDelay) {
      if (proxy.type == "url-test" || proxy.type == "load-balance") {
        delay = minDelay;
      } else {
        for (var p in profile.proxies) {
          if (p.name == proxy.name) {
            if (proxy.delay != null) {
              delay = p.delay!;
            }
            break;
          }
        }
      }
    }

    return getIconByDelay(delay);
  }

  Icon? getIconByDelay(int delay) {
    if (delay == kMaxDelay) {
      return const Icon(null);
    }
    Icon? icon;
    if (delay <= 300) {
      icon = const Icon(
        Icons.signal_cellular_alt_rounded,
        color: ThemeDefine.kColorGreenBright,
      );
    } else if (delay <= 600) {
      icon = const Icon(
        Icons.signal_cellular_alt_2_bar_rounded,
        color: Colors.orange,
      );
    } else {
      icon = const Icon(
        Icons.signal_cellular_alt_1_bar_rounded,
        color: Colors.red,
      );
    }

    return icon;
  }

  String translateProxyName(String name) {
    final tcontext = Translations.of(context);
    if (name == ProfileSetting.getAutoSelectGroupName()) {
      return tcontext.homeScreen.autoSelect;
    } else if (name == ProfileSetting.getLoadBalanceGroupName()) {
      return tcontext.homeScreen.loadBalance;
    }

    return name;
  }

  Widget _buildWithTrafficSpeedValue(
    BuildContext context,
    String value,
    Widget? child,
  ) {
    return SizedBox(width: 80, child: Text(value, textAlign: TextAlign.left));
  }

  Future<void> _onInitAllFinish() async {
    VpnActionHandler.vpnConnect = _vpnConnect;
    VpnActionHandler.vpnDisconnect = _vpnDisconnect;
    VpnActionHandler.vpnReconnect = _vpnReconnect;
    initQuickAction();
    if (PlatformUtils.isPC()) {
      if (SettingManager.getConfig().autoConnectAfterLaunch) {
        await start("launch");
      }
    }
  }

  Future<void> stop() async {
    await VPNService.stop();
  }

  Future<bool> start(String from) async {
    if (bool.fromEnvironment("dart.vm.product") &&
        Platform.isWindows &&
        !VPNService.isRunAsAdmin()) {
      final tcontext = Translations.of(context);
      await DialogUtils.showAlertDialog(
        context,
        tcontext.meta.requireAdminPrivilegeAtStartup,
        showCopy: false,
        showFAQ: false,
        withVersion: true,
      );

      return false;
    }
    final currentSession = BoardSessionPersistentManager.instance().current();
    if (currentSession == null || currentSession.subscribeUrl.isEmpty) {
      setState(() {});
      return false;
    }
    final currentProfile = ProfileManager.getByUrl(currentSession.subscribeUrl);
    if (currentProfile == null) {
      setState(() {});
      return false;
    }
    if (Platform.isLinux) {
      String? installer = await AutoUpdateManager.checkReplace();
      if (installer != null) {
        return true;
      }
      final servicePath = PathUtils.serviceExePath();
      if (!await FlutterVpnService.isServiceAuthorized(servicePath)) {
        if (!mounted) {
          return false;
        }
        String? password = await DialogUtils.showPasswordInputDialog(context);
        if (password == null || password.isEmpty) {
          setState(() {});
          return true;
        }
        final result = await FlutterVpnService.authorizeService(
          servicePath,
          password,
        );
        if (result != null) {
          if (!mounted) {
            return false;
          }
          DialogUtils.showAlertDialog(
            context,
            result.message,
            withVersion: true,
          );
          setState(() {});
          return false;
        }
      }
    }
    var state = await VPNService.getState();
    if (state == FlutterVpnServiceState.connecting ||
        state == FlutterVpnServiceState.disconnecting ||
        state == FlutterVpnServiceState.reasserting) {
      setState(() {});
      return false;
    }

    var err = await VPNService.start(const Duration(seconds: 60));
    if (!mounted) {
      return false;
    }
    setState(() {});
    if (err != null) {
      if (err.message == "willCompleteAfterRebootInstall") {
        err.message = t.meta.willCompleteAfterRebootInstall;
      } else if (err.message == "requestNeedsUserApproval") {
        err.message = t.meta.requestNeedsUserApproval;
      } else if (err.message.contains("FullDiskAccessPermissionRequired")) {
        err.message = t.meta.FullDiskAccessPermissionRequired;
      } else if (err.message.contains(
        "configure tun interface: Access is denied",
      )) {
        err.message += "\n${t.meta.tunModeRunAsAdmin}";
      }

      DialogUtils.showAlertDialog(context, err.message, withVersion: true);
      return false;
    }

    await ClashHttpApi.setProxiesNode(
      ProfileSetting.getManualSelectGroupName(),
      currentProfile.currentProxy,
    );
    await ClashHttpApi.setProxiesNode("GLOBAL", currentProfile.currentProxy);

    return true;
  }

  Future<void> _vpnConnect(String from, bool background) async {
    Future.delayed(const Duration(seconds: 0), () async {
      bool ok = await start(from);
      if (ok) {
        if (background) {
          MoveToBackgroundUtils.moveToBackground(
            duration: const Duration(milliseconds: 300),
          );
        }
      }
    });
  }

  Future<void> _vpnDisconnect(String from, bool background) async {
    Future.delayed(const Duration(seconds: 0), () async {
      await stop();
      if (background) {
        MoveToBackgroundUtils.moveToBackground(
          duration: const Duration(milliseconds: 300),
        );
      }
    });
  }

  Future<void> _vpnReconnect(String from, bool background) async {
    Future.delayed(const Duration(seconds: 0), () async {
      await stop();
      bool ok = await start(from);
      if (ok) {
        if (background) {
          MoveToBackgroundUtils.moveToBackground(
            duration: const Duration(milliseconds: 300),
          );
        }
      }
    });
  }

  Future<void> _onStateChanged(
    FlutterVpnServiceState state,
    Map<String, String> params,
  ) async {
    if (_state == state) {
      return;
    }
    _state = state;
    if (state == FlutterVpnServiceState.disconnected) {
      _disconnectToCore();
      Biz.vpnStateChanged(false);
    } else if (state == FlutterVpnServiceState.connecting) {
    } else if (state == FlutterVpnServiceState.connected) {
      if (!AppLifecycleStateNofity.isPaused()) {
        _connectToCore();
      }
      Biz.vpnStateChanged(true);
    } else if (state == FlutterVpnServiceState.reasserting) {
      _disconnectToCore();
    } else if (state == FlutterVpnServiceState.disconnecting) {
      _stopStateCheckTimer();
    } else {
      _disconnectToCore();
      Biz.vpnStateChanged(false);
    }
    if (!mounted) {
      return;
    }
    setState(() {});
  }

  Future<void> _onStateResumed() async {
    _checkState();
    _startStateCheckTimer();
    _connectToCore();
  }

  Future<void> _onStatePaused() async {
    _stopStateCheckTimer();
    _disconnectToCore(resetUI: false);
  }

  Future<void> _onStateHidden() async {
    _stopStateCheckTimer();
    _disconnectToCore(resetUI: false);
  }

  Future<void> _onProfileUpdate(
    String id,
    bool finish,
    bool fileUpdated,
    bool proxiesUpdated,
  ) async {
    if (!finish) {
      return;
    }
    if (!fileUpdated && !proxiesUpdated) {
      return;
    }
    if (_state != FlutterVpnServiceState.connected) {
      return;
    }
    final err = await VPNService.restart(const Duration(seconds: 60));
    if (err != null) {
      if (!mounted) {
        return;
      }
      DialogUtils.showAlertDialog(context, err.message, withVersion: true);
    }
    setState(() {});
  }

  Future<void> _checkState() async {
    var state = await VPNService.getState();
    await _onStateChanged(state, {});
  }

  void _startStateCheckTimer() {
    const Duration duration = Duration(seconds: 1);
    _timerStateChecker ??= Timer.periodic(duration, (timer) async {
      if (!Platform.isMacOS) {
        if (AppLifecycleStateNofity.isPaused()) {
          return;
        }
      }
      await _checkState();
    });
  }

  void _stopStateCheckTimer() {
    if (!Platform.isMacOS) {
      _timerStateChecker?.cancel();
      _timerStateChecker = null;
    }
  }

  Future<void> _connectToCore() async {
    bool started = await VPNService.getStarted();
    if (!started) {
      return;
    }
    if (AppLifecycleStateNofity.isPaused()) {
      return;
    }
    const Duration duration = Duration(seconds: 1);
    _timerConnectToCore ??= Timer.periodic(duration, (timer) async {
      if (AppLifecycleStateNofity.isPaused()) {
        return;
      }
      String connections = await FlutterVpnService.clashiApiConnections(false);
      String tranffic = await FlutterVpnService.clashiApiTraffic();
      if (AppLifecycleStateNofity.isPaused()) {
        return;
      }
      try {
        var obj = jsonDecode(connections);
        ClashConnections body = ClashConnections();
        body.fromJson(obj);
        _trafficTotalUpload.value = ClashHttpApi.convertTrafficToStringDouble(
          body.uploadTotal,
        );
        _trafficTotalDownload.value = ClashHttpApi.convertTrafficToStringDouble(
          body.downloadTotal,
        );
      } catch (err) {}
      try {
        var obj = jsonDecode(tranffic);
        ClashTraffic traffic = ClashTraffic();
        traffic.fromJson(obj);
        _trafficSpeedUpload.value =
            "${ClashHttpApi.convertTrafficToStringDouble(traffic.upload)}/s";
        _trafficSpeedDownload.value =
            "${ClashHttpApi.convertTrafficToStringDouble(traffic.download)}/s";
      } catch (err) {}
    });
    getProxies();
  }

  Future<void> _disconnectToCore({bool resetUI = true}) async {
    _timerConnectToCore?.cancel();
    _timerConnectToCore = null;
    if (resetUI) {
      _trafficTotalUpload.value = _kNoTrafficTotal;
      _trafficTotalDownload.value = _kNoTrafficTotal;
      _trafficSpeedUpload.value = _kNoSpeed;
      _trafficSpeedDownload.value = _kNoSpeed;
    }
  }

  Future<void> getProxies() async {
    var result = await ClashHttpApi.getProxies();
    if (result.error == null) {
      List<ClashProxiesNode> nodes = [];
      Map<String, int?> delayMap = {};
      for (var node in result.data!) {
        if (node.hidden) {
          continue;
        }
        if (node.type == ClashProtocolType.selector.name ||
            node.type == ClashProtocolType.fallback.name ||
            node.type == ClashProtocolType.direct.name ||
            node.type == ClashProtocolType.compatible.name ||
            node.type == ClashProtocolType.pass.name ||
            node.type == ClashProtocolType.reject.name ||
            node.type == ClashProtocolType.rejectDrop.name) {
          continue;
        }
        nodes.add(node);
        if (node.delay != null) {
          delayMap[node.name] = node.delay;
        }
      }
      _nodes = nodes;
      setState(() {});
      final session = BoardSessionPersistentManager.instance().current();
      ProfileManager.updateDelay(session?.subscribeUrl ?? "", delayMap);
    }
  }

  Future<void> onTapProxy(ProfileSetting? profile) async {
    var widgets = [];
    if (profile != null) {
      final proxyGroups = profile.getProxyGroups();
      for (var proxy in proxyGroups.outboundGroupsAndServers) {
        Icon? icon = getIconByProxy(profile, proxy);
        widgets.add(
          ListTile(
            title: Text(
              "${widgets.length + 1} ${translateProxyName(proxy.name)}",
              style: TextStyle(
                color: profile.currentProxy == proxy.name
                    ? ThemeDefine.kColorBlue
                    : null,
              ),
            ),
            onTap: () async {
              Navigator.pop(context);
              final connected = _state == FlutterVpnServiceState.connected;
              if (connected) {
                final err = await ClashHttpApi.setProxiesNode(
                  ProfileSetting.getManualSelectGroupName(),
                  proxy.name,
                );
                await ClashHttpApi.setProxiesNode("GLOBAL", proxy.name);
                if (err == null) {
                  profile.currentProxy = proxy.name;
                  setState(() {});
                }
              } else {
                profile.currentProxy = proxy.name;
                setState(() {});
              }
            },
            trailing: icon,
          ),
        );
      }
    }
    await showSheet(
      context: context,
      body: SizedBox(
        height: 500,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Scrollbar(
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return widgets[index];
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(height: 1, thickness: 0.3);
              },
              itemCount: widgets.length,
            ),
          ),
        ),
      ),
    );
    setState(() {});
  }
}

class HomeScreenServiceCenterWidget extends StatelessWidget {
  const HomeScreenServiceCenterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size windowSize = MediaQuery.of(context).size;
    final session = BoardSessionPersistentManager.instance().current();
    final tcontext = Translations.of(context);
    if (session == null ||
        (session.provider.clientServiceUrl.isEmpty &&
            session.provider.subscriptionChannelUrl.isEmpty &&
            session.provider.planUrl.isEmpty)) {
      return SizedBox.shrink();
    }
    int count = 0;
    if (session.provider.clientServiceUrl.isNotEmpty) {
      count++;
    }
    if (session.provider.subscriptionChannelUrl.isNotEmpty) {
      count++;
    }
    if (session.provider.planUrl.isNotEmpty && !Platform.isIOS) {
      count++;
    }
    if (count == 0) {
      count = 1;
    }
    double width = (windowSize.width - 100) / count;
    double height = 70.0;
    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.favorite, color: Colors.redAccent),
                    const SizedBox(width: 5),
                    Text(
                      tcontext.homeScreen.serviceCenter,
                      textAlign: TextAlign.left,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            const Divider(),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 1),
                if (session.provider.clientServiceUrl.isNotEmpty) ...[
                  SizedBox(
                    width: width,
                    height: height,
                    child: InkWell(
                      onTap: () {
                        UrlLauncherUtils.loadUrl(
                          session.provider.clientServiceUrl,
                        );
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.contact_support_outlined,
                            color: ThemeDefine.kColorBlue,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            tcontext.homeScreen.onlineSupport,
                            textAlign: TextAlign.center,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
                if (session.provider.subscriptionChannelUrl.isNotEmpty) ...[
                  const SizedBox(width: 1),
                  SizedBox(
                    width: width,
                    height: height,
                    child: InkWell(
                      onTap: () {
                        UrlLauncherUtils.loadUrl(
                          session.provider.subscriptionChannelUrl,
                        );
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.message_outlined,
                            color: ThemeDefine.kColorBlue,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            tcontext.homeScreen.subscriptionChannel,
                            textAlign: TextAlign.center,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
                if (session.provider.planUrl.isNotEmpty && !Platform.isIOS) ...[
                  const SizedBox(width: 1),
                  SizedBox(
                    width: width,
                    height: height,
                    child: InkWell(
                      onTap: () {
                        WebviewHelper.loadUrl(
                          context,
                          session.provider.planUrl,
                          "planUrl",
                          title: tcontext.homeScreen.buyPlan,
                          useInappWebViewForPC: true,
                          inappWebViewOpenExternal: true,
                          headers: session.headers(),
                          cookies: session.cookies(),
                          localStorage: session.localStorage(),
                        );
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.subscriptions_outlined,
                            color: ThemeDefine.kColorBlue,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            tcontext.homeScreen.buyPlan,
                            textAlign: TextAlign.center,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
                const SizedBox(width: 1),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
