import 'package:board_service/xboard/xboard_models.dart';
import 'package:skivpn/app/modules/board_provider_manager.dart';
import 'package:skivpn/app/modules/board_session_persistent_manager.dart';
import 'package:skivpn/app/modules/profile_manager.dart';

class XboardLogin {
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
    if (session == null || session.xboard == null) {
      return BoardSessionLoginError(message: "unsupported provider type");
    }
    //session.xboard!.proxyUrl = "127.0.0.1:8888";
    final loginRequest = LoginRequest(email: email, password: password);
    final loginResponse = await session.xboard!.login(loginRequest);
    if (loginResponse.statusCode != 200) {
      return BoardSessionLoginError(
        session: session,
        httpStatusCode: loginResponse.statusCode,
        message: loginResponse.getFullMessage(),
      );
    }
    String? err = await getSubscribe(session);
    if (err != null) {
      await session.xboard?.logout();
      return BoardSessionLoginError(session: session, message: err);
    }

    onEventLogin.forEach((key, value) {
      value.call();
    });

    return null;
  }

  static Future<String?> getSubscribe(
    BoardSession session, {
    bool reloadProfile = true,
  }) async {
    /*final userInfoResponse = await session.xboard!.getUserInfo();
    if (userInfoResponse.statusCode != 200) {
      return userInfoResponse.getFullMessage();
    }
    if (userInfoResponse.data!.planId == null ||
        userInfoResponse.data!.planId == 0) {
      return null;
    }*/
    if (session.xboard == null) {
      return null;
    }
    final subscribeResponse = await session.xboard!.getSubscribe();
    if (subscribeResponse.statusCode != 200) {
      return subscribeResponse.getFullMessage();
    }
    if (reloadProfile) {
      final result = await ProfileManager.addRemote(
        subscribeResponse.data!.subscribeUrl,
        userAgent: session.provider.userAgent,
        xhwid: session.provider.xhwid,
        overwriteDns: session.provider.overwriteDns,
        urltestUrl: session.provider.urltestUrl,
      );
      if (result.error != null) {
        return result.error!.message;
      }
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
    await session.xboard?.logout();
  }
}
