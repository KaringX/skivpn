import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:intl/intl.dart';
import 'package:skivpn/app/modules/board_provider_manager.dart';
import 'package:skivpn/app/modules/board_session_persistent_manager.dart';
import 'package:skivpn/i18n/strings.g.dart';
import 'package:skivpn/screens/inapp_webview_screen.dart';

class BotHelper {
  Future<bool> handle403(
    BuildContext context,
    BoardProviderConfig provider,
    BoardSessionLoginError sessionLoginError,
    Function(bool) callback,
  ) async {
    if (provider.botCookie.isEmpty) {
      return false;
    }
    if (!await InAppWebViewScreen.makeSureEnvironmentCreated()) {
      return false;
    }
    if (!context.mounted) {
      return false;
    }
    bool handled = false;
    final tcontext = Translations.of(context);
    await Navigator.push(
      context,
      MaterialPageRoute(
        settings: InAppWebViewScreen.routeSettings("botHelper"),
        builder: (context) => InAppWebViewScreen(
          title: tcontext.loginScreen.login,
          url: provider.loginUrl,
          enableDebug: true,
          showOpenExternal: false,
          refreshWhenLoaded: false,
          clearAllCookies: true,
          onLoadStop: (String url, Map<String, String> headers, List<Cookie> cookies) {
            List<String> cookiesForBot = [];
            for (var cookie in cookies) {
              if (cookie.name == provider.botCookie) {
                DateTime dt = DateTime.fromMillisecondsSinceEpoch(
                  (cookie.expiresDate ?? 0) * 1000,
                );
                String gmtTime =
                    '${DateFormat('EEE, dd MMM yyyy HH:mm:ss', 'en_US').format(dt.toUtc())} GMT';
                cookiesForBot.add(
                  "${cookie.name}=${cookie.value}; expires=$gmtTime; domain=${cookie.domain}; secure; HttpOnly; path=${cookie.path}",
                );
                break;
              }
            }
            if (cookiesForBot.isNotEmpty) {
              BoardSessionPersistentManager.instance().updateHeadersAndCookies(
                provider.botCookie,
                headers,
                cookiesForBot,
              );
              if (provider.type == BoardProviderType.v2board) {
                sessionLoginError.session!.v2board?.setHeadersAndCookiesForBot(
                  headers,
                  cookiesForBot,
                );
              } else if (provider.type == BoardProviderType.xboard) {
                sessionLoginError.session!.xboard?.setHeadersAndCookiesForBot(
                  headers,
                  cookiesForBot,
                );
              } else if (provider.type == BoardProviderType.sspanel) {
                sessionLoginError.session!.ssPanel?.setHeadersAndCookiesForBot(
                  headers,
                  cookiesForBot,
                );
              }
              handled = true;
              callback(false);
              return true;
            }

            return false;
          },
        ),
      ),
    );
    return handled;
  }
}
