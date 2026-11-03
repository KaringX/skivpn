// ignore_for_file: empty_catches, unused_catch_stack

import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:libclash_vpn_service/vpn_service.dart';
import 'package:provider/provider.dart';
import 'package:skivpn/app/modules/biz.dart';
import 'package:skivpn/app/modules/setting_manager.dart';
import 'package:skivpn/app/utils/app_args.dart';
import 'package:skivpn/app/utils/app_lifecycle_state_notify.dart';
import 'package:skivpn/app/utils/app_utils.dart';
import 'package:skivpn/app/utils/log.dart';
import 'package:skivpn/app/utils/move_to_background_utils.dart';
import 'package:skivpn/app/utils/platform_utils.dart';
import 'package:skivpn/app/utils/vpn_action_handler.dart';
import 'package:skivpn/i18n/strings.g.dart';
import 'package:skivpn/screens/home_screen.dart';
import 'package:skivpn/screens/launch_failed_screen.dart';
import 'package:skivpn/screens/theme_data_dark.dart';
import 'package:skivpn/screens/themes.dart';
import 'package:skivpn/screens/widgets/routes.dart';
import 'package:tray_manager/tray_manager.dart';
import 'package:window_manager/window_manager.dart';

class MyApp extends StatefulWidget {
  final List<String> args;
  final StartFailedReason? startFailedReason;
  final String? startFailedReasonDesc;
  const MyApp({
    super.key,
    required this.args,
    required this.startFailedReason,
    required this.startFailedReasonDesc,
  });
  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp>
    with WidgetsBindingObserver, WindowListener, TrayListener {
  static const kMenuConnect = "connect";
  static const kMenuDisconnect = "disconnect";

  static const kMenuOpen = "show_window";
  static const kMenuExit = "exit_app";
  bool _launchAtStartup = false;
  bool _windowVisibleForMac = false;
  bool _trayGrey = true;
  //Tray? _tray;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    if (PlatformUtils.isPC()) {
      windowManager.addListener(this);
      windowManager.setPreventClose(true);
      /*_tray = Tray();
      _tray!.init(
        onOpen: () async {
          if (await windowManager.isMinimized()) {
            await windowManager.restore();
          } else {
            await windowManager.show();
            onWindowRestore();
          }
        },
        onExit: () async {
          await _quit();
        },
      );*/
      trayManager.addListener(this);
      _setTray(true, false, true);
    }
    AppLifecycleStateNofity.init();
    //LocaleSettings.getLocaleStream().listen((event) {});
    String launchStartupArg = widget.args.firstWhere(
      (element) => element == AppArgs.launchStartup,
      orElse: () => '',
    );
    _launchAtStartup = launchStartupArg.isNotEmpty;

