// ignore_for_file: unused_catch_stack

import 'dart:io';

class PlatformUtils {
  static const String windows = "windows";
  static const String android = "android";
  static const String ios = "ios";
  static const String macos = "macos";
  static const String linux = "linux";
  static bool isPC() {
    return Platform.isLinux || Platform.isMacOS || Platform.isWindows;
  }

  static bool isMobile() {
    return Platform.isAndroid || Platform.isIOS;
  }
}
