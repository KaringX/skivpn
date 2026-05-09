import 'dart:io';
import 'package:skivpn/app/utils/app_registry_utils.dart';
import 'package:skivpn/app/utils/secure_storage_utils.dart';

abstract final class InstallDateUtils {
  static int? _ts;

  static Future<void> _init() async {
    try {
      var deviceIdKey = _getDeviceIdKey();
      var ts = _tryLoadFromPlatformSpecificLocation();

      if (ts == null || ts == 0) {
        ts = int.tryParse(await SecureStorageUtils.read(deviceIdKey) ?? "");
      }
      final now = (DateTime.now().millisecondsSinceEpoch / 1000).toInt();
      if (ts == null || ts == 0 || ts >= now) {
        ts = now;
        _trySaveToPlatformSpecificLocation(ts);
        await SecureStorageUtils.write(deviceIdKey, ts.toString());
      }

      _ts = ts;
    } catch (e) {}
  }

  static int? _tryLoadFromPlatformSpecificLocation() {
    if (Platform.isWindows) {
      return AppRegistryUtils.getInstallDate();
    }
    return null;
  }

  static void _trySaveToPlatformSpecificLocation(int ts) {
    if (Platform.isWindows) {
      AppRegistryUtils.saveInstallDate(ts);
    }
  }

  static String _getDeviceIdKey() {
    if (Platform.isIOS) {
      return 'SkivpnInstallDateIOS';
    } else if (Platform.isMacOS) {
      return 'SkivpnInstallDateMacOS';
    }

    return 'SkivpnInstallDate';
  }

  static Future<int> getTS() async {
    if (_ts == null) {
      await _init();
    }
    return _ts!;
  }
}