    AppLifecycleStateNofity.stateLaunch(_launchAtStartup);
    _init();
  }

  @override
  void dispose() {
    AppLifecycleStateNofity.uninit();
    WidgetsBinding.instance.removeObserver(this);
    if (PlatformUtils.isPC()) {
      windowManager.removeListener(this);
      // _tray?.dispose();
      //_tray = null;
      trayManager.removeListener(this);
      trayManager.destroy();
    }

    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    switch (state) {
      case AppLifecycleState.resumed:
        AppLifecycleStateNofity.stateResumed("resumed");
        break;
      case AppLifecycleState.inactive:
        AppLifecycleStateNofity.stateInactive("inactive");
        break;
      case AppLifecycleState.detached:
        break;
      case AppLifecycleState.paused:
        AppLifecycleStateNofity.statePaused("paused");
        break;
      case AppLifecycleState.hidden:
        AppLifecycleStateNofity.stateInactive("hidden");
        break;
    }
  }

  @override
  Future<AppExitResponse> didRequestAppExit() async {
    await _quit();
    return AppExitResponse.cancel;
  }

  @override
  void didHaveMemoryPressure() {
    Log.w("memoryPressure");
  }

  @override
  Widget build(BuildContext context) {
    List<NavigatorObserver> observers = [];

    observers.add(AppRouteObserver.instance);

    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: Themes())],
      child: Consumer<Themes>(
        builder: (context, appTheme, _) {
          Provider.of<Themes>(
            context,
          ).setTheme(SettingManager.getConfig().ui.theme, false);
          return Shortcuts(
            shortcuts: const {
              SingleActivator(LogicalKeyboardKey.select):
                  ActivateIntent(), // for android tv OK/Select button
            },
            child: MaterialApp(
              //showSemanticsDebugger: false,
              debugShowCheckedModeBanner: false,
              locale: TranslationProvider.of(context).flutterLocale,
              supportedLocales: AppLocaleUtils.supportedLocales,
              localizationsDelegates: GlobalMaterialLocalizations.delegates,
              navigatorObservers: observers,
              home: PopScope(
                canPop: false,
                onPopInvokedWithResult: (didPop, result) {
                  if (Platform.isAndroid || Platform.isIOS) {
                    MoveToBackgroundUtils.moveToBackground();
                  }
                },
                child: widget.startFailedReason != null
                    ? LaunchFailedScreen(
                        startFailedReason: widget.startFailedReason!,
                        startFailedReasonDesc: widget.startFailedReasonDesc,
                      )
                    : HomeScreen(),
              ),
              builder: SettingManager.getConfig().ui.disableFontScaler
                  ? (context, widget) {
                      return MediaQuery(
                        data: MediaQuery.of(
                          context,
                        ).copyWith(textScaler: TextScaler.noScaling),
                        child: widget!,
                      );
                    }
                  : null,
              themeMode: appTheme.themeMode(),
              theme: appTheme.themeData(context),
              darkTheme: ThemeDataDark.theme(context),
            ),
          );
        },
      ),
    );
  }

  @override
  void onWindowClose() async {
    Log.d("onWindowClose");
    await windowManager.hide();
    _windowVisibleForMac = false;
    AppLifecycleStateNofity.statePaused("close");
  }

  @override
  void onWindowMinimize() {
    _windowVisibleForMac = false;
    Log.d("onWindowMinimize");
    AppLifecycleStateNofity.statePaused("minimize");
  }

  @override
  void onWindowRestore() {
    _windowVisibleForMac = true;
    Log.d("onWindowRestore");
    AppLifecycleStateNofity.stateResumed("restore");
  }

  @override
  void onWindowFocus() {
    if (Platform.isMacOS) {
      if (!_windowVisibleForMac) {
        Log.d("onWindowFocus");
        _windowVisibleForMac = true;
        AppLifecycleStateNofity.stateResumed("restore");
      }
    }
  }

  @override
  void onWindowDeviceShutdown() {
    Log.d("main.dart onWindowDeviceShutdown");
    _quit();
  }

  @override
  void onWindowUserSessionDisconnect() {
    Log.d("main.dart onWindowUserSessionDisconnect");
  }

  void firstShowWindow(bool forceShow) {
    if (!PlatformUtils.isPC()) {
      return;
    }
    windowManager.waitUntilReadyToShow(null, () async {
      final settings = SettingManager.getConfig();
      if (Platform.isMacOS && settings.hideDockIcon) {
        FlutterVpnService.hideDockIcon(true);
      }
      if (forceShow || !settings.ui.hideAfterLaunch) {
        await windowManager.show();
        onWindowRestore();
      } else {
        await windowManager.hide();
      }
    });
  }

  Future<void> _init() async {
    Biz.onEventExit = (() {
      _quit();
    });

    Biz.onEventVPNStateChanged = ((bool connected) {
      if (PlatformUtils.isPC()) {
        // _tray?.setIconDisconneted(!connected);
        if (_trayGrey == !connected) {
          return;
        }
        _setTray(!connected, false, false);
      }
    });
    if (widget.startFailedReason == null) {
      Biz.onEventInitHomeFinish.add(() {
        firstShowWindow(false);
      });

      await Biz.init(_launchAtStartup);
    } else {
      firstShowWindow(true);
    }
  }

  Future<void> _uninit() async {
    if (PlatformUtils.isPC()) {
      await windowManager.hide();
    }
    if (widget.startFailedReason == null) {
      await Biz.uninit();
    }
    if (PlatformUtils.isPC()) {
      await trayManager.destroy();
    }
  }

  Future<void> _quit() async {
    await _uninit();
    Future.delayed(const Duration(seconds: 0), () async {
      await Log.uninit();
      await ServicesBinding.instance.exitApplication(AppExitType.required);
    });
  }

  void _setTray(bool grey, bool destroy, bool quitIfFailed) {
    Future.delayed(const Duration(milliseconds: 300), () async {
      if (destroy || Platform.isLinux) {
        await trayManager.destroy();
      }

      try {
        if (Platform.isWindows) {
          await trayManager.setIcon(
            grey ? 'assets/images/grey_tray.ico' : 'assets/images/tray.ico',
            isTemplate: false,
          );
        } else {
          await trayManager.setIcon(
            grey ? 'assets/images/grey_tray.png' : 'assets/images/tray.png',
            isTemplate: false,
          );
        }
        _trayGrey = grey;
      } catch (err, stacktrace) {
        Log.w("setIcon exception: ${err.toString()}, quit");
        if (quitIfFailed) {
          Future.delayed(const Duration(milliseconds: 1000), () async {
            _quit();
          });
        }
      }
      if (!Platform.isLinux) {
        await trayManager.setToolTip(AppUtils.getName());
      } else {
        await _setTrayMenu(grey);
      }
    });
  }

  Future<void> _setTrayMenu(bool grey) async {
    if (!PlatformUtils.isPC()) {
      return;
    }

    List<MenuItem> items = [
      if (grey) ...[
        MenuItem(key: kMenuConnect, label: "   ${t.meta.connect}   "),
      ],
      if (!grey) ...[
        MenuItem(key: kMenuDisconnect, label: "   ${t.meta.disconnect}   "),
      ],
      MenuItem.separator(),
      MenuItem(key: kMenuOpen, label: "   ${t.main.tray.menuOpen}   "),
      MenuItem(key: kMenuExit, label: "   ${t.main.tray.menuExit}   "),
    ];

    await trayManager.setContextMenu(Menu(items: items));
    if (!Platform.isLinux) {
      await trayManager.popUpContextMenu(bringAppToFront: true);
    }
  }

  @override
  void onTrayIconMouseDown() async {
    if (await windowManager.isMinimized()) {
      await windowManager.restore();
    } else {
      await windowManager.show();
      onWindowRestore();
    }
  }

  @override
  void onTrayIconRightMouseDown() async {
    await _setTrayMenu(_trayGrey);
  }

  @override
  void onTrayMenuItemClick(MenuItem menuItem) async {
    if (menuItem.key == kMenuConnect) {
      VpnActionHandler.vpnConnect?.call("menu", false);
    } else if (menuItem.key == kMenuDisconnect) {
      VpnActionHandler.vpnDisconnect?.call("menu", false);
    } else if (menuItem.key == kMenuExit) {
      await _quit();
    } else if (menuItem.key == kMenuOpen) {
      if (await windowManager.isMinimized()) {
        await windowManager.restore();
      } else {
        await windowManager.show();
        onWindowRestore();
      }
    }
  }
}
