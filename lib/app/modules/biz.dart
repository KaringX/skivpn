//import 'package:device_info_plus/device_info_plus.dart';

import 'package:skivpn/app/local_services/vpn_service.dart';
import 'package:skivpn/app/modules/auto_update_manager.dart';
import 'package:skivpn/app/modules/clash_setting_manager.dart';
import 'package:skivpn/app/modules/profile_manager.dart';

import 'package:skivpn/app/utils/app_lifecycle_state_notify.dart';
import 'package:skivpn/app/utils/log.dart';

class Biz {
  static final List<void Function()> onEventInitFinish = [];
  static final List<void Function()> onEventInitHomeFinish = [];
  static final List<void Function()> onEventInitAllFinish = [];
  static bool _initFinish = false;
  static bool _initHomeFinish = false;

  static void Function()? onEventExit;
  static void Function(bool)? onEventVPNStateChanged;

  static Future<void> init(bool launchAtStartup) async {
    await ClashSettingManager.init();
    await ProfileManager.init();

    await VPNService.init();

    for (var callback in onEventInitFinish) {
      callback();
    }
    _initFinish = true;
    Log.d("initFinish");
    initAllFinish();

    AppLifecycleStateNofity.init();
  }

  static Future<void> uninit() async {
    await AutoUpdateManager.uninit();
    AppLifecycleStateNofity.uninit();

    await VPNService.uninit();

    await ProfileManager.uninit();

    await ClashSettingManager.uninit();
  }

  static void clearCache() {}

  static void initHomeFinish() {
    for (var callback in onEventInitHomeFinish) {
      callback();
    }
    _initHomeFinish = true;
    Log.d("initHomeFinish");
    initAllFinish();
  }

  static void initAllFinish() {
    if (_initFinish && _initHomeFinish) {
      Log.d("initAllFinish");
      for (var callback in onEventInitAllFinish) {
        callback();
      }
    }
  }

  static void quit() {
    Future.delayed(const Duration(milliseconds: 10), () {
      if (onEventExit != null) {
        onEventExit!();
      }
    });
  }

  static void vpnStateChanged(bool isConnected) {
    if (onEventVPNStateChanged != null) {
      onEventVPNStateChanged!(isConnected);
    }
  }
}
