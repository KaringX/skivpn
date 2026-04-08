import 'package:flutter/material.dart';
import 'package:skivpn/app/modules/setting_manager.dart';
import 'package:skivpn/app/runtime/return_result.dart';
import 'package:skivpn/app/utils/platform_utils.dart';
import 'package:skivpn/app/utils/url_launcher_utils.dart';
import 'package:skivpn/screens/inapp_webview_screen.dart';

class WebviewHelper {
  static Future<bool> loadUrl(
    BuildContext context,
    String url,
    String viewTag, {
    String? title,
    bool useInappWebViewForPC = false,
    bool inappWebViewOpenExternal = false,
    bool refreshWhenLoaded = false,
    Map<String, String>? headers,
    Map<String, String>? cookies,
    Map<String, String>? localStorage,
  }) async {
    if (PlatformUtils.isPC()) {
      if (!useInappWebViewForPC) {
        ReturnResultError? error = await UrlLauncherUtils.loadUrl(url);
        return error != null;
      }
    }

    if (await InAppWebViewScreen.makeSureEnvironmentCreated()) {
      if (!context.mounted) {
        return true;
      }

      await Navigator.push(
        context,
        MaterialPageRoute(
          settings: InAppWebViewScreen.routSettings(viewTag),
          builder: (context) => InAppWebViewScreen(
            title: title ?? "",
            url: url,
            enableDebug: SettingManager.getConfig().dev,
            showOpenExternal: inappWebViewOpenExternal,
            refreshWhenLoaded: refreshWhenLoaded,
            headers: headers,
            cookies: cookies,
            localStorage: localStorage,
          ),
        ),
      );
      return true;
    }
    ReturnResultError? error = await UrlLauncherUtils.loadUrl(url);
    return error != null;
  }
}
