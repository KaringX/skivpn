import 'dart:convert';
import 'dart:io';

import 'package:board_service/board_session_persistent.dart';
import 'package:board_service/crypto.dart';
import 'package:board_service/sspanel_uim/sspanel_uim_client.dart'
    as sspanel_client;
import 'package:board_service/v2board/v2board_client.dart' as v2board_client;
import 'package:board_service/xboard/xboard_client.dart' as xboard_client;
import 'package:skivpn/app/modules/board_provider_manager.dart';
import 'package:skivpn/app/modules/setting_manager.dart';
import 'package:skivpn/app/utils/path_utils.dart';

class BoardSessionLoginError {
  BoardSession? session;
  int? httpStatusCode;
  String? message;

  BoardSessionLoginError({this.session, this.httpStatusCode, this.message});
}

class BoardSession {
  BoardProviderConfig provider;
  String account;
  String authData;
  String subscribeUrl;
  Map<String, dynamic> _data = {};

  v2board_client.V2BoardClient? _v2board;
  xboard_client.XboardClient? _xboard;
  sspanel_client.SSPanelUimClient? _ssPanel;
  BoardSession({
    required this.provider,
    required this.account,
    required this.authData,
    required this.subscribeUrl,
  });
  void updateData(String api, Map<String, dynamic>? data) {
    if (api.isEmpty) {
      _data.clear();
      return;
    }
    _data[api] = data;
  }

  Map<String, dynamic> data() {
    return _data;
  }

  Map<String, String>? headers() {
    if (_v2board != null) {
      return _v2board!.getAuthHeaders();
    } else if (_xboard != null) {
      return _xboard!.getAuthHeaders();
    } else if (_ssPanel != null) {
      return _ssPanel!.getAuthHeaders();
    }
    return null;
  }

  Map<String, String>? cookies() {
    if (_v2board != null) {
      return _v2board!.getAuthCookies();
    } else if (_xboard != null) {
      return _xboard!.getAuthCookies();
    } else if (_ssPanel != null) {
      return _ssPanel!.getAuthCookies();
    }
    return null;
  }

  Map<String, String>? localStorage() {
    if (_v2board != null) {
      return _v2board!.getAuthLocalStorage();
    } else if (_xboard != null) {
      return _xboard!.getAuthLocalStorage();
    } else if (_ssPanel != null) {
      return _ssPanel!.getAuthLocalStorage();
    }
    return null;
  }

  Map<String, dynamic> toJson() => {
    'provider': provider.toJson(),
    'account': account,
    'auth_data': Crypto.encrypt(account, authData),
    'subscribe_url': subscribeUrl,
    'data': _data,
  };
  void fromJson(Map<String, dynamic>? map) {
    if (map == null) {
      return;
    }
    if (map["provider"] != null) {
      final config = BoardProviderConfig();
      config.fromJson(map["provider"]);
      provider = config;
    }
    account = map["account"] ?? "";
    authData = Crypto.decrypt(account, map["auth_data"] ?? "");
    subscribeUrl = map["subscribe_url"] ?? "";
    _data = map["data"] ?? {};
  }

  v2board_client.V2BoardClient? get v2board => _v2board;
  xboard_client.XboardClient? get xboard => _xboard;
  sspanel_client.SSPanelUimClient? get ssPanel => _ssPanel;
}

class BoardSessionHeadersAndCookies {
  Map<String, String> headers = {};
  List<String> cookies = [];

  BoardSessionHeadersAndCookies(this.headers, this.cookies);
  Map<String, dynamic> toJson() => {'headers': headers, 'cookies': cookies};
  void fromJson(Map<String, dynamic>? map) {
    if (map == null) {
      return;
    }

    cookies = List.from(map["cookies"]);
    final h = map["headers"];
    if (h is Map<String, dynamic>) {
      h.forEach((key, value) {
        headers[key] = value as String;
      });
    }
  }

  void clear() {
    headers.clear();
    cookies.clear();
  }
}

class BoardSessionConfig {
  Map<String, BoardSessionHeadersAndCookies> headersAndCookies = {};
  List<BoardSession> sessions = [];

