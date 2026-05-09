import 'dart:io';

import 'package:skivpn/app/utils/path_utils.dart';
import 'package:win32_registry/win32_registry.dart';

abstract final class AppRegistryUtils {
  static const String _registryPath = 'Software\\SkiVPN';
  static const String _registryValueNameDid = 'did';
  static const String _registryValueNameInstallDate = 'installDate';

  static String? getDid() {
    if (PathUtils.portableMode()) {
      return null;
    }
    return getValue<String>(_registryValueNameDid, RegistryValueType.string);
  }

  static void saveDid(String did) {
    if (PathUtils.portableMode()) {
      return;
    }
    setValue(_registryValueNameDid, RegistryValueType.string, did);
  }

  static int? getInstallDate() {
    if (PathUtils.portableMode()) {
      return null;
    }
    return int.tryParse(
      getValue<String>(
            _registryValueNameInstallDate,
            RegistryValueType.string,
          ) ??
          "",
    );
  }

  static void saveInstallDate(int ts) {
    if (PathUtils.portableMode()) {
      return;
    }
    setValue(
      _registryValueNameInstallDate,
      RegistryValueType.string,
      ts.toString(),
    );
  }

  /// Generic method to retrieve a registry value with type checking
  static T? getValue<T>(String name, RegistryValueType expectedType) {
    if (!Platform.isWindows) {
      return null;
    }

    try {
      final value = Registry.currentUser.getValue(name, path: _registryPath);
      if (value == null || value.type != expectedType) {
        return null;
      }
      return value.data as T;
    } catch (_) {
      return null;
    }
  }

  /// Generic method to save a registry value
  static void setValue<T>(String name, RegistryValueType type, T value) {
    if (!Platform.isWindows) {
      return;
    }

    try {
      final key = Registry.currentUser.createKey(_registryPath);
      key.createValue(RegistryValue(name, type, value as Object));
    } catch (_) {
      // Handle other errors silently
    }
  }
}
