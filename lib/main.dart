// ignore_for_file: empty_catches, unused_catch_stack

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_single_instance/flutter_single_instance.dart';
import 'package:libclash_vpn_service/vpn_service.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:skivpn/app/local_services/vpn_service.dart';
import 'package:skivpn/app/modules/auto_update_manager.dart';
import 'package:skivpn/app/modules/biz.dart';
import 'package:skivpn/app/modules/board_provider_manager.dart';
import 'package:skivpn/app/modules/board_session_persistent_manager.dart';
import 'package:skivpn/app/modules/remote_config_manager.dart';
import 'package:skivpn/app/modules/setting_manager.dart';
import 'package:skivpn/app/utils/app_utils.dart';
import 'package:skivpn/app/utils/log.dart';
import 'package:skivpn/app/utils/path_utils.dart';
import 'package:skivpn/app/utils/platform_utils.dart';
import 'package:skivpn/app/utils/windows_version_helper.dart';
import 'package:skivpn/i18n/strings.g.dart';
import 'package:skivpn/my_app.dart';
import 'package:skivpn/screens/launch_failed_screen.dart';

StartFailedReason? startFailedReason;
String? startFailedReasonDesc;

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocaleSettings.useDeviceLocale();
  await VPNService.initABI();
  await RemoteConfigManager.init();
  await SettingManager.init();
  await BoardSessionPersistentManager.init();
  await BoardProviderManager.init();
  if (PlatformUtils.isPC()) {
    await ensureSingleInstanceOrExit(args);
  }

  await run(args);
}

Future<void> run(List<String> args) async {
  try {
    do {
      String profileDir = await PathUtils.profileDir();
      if (profileDir.isEmpty) {
        startFailedReason = StartFailedReason.invalidProfile;
        break;
      }
      await Log.init();
      String buildVersion = AppUtils.getBuildinVersion();
      String exePath = Platform.resolvedExecutable;
      Log.w(
        'launch $buildVersion $exePath, $args, ${Directory.current.absolute.path}, $profileDir',
      );
      String cache = await PathUtils.cacheDir();
      if (cache.isEmpty) {
        startFailedReason = StartFailedReason.invalidProfile;
        break;
      }
      if (!Platform.isIOS) {
        String version = await AppUtils.getPackgetVersion();
        final buildVersionParts = buildVersion.split(".");
        if (buildVersion != version || buildVersionParts.length != 4) {
          startFailedReason = StartFailedReason.invalidVersion;
          break;
        }
      }
      if (PlatformUtils.isPC()) {
        if (path.basename(exePath).toLowerCase() !=
            PathUtils.getExeName().toLowerCase()) {
          startFailedReason = StartFailedReason.invalidProcess;
          break;
        }
      }
      const inProduction = bool.fromEnvironment("dart.vm.product");
      if (inProduction) {
        if (Platform.isMacOS) {
          if (!path.isWithin("/Applications", exePath)) {
            startFailedReason = StartFailedReason.invalidInstallPath;
            break;
          }
        }
      }
      if (Platform.isWindows) {
        var tmp = await getTemporaryDirectory();
        if (exePath.contains("UNC/") ||
            exePath.contains("UNC\\") ||
            path.isWithin(tmp.absolute.path, exePath)) {
          startFailedReason = StartFailedReason.invalidInstallPath;
          break;
        }

        if (VersionHelper.instance.majorVersion != 0 &&
            VersionHelper.instance.majorVersion < 10) {
          startFailedReason = StartFailedReason.systemVersionLow;
          startFailedReasonDesc =
              "Current: ${VersionHelper.instance.majorVersion}\nMinimum required: >= 10.0";
          break;
        }
      } else if (Platform.isAndroid) {
        String version = await FlutterVpnService.getSystemVersion();
        int? v = int.tryParse(version);
        if (v != null && v < 26) {
          startFailedReason = StartFailedReason.systemVersionLow;
          String osVersion = "";
          if (v == 25) {
            osVersion = "7.1";
          } else if (v == 24) {
            osVersion = "7.0";
          } else if (v == 23) {
            osVersion = "6.0";
          } else {
            osVersion = "< 6.0";
          }
          startFailedReasonDesc =
              "Current: $osVersion\nMinimum required: >= 8.0";
          break;
        }
      }
    } while (false);

    if (PlatformUtils.isPC()) {
      await windowManager.ensureInitialized();
      const inProduction = bool.fromEnvironment("dart.vm.product");
      if (inProduction) {
        await windowManager.setResizable(false);
        await windowManager.setMaximizable(false);
      }

      await windowManager.center();
    }

    await AutoUpdateManager.init();
    if (PlatformUtils.isMobile()) {
      if (SettingManager.getConfig().ui.autoOrientation) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.portraitDown,
          DeviceOrientation.landscapeRight,
        ]);
      } else {
        SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
      }
    }
  } catch (err, stacktrace) {
    startFailedReason = StartFailedReason.exception;
    startFailedReasonDesc = err.toString();
    String cmdline = args.toString();
    Log.w("main.run exception: ${err.toString()}, $cmdline");
  }
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }
  runApp(
    TranslationProvider(
      child: MyApp(
        args: args,
        startFailedReason: startFailedReason,
        startFailedReasonDesc: startFailedReasonDesc,
      ),
    ),
  );
}

Future<void> ensureSingleInstanceOrExit(List<String> args) async {
  FlutterSingleInstance.debugMode = false;
  // Use a stable lock file key. On Linux, process names can vary by launch
  // path (e.g. xdg-open/AppImage), which breaks single-instance detection.
  FlutterSingleInstance.processName = AppUtils.getId();
  FlutterSingleInstance.onFocus = (metadata) async {
    await windowManager.show();
    var args = metadata["args"] as List<dynamic>?;
    if (args != null && args.isNotEmpty) {
      Biz.onEventSingletonInstance?.call("");
    }
  };

  final singleInstance = FlutterSingleInstance();
  final isFirst = await singleInstance.isFirstInstance(
    maxRetries: Platform.isLinux ? 5 : 1,
    retryInterval: const Duration(milliseconds: 250),
  );

  if (!isFirst) {
    try {
      await singleInstance.focus({"args": args});
    } catch (err) {
      Log.w("single instance focus exception: ${err.toString()}");
    }

    // Never continue launching a second process.
    exit(0);
  }
}