  Map<String, dynamic> toJson() => {
    'headers_and_cookies': headersAndCookies.map(
      (key, value) => MapEntry(key, value.toJson()),
    ),
    'sessions': sessions.map((s) => s.toJson()).toList(),
  };
  void fromJson(Map<String, dynamic>? map) {
    headersAndCookies.clear();
    sessions.clear();
    if (map == null) {
      return;
    }
    final sessionsMap = map["sessions"];
    if (sessionsMap is List) {
      for (var item in sessionsMap) {
        final session = BoardSession(
          provider: BoardProviderConfig(),
          account: "",
          authData: "",
          subscribeUrl: "",
        );
        session.fromJson(item);
        if (session.provider.id.isEmpty || session.account.isEmpty) {
          continue;
        }
        sessions.add(session);
      }
    }
    final headersAndCookiesMap = map["headers_and_cookies"];
    if (headersAndCookiesMap is Map<String, dynamic>) {
      headersAndCookiesMap.forEach((key, value) {
        final boc = BoardSessionHeadersAndCookies({}, []);
        boc.fromJson(value);
        headersAndCookies[key] = boc;
      });
    }
  }
}

class BoardSessionPersistentManager implements BoardSessionPersistent {
  static final BoardSessionPersistentManager _instance =
      BoardSessionPersistentManager();
  final BoardSessionConfig _config = BoardSessionConfig();

  bool _isSaving = false;
  List<Function()> onEventReloginRequired = [];

  @override
  void updateLoginAuthData(String id, String account, String authData) {
    if (id.isEmpty || account.isEmpty) {
      return;
    }
    for (int i = 0; i < _config.sessions.length; i++) {
      if (_config.sessions[i].provider.id == id &&
          _config.sessions[i].account == account) {
        _config.sessions[i].authData = authData;
        _config.sessions[i].updateData('', {});
        _save();
        return;
      }
    }
  }

  @override
  void logout(String id, String account) {
    if (id.isEmpty || account.isEmpty) {
      return;
    }
    for (int i = 0; i < _config.sessions.length; i++) {
      if (_config.sessions[i].provider.id == id &&
          _config.sessions[i].account == account) {
        _config.sessions[i].authData = "";
        _config.sessions[i].subscribeUrl = "";
        _config.sessions[i].updateData('', {});
        _save();
        return;
      }
    }
  }

  @override
  void update(String id, String account, String api, dynamic data) {
    if (id.isEmpty || account.isEmpty || api.isEmpty) {
      return;
    }
    for (int i = 0; i < _config.sessions.length; i++) {
      var session = _config.sessions[i];
      if (session.provider.id == id && session.account == account) {
        session.updateData(api, data);
        _save();
        return;
      }
    }
  }

  @override
  void updateSubscribeUrl(String id, String account, String subscribeUrl) {
    if (id.isEmpty || account.isEmpty) {
      return;
    }
    //subscribeUrl = ""; //todo for test
    for (int i = 0; i < _config.sessions.length; i++) {
      var session = _config.sessions[i];
      if (session.provider.id == id && session.account == account) {
        session.subscribeUrl = subscribeUrl;
        _save();
        return;
      }
    }
  }

  @override
  dynamic get(String id, String account, String api) {
    if (id.isEmpty || account.isEmpty || api.isEmpty) {
      return null;
    }
    for (var session in _config.sessions) {
      if (session.provider.id == id && session.account == account) {
        return session.data()[api];
      }
    }
    return null;
  }

  static BoardSessionPersistentManager instance() {
    return _instance;
  }

  static Future<void> init() async {
    await _instance._load();
  }

  void updateHeadersAndCookies(
    String cookie,
    Map<String, String> headers,
    List<String> cookies,
  ) {
    _config.headersAndCookies[cookie] = BoardSessionHeadersAndCookies(
      headers,
      cookies,
    );

    _save();
  }

  BoardSession? getOrCreate(BoardProviderConfig provider, String account) {
    if (provider.id.isEmpty || account.isEmpty) {
      return null;
    }
    for (int i = 0; i < _config.sessions.length; i++) {
      if (_config.sessions[i].provider.id == provider.id &&
          _config.sessions[i].account == account) {
        _config.sessions[i].provider = provider;
        if (i != 0) {
          _config.sessions.insert(0, _config.sessions.removeAt(i));
        }
        _save();
        return _config.sessions[0];
      }
    }

    final newSession = BoardSession(
      provider: provider,
      account: account,
      authData: "",
      subscribeUrl: "",
    );
    final useagent = newSession.provider.userAgent.isNotEmpty
        ? newSession.provider.userAgent
        : SettingManager.getConfig().userAgent();
    final baseUrl = "https://${provider.domain}";
    if (newSession.provider.type == BoardProviderType.v2board) {
      newSession._v2board = v2board_client.V2BoardClient(
        baseUrl: baseUrl,
        id: newSession.provider.id,
        persistent: this,
      );
      newSession._v2board!.userAgent = useagent;
      newSession._v2board!.setVersion(newSession.provider.version);
    } else if (newSession.provider.type == BoardProviderType.xboard) {
      newSession._xboard = xboard_client.XboardClient(
        baseUrl: baseUrl,
        id: newSession.provider.id,
        persistent: this,
      );
      newSession._xboard!.userAgent = useagent;
    } else if (newSession.provider.type == BoardProviderType.sspanel) {
      newSession._ssPanel = sspanel_client.SSPanelUimClient(
        baseUrl: baseUrl,
        id: newSession.provider.id,
        persistent: this,
      );
      newSession._ssPanel!.userAgent = useagent;
    } else {
      return null;
    }

    _config.sessions.insert(0, newSession);
    _save();
    return newSession;
  }

