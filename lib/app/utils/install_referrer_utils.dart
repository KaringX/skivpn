import 'dart:io';

import 'package:flutter_install_referrer/flutter_install_referrer.dart';
import 'package:skivpn/app/utils/log.dart';

abstract final class InstallReferrerUtils {
  static InstallationAppReferrer? _referrer;
  static Future<InstallationAppReferrer?> get() async {
    if (Platform.isIOS) {
      if (_referrer == null) {
        try {
          var app = await InstallReferrer.app;
          _referrer = app.referrer;
        } catch (err, _) {
          Log.i("InstallReferrerUtils.get exception ${err.toString()}");
        }
      }
    }

    return _referrer;
  }

  static Future<bool> isTestFlight() async {
    var referrer = await get();
    if (referrer == null) {
      return false;
    }
    return referrer == InstallationAppReferrer.iosTestFlight;
  }

  static Future<bool> isAppStore() async {
    var referrer = await get();
    if (referrer == null) {
      return false;
    }
    return referrer == InstallationAppReferrer.iosAppStore;
  }

  static String getAppleTestFlightName() {
    return "Apple - Test Flight";
  }

  static String getAppleAppstoreName() {
    return "Apple - App Store";
  }

  static String getBuildChannelName() {
    String channel = const String.fromEnvironment('PACKAGE_TARGET');
    return channel;
  }

  static Future<String> getString() async {
    var referrer = await get();
    if (referrer == null) {
      final channel = getBuildChannelName();
      if (channel.isNotEmpty) {
        return channel;
      }

      return Platform.operatingSystem;
    }
    switch (referrer) {
      case InstallationAppReferrer.iosAppStore:
        return getAppleAppstoreName();
      case InstallationAppReferrer.iosTestFlight:
        return getAppleTestFlightName();
      case InstallationAppReferrer.iosDebug:
        return "Apple - Debug";
      default:
        return "";
    }
  }
}
