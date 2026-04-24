// ignore_for_file: prefer_interpolation_to_compose_strings, use_build_context_synchronously, empty_catches, unused_catch_stack

import 'dart:async';
import 'dart:io';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hotkey_manager/hotkey_manager.dart';
import 'package:libclash_vpn_service/state.dart';
import 'package:provider/provider.dart';
import 'package:skivpn/app/local_services/vpn_service.dart';
import 'package:skivpn/app/modules/auto_update_manager.dart';
import 'package:skivpn/app/modules/biz.dart';
import 'package:skivpn/app/modules/board_provider_manager.dart';
import 'package:skivpn/app/modules/board_session_persistent_manager.dart';
import 'package:skivpn/app/modules/profile_manager.dart';
import 'package:skivpn/app/modules/remote_config_manager.dart';
import 'package:skivpn/app/utils/app_lifecycle_state_notify.dart';
import 'package:skivpn/app/utils/error_reporter_utils.dart';
import 'package:skivpn/app/utils/local_storage.dart';
import 'package:skivpn/i18n/strings.g.dart';
import 'package:skivpn/screens/about_screen.dart';
import 'package:skivpn/screens/dialog_utils.dart';
import 'package:skivpn/screens/group_helper.dart';
import 'package:skivpn/screens/home_screen_widgets.dart';
import 'package:skivpn/screens/language_settings_screen.dart';
import 'package:skivpn/screens/login_screen.dart';
import 'package:skivpn/screens/sspanel/sspanel_login.dart';
import 'package:skivpn/screens/sspanel/sspanel_widgets.dart';
import 'package:skivpn/screens/theme_config.dart';
import 'package:skivpn/screens/theme_define.dart';
import 'package:skivpn/screens/themes.dart';
import 'package:skivpn/screens/user_agreement_screen.dart';
import 'package:skivpn/screens/v2board/v2board_login.dart';
import 'package:skivpn/screens/v2board/v2board_widgets.dart';
import 'package:skivpn/screens/webview_helper.dart';
import 'package:skivpn/screens/widgets/framework.dart';
import 'package:skivpn/screens/widgets/sheet.dart';
import 'package:skivpn/screens/xboard/xboard_login.dart';
import 'package:skivpn/screens/xboard/xboard_widgets.dart';
import 'package:window_manager/window_manager.dart';

