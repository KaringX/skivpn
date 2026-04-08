import 'package:skivpn/app/utils/platform_utils.dart';
import 'package:move_to_background/move_to_background.dart';
import 'package:window_manager/window_manager.dart';

abstract final class MoveToBackgroundUtils {
  static Future<void> moveToBackground({Duration? duration}) async {
    if (duration != null) {
      Future.delayed(const Duration(milliseconds: 300), () async {
        if (PlatformUtils.isMobile()) {
          await MoveToBackground.moveTaskToBack();
        } else if (PlatformUtils.isPC()) {
          await windowManager.hide();
        }
      });
    } else {
      if (PlatformUtils.isMobile()) {
        await MoveToBackground.moveTaskToBack();
      } else if (PlatformUtils.isPC()) {
        await windowManager.hide();
      }
    }
  }
}
