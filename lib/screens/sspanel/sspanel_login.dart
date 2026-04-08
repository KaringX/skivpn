import 'package:skivpn/app/modules/board_provider_manager.dart';
import 'package:skivpn/app/modules/board_session_persistent_manager.dart';
import 'package:skivpn/app/modules/profile_manager.dart';

class SSPanelLogin {
  static final Map<int, Function()> onEventLogin = {};
  static final Map<int, Function()> onEventLogout = {};

  static Future<BoardSessionLoginError?> login(
    BoardProviderConfig provider,
    String email,
    String password,
  ) async {
    final session = BoardSessionPersistentManager.instance().getOrCreate(
      provider,
      email,
    );
    if (session == null || session.ssPanel == null) {
      return BoardSessionLoginError(message: "unsupported provider type");
    }
    //session.ssPanel!.proxyUrl = "127.0.0.1:8888";
    final loginResponse = await session.ssPanel!.login(email, password);
    if (loginResponse.statusCode != 200 || loginResponse.ret != true) {
      return BoardSessionLoginError(
        session: session,
        httpStatusCode: loginResponse.statusCode,
        message: loginResponse.getFullMessage(),
      );
    }
    String? err = await getSubscribe(session);
    if (err != null) {
      await session.ssPanel?.logout();
      return BoardSessionLoginError(session: session, message: err);
    }

    onEventLogin.forEach((key, value) {
      value.call();
    });

    return null;
  }

  static Future<String?> getSubscribe(BoardSession session) async {
    if (session.ssPanel == null) {
      return null;
    }
    final userProfileUrlResponse = await session.ssPanel!
        .getUserProfileUrlAndToken();
    if (userProfileUrlResponse.statusCode != 200 ||
        userProfileUrlResponse.ret != true) {
      return userProfileUrlResponse.getFullMessage();
    }
    /*final userSubscribeResponse = await session.ssPanel!.getSubscribe(
      userProfileUrlResponse.data!.item2,
    );
    if (userSubscribeResponse.statusCode != 200 ||
        userSubscribeResponse.ret != true) {
      return userSubscribeResponse.getFullMessage();
    }*/

    final result = await ProfileManager.addRemote(
      userProfileUrlResponse.data!.item1,
      userAgent: session.provider.userAgent,
      xhwid: session.provider.xhwid,
      overwriteDns: session.provider.overwriteDns,
      urltestUrl: session.provider.urltestUrl,
    );
    if (result.error != null) {
      return result.error!.message;
    }

    return null;
  }

  static Future<void> logout() async {
    final session = BoardSessionPersistentManager.instance().current();
    if (session == null) {
      return;
    }
    onEventLogout.forEach((key, value) {
      value.call();
    });
    await session.ssPanel?.logout();
  }
}