  BoardSession? current() {
    if (_config.sessions.isEmpty) {
      return null;
    }
    return _config.sessions.first;
  }

  Future<void> updateProviders(List<BoardProviderConfig> providers) async {
    Map<String, BoardProviderConfig> updatedProviderIds = {};
    for (var provider in providers) {
      updatedProviderIds[provider.id] = provider;
    }
    _config.sessions.removeWhere(
      (session) => !updatedProviderIds.containsKey(session.provider.id),
    );
    for (int i = 0; i < _config.sessions.length; i++) {
      _config.sessions[i].provider =
          updatedProviderIds[_config.sessions[i].provider.id]!;
    }
    await _save();
  }

  void _updateProvider(BoardSession session, BoardProviderConfig provider) {
    final useagent = session.provider.userAgent.isNotEmpty
        ? session.provider.userAgent
        : SettingManager.getConfig().userAgent();
    final baseUrl = "https://${provider.domain}";
    if (session.provider.type == BoardProviderType.v2board) {
      session._v2board ??= v2board_client.V2BoardClient(
        baseUrl: baseUrl,
        id: session.provider.id,
        persistent: this,
      );
      session._v2board!.baseUrl = baseUrl;
      session._v2board!.userAgent = useagent;
      session._v2board!.setVersion(session.provider.version);
      session._v2board!.setAccount(session.account);
      session._v2board!.setAuthToken(session.authData);
    } else if (session.provider.type == BoardProviderType.xboard) {
      session._xboard ??= xboard_client.XboardClient(
        baseUrl: baseUrl,
        id: session.provider.id,
        persistent: this,
      );
      session._xboard!.baseUrl = baseUrl;
      session._xboard!.userAgent = useagent;
      session._xboard!.setAccount(session.account);
      session._xboard!.setAuthToken(session.authData);
    } else if (session.provider.type == BoardProviderType.sspanel) {
      session._ssPanel ??= sspanel_client.SSPanelUimClient(
        baseUrl: baseUrl,
        id: session.provider.id,
        persistent: this,
      );
      session._ssPanel!.baseUrl = baseUrl;
      session._ssPanel!.userAgent = useagent;
      session._ssPanel!.setAccount(session.account);
      session._ssPanel!.setAuthToken(session.authData);
    } else {
      return;
    }
    session.provider = provider;
  }

  Future<void> _save() async {
    if (_isSaving) return;
    _isSaving = true;
    final filePath = await PathUtils.boardSessionFilePath();
    final file = File(filePath);
    const JsonEncoder encoder = JsonEncoder.withIndent('  ');
    String content = encoder.convert(_config);
    await file.writeAsString(content);
    _isSaving = false;
  }

  Future<void> _load() async {
    _config.sessions.clear();
    _config.headersAndCookies.clear();

    final filePath = await PathUtils.boardSessionFilePath();
    final file = File(filePath);
    if (!await file.exists()) {
      return;
    }
    final content = await file.readAsString();
    if (content.isEmpty) {
      return;
    }
    final dynamic jsonData = json.decode(content);
    if (jsonData is! Map<String, dynamic>) {
      return;
    }
    _config.fromJson(jsonData);
    for (var session in _config.sessions) {
      _updateProvider(session, session.provider);
      if (session.provider.botCookie.isNotEmpty) {
        final headersAndCookies =
            _config.headersAndCookies[session.provider.botCookie];
        if (headersAndCookies != null) {
          if (session.provider.type == BoardProviderType.v2board) {
            session.v2board?.setHeadersAndCookiesForBot(
              headersAndCookies.headers,
              headersAndCookies.cookies,
            );
          } else if (session.provider.type == BoardProviderType.xboard) {
            session.xboard?.setHeadersAndCookiesForBot(
              headersAndCookies.headers,
              headersAndCookies.cookies,
            );
          } else if (session.provider.type == BoardProviderType.sspanel) {
            session.ssPanel?.setHeadersAndCookiesForBot(
              headersAndCookies.headers,
              headersAndCookies.cookies,
            );
          }
        }
      }
    }
  }

  void relogin() {
    for (var callback in onEventReloginRequired) {
      callback.call();
    }
  }
}