class HomeScreen extends LasyRenderingStatefulWidget {
  static RouteSettings routSettings() {
    return const RouteSettings(name: "/");
  }

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends LasyRenderingState<HomeScreen>
    with WidgetsBindingObserver, AfterLayoutMixin {
  static const String userAgreementAgreedIdKey = 'userAgreementAgreedKey';
  bool _logouting = false;
  bool _agreementing = false;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
    V2boardLogin.onEventLogin[hashCode] = (() {
      setState(() {});
    });
    XboardLogin.onEventLogin[hashCode] = (() {
      setState(() {});
    });
    ProfileManager.onEventUpdate.add(_onProfileUpdate);
    BoardSessionPersistentManager.instance().onEventReloginRequired.add(() {
      if (_agreementing) {
        return;
      }
      _relogin();
    });
    _init();
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async {
    Biz.initHomeFinish();
    ErrorReporterUtils.register(() {
      if (!mounted) {
        return;
      }
      final tcontext = Translations.of(context);
      DialogUtils.showAlertDialog(
        context,
        tcontext.meta.deviceNoSpace,
        showCopy: true,
        showFAQ: true,
        withVersion: true,
      );
    });

    Future.delayed(const Duration(seconds: 0), () async {
      showAgreement();
    });

    Future.delayed(const Duration(seconds: 0), () async {
      if (Platform.isMacOS) {
        await hotKeyManager.unregisterAll();
        HotKey hotKey = HotKey(
          key: PhysicalKeyboardKey.keyW,
          modifiers: [HotKeyModifier.meta],
          scope: HotKeyScope.inapp,
        );
        await hotKeyManager.register(
          hotKey,
          keyDownHandler: (hotKey) {
            windowManager.hide();
          },
        );
      }
    });
  }

  Future<bool> futureBool(bool value) async {
    return value;
  }

  void showAgreement() async {
    final session = BoardSessionPersistentManager.instance().current();
    String? agreement;
    try {
      if (Platform.isIOS) {
        agreement = await LocalStorage.read(userAgreementAgreedIdKey);
      } else {
        agreement = "true";
      }
    } catch (e) {}

    if (agreement != null) {
      if (session == null || session.authData.isEmpty) {
        await Navigator.push(
          context,
          MaterialPageRoute(
            settings: LoginScreen.routSettings(),
            builder: (context) => LoginScreen(),
          ),
        );
      }
      return;
    }
    _agreementing = true;
    if (Platform.isIOS) {
      await Navigator.push(
        context,
        MaterialPageRoute(
          settings: UserAgreementScreen.routSettings(),
          fullscreenDialog: true,
          builder: (context) => const UserAgreementScreen(),
        ),
      );
      LocalStorage.write(userAgreementAgreedIdKey, "true");
    }

    await Navigator.push(
      context,
      MaterialPageRoute(
        settings: LanguageSettingsScreen.routSettings(),
        fullscreenDialog: true,
        builder: (context) => LanguageSettingsScreen(
          canPop: false,
          canGoBack: false,
          nextText: () {
            var tcontext = Translations.of(context);
            return tcontext.meta.done;
          },
        ),
      ),
    );

    if (session == null || session.authData.isEmpty) {
      await Navigator.push(
        context,
        MaterialPageRoute(
          settings: LoginScreen.routSettings(),
          builder: (context) => LoginScreen(),
        ),
      );
    }
    _agreementing = false;
  }

  void _init() async {
    Biz.onEventInitAllFinish.add(() async {
      await _onInitAllFinish();
    });
  }

  Future<void> _onInitAllFinish() async {
    AutoUpdateManager.onEventCheck.add(() {
      setState(() {});
    });
    DialogUtils.faqCallback = (BuildContext context, String text) async {
      final tcontext = Translations.of(context);
      var remoteConfig = RemoteConfigManager.getConfig();
      await WebviewHelper.loadUrl(
        context,
        remoteConfig.faq,
        "faqCallback",
        title: tcontext.meta.faq,
      );
    };
    VPNService.onEventStateChanged.add(_onStateChanged);

    AppLifecycleStateNofity.onStateResumed(hashCode, _onStateResumed);
    AppLifecycleStateNofity.onStatePaused(hashCode, _onStatePaused);

    setState(() {});
  }

  Future<void> _onStateChanged(
    FlutterVpnServiceState state,
    Map<String, String> params,
  ) async {
    if (state == FlutterVpnServiceState.disconnected) {
      Biz.vpnStateChanged(false);
    } else if (state == FlutterVpnServiceState.connecting) {
    } else if (state == FlutterVpnServiceState.connected) {
      if (!AppLifecycleStateNofity.isPaused()) {}

      Biz.vpnStateChanged(true);
    } else if (state == FlutterVpnServiceState.reasserting) {
    } else if (state == FlutterVpnServiceState.disconnecting) {
    } else {}

    setState(() {});
  }

  Future<void> _onStateResumed() async {
    final session = BoardSessionPersistentManager.instance().current();
    if (session == null || session.authData.isEmpty) {
      _relogin();
    }
  }

  Future<void> _onStatePaused() async {}

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size windowSize = MediaQuery.of(context).size;

    var themes = Provider.of<Themes>(context, listen: false);
    final session = BoardSessionPersistentManager.instance().current();
    AutoUpdateCheckVersion versionCheck = AutoUpdateManager.getVersionCheck();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.zero,
        child: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            systemNavigationBarIconBrightness: themes
                .getStatusBarIconBrightness(context),
            systemNavigationBarColor: Colors.transparent,
            systemNavigationBarDividerColor: Colors.transparent,
            statusBarBrightness: themes.getStatusBarBrightness(context),
            statusBarIconBrightness: themes.getStatusBarIconBrightness(context),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 50),
                  SizedBox(
                    width: windowSize.width - 50 * 2,
                    child: Text(
                      session != null ? session.provider.name : "",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: ThemeConfig.kFontWeightTitle,
                        fontSize: ThemeConfig.kFontSizeTitle,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    child: InkWell(
                      onTap: () async {
                        onTapSettings();
                      },
                      child: Stack(
                        children: [
                          Icon(
                            Icons.settings,
                            size: 30,
                            color: ThemeDefine.kColorBlue,
                          ),
                          Positioned(
                            left: -5,
                            top: -5,
                            child: SizedBox(
                              width: 25,
                              height: 25,
                              child: versionCheck.newVersion
                                  ? Icon(
                                      Icons.fiber_new_outlined,
                                      size: 20,
                                      color: Colors.red,
                                    )
                                  : null,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      HomeScreenConnectWidget(),
                      const SizedBox(height: 15),
                      if (session != null &&
                          session.provider.type ==
                              BoardProviderType.v2board) ...[
                        V2boardWidgetPlan(session: session),
                      ],
                      if (session != null &&
                          session.provider.type ==
                              BoardProviderType.xboard) ...[
                        XboardWidgetPlan(session: session),
                      ],
                      if (session != null &&
                          session.provider.type ==
                              BoardProviderType.sspanel) ...[
                        SSPanelWidgetPlan(session: session),
                      ],
                      const SizedBox(height: 15),
                      HomeScreenServiceCenterWidget(),
                      const SizedBox(height: 15),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onTapSettings() {
    AutoUpdateCheckVersion versionCheck = AutoUpdateManager.getVersionCheck();
    final tcontext = Translations.of(context);
    var widgets = [
      ListTile(
        title: Text(tcontext.meta.settingApp),
        leading: Icon(Icons.settings, size: 20, color: ThemeDefine.kColorBlue),
        minVerticalPadding: 22,
        onTap: () async {
          Navigator.of(context).pop();
          await GroupHelper.showAppSettings(context);
        },
      ),
    ];
    if (versionCheck.newVersion) {
      widgets.add(
        ListTile(
          title: Text(tcontext.meta.hasNewVersion(p: versionCheck.version)),
          leading: Icon(Icons.fiber_new_outlined, size: 20, color: Colors.red),
          minVerticalPadding: 22,
          onTap: () async {
            Navigator.of(context).pop();
            GroupHelper.newVersionUpdate(context);
          },
        ),
      );
    }

    widgets.addAll([
      ListTile(
        title: Text(tcontext.meta.help),
        leading: Icon(Icons.help, size: 20, color: ThemeDefine.kColorBlue),
        minVerticalPadding: 22,
        onTap: () async {
          Navigator.of(context).pop();
          await GroupHelper.showHelp(context);
        },
      ),
      ListTile(
        title: Text(tcontext.meta.about),
        leading: Icon(Icons.info, size: 20, color: ThemeDefine.kColorBlue),
        minVerticalPadding: 22,
        onTap: () async {
          Navigator.of(context).pop();
          await Navigator.push(
            context,
            MaterialPageRoute(
              settings: AboutScreen.routSettings(),
              builder: (context) => AboutScreen(),
            ),
          );
        },
      ),
      ListTile(
        title: Text(tcontext.meta.logout),
        leading: _logouting
            ? SizedBox(
                width: 20,
                height: 20,
                child: const RepaintBoundary(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    strokeWidth: 2,
                  ),
                ),
              )
            : Icon(Icons.logout, size: 20, color: ThemeDefine.kColorBlue),
        minVerticalPadding: 22,
        onTap: _logouting
            ? null
            : () async {
                Navigator.of(context).pop();
                _relogin();
              },
      ),
    ]);

    showSheet(
      context: context,
      body: SizedBox(
        height: 350,
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
    setState(() {});
  }

  Future<void> _relogin() async {
    if (LoginScreen.isAlive) {
      return;
    }
    setState(() {
      _logouting = true;
    });
    final current = BoardSessionPersistentManager.instance().current();
    if (current != null) {
      if (current.provider.type == BoardProviderType.v2board) {
        await V2boardLogin.logout();
      } else if (current.provider.type == BoardProviderType.xboard) {
        await XboardLogin.logout();
      } else if (current.provider.type == BoardProviderType.sspanel) {
        await SSPanelLogin.logout();
      }
    }
    await VPNService.stop();
    if (!context.mounted) {
      return;
    }
    setState(() {
      _logouting = false;
    });
    if (LoginScreen.isAlive) {
      return;
    }
    await Navigator.push(
      context,
      MaterialPageRoute(
        settings: LoginScreen.routSettings(),
        builder: (context) => LoginScreen(),
      ),
    );
  }
}
