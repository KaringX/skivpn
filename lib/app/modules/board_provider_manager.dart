import 'dart:convert';
import 'dart:io';

import 'package:skivpn/app/modules/board_session_persistent_manager.dart';
import 'package:skivpn/app/private/app_url_utils_private.dart';
import 'package:skivpn/app/runtime/return_result.dart';
import 'package:skivpn/app/utils/http_utils.dart';
import 'package:skivpn/app/utils/path_utils.dart';
import 'package:skivpn/i18n/strings.g.dart';

enum BoardProviderType {
  v2board(name: "v2board"),
  xboard(name: "xboard"),
  sspanel(name: "sspanel");

  const BoardProviderType({required this.name});
  final String name;

  static bool support(String name) {
    return {v2board.name, xboard.name, sspanel.name}.contains(name);
  }
}

class BoardProviderConfigError {
  int code;
  String? msg;
  BoardProviderConfigError({this.code = 0, this.msg});
  void fromJson(Map<String, dynamic>? map) {
    if (map == null) {
      return;
    }
    code = map["code"] ?? 0;
    msg = map["msg"];
  }
}

class BoardProviderConfig {
  BoardProviderType type;
  String id;
  String name;
  List<String> names = [];
  String domain;
  List<String> domains = [];
  String userAgent;
  String urltestUrl;
  bool xhwid;
  bool web;
  bool overwrite = true;
  bool overwriteDns = true;
  String version;
  String userAgreement;
  String clientServiceUrl;
  String subscriptionChannelUrl;
  String loginUrl;
  String? registerUrl;
  String forgotPasswordUrl;
  String planUrl;
  String homeUrl;
  String appIconUrl;
  List<String> benefits = [];
  String botCookie;
  DateTime? lastUpdated;
  BoardProviderConfig({
    this.type = BoardProviderType.v2board,
    this.id = '',
    this.name = '',
    this.names = const [],
    this.domain = '',
    this.domains = const [],
    this.userAgent = '',
    this.urltestUrl = '',
    this.xhwid = false,
    this.web = false,
    this.overwrite = true,
    this.overwriteDns = true,
    this.version = '',
    this.userAgreement = '',
    this.clientServiceUrl = '',
    this.subscriptionChannelUrl = '',
    this.loginUrl = '',
    this.registerUrl,
    this.forgotPasswordUrl = '',
    this.planUrl = '',
    this.homeUrl = '',
    this.appIconUrl = '',
    this.benefits = const [],
    this.botCookie = '', //'cf_clearance',
    this.lastUpdated,
  });

  Map<String, dynamic> toJson() => {
    'type': type.name,
    'id': id,
    'name': name,
    'names': names,
    'domain': domain,
    'domains': domains,
    'user_agent': userAgent,
    'urltest_url': urltestUrl,
    'xhwid': xhwid,
    'web': web,
    'overwrite': overwrite,
    'overwrite_dns': overwriteDns,
    'version': version,
    'user_agreement': userAgreement,
    'client_service_url': clientServiceUrl,
    'subscription_channel_url': subscriptionChannelUrl,
    'login_url': loginUrl,
    'register_url': registerUrl,
    'forgot_password_url': forgotPasswordUrl,
    'plan_url': planUrl,
    'home_url': homeUrl,
    'app_icon_url': appIconUrl,
    'benefits': benefits,
    'bot_cookie': botCookie,
    //'last_updated': lastUpdated?.microsecondsSinceEpoch,
  };
  void fromJson(Map<String, dynamic>? map) {
    if (map == null) {
      return;
    }
    final type_ = map["type"] ?? "";
    type = BoardProviderType.values.firstWhere(
      (e) => e.name == type_,
      orElse: () => BoardProviderType.v2board,
    );
    id = map["id"] ?? map["pid"] ?? "";
    name = map["name"] ?? "";
    names = List<String>.from(map["names"] ?? map["nicknames"] ?? []);
    if (name.isNotEmpty && !names.contains(name)) {
      names.add(name);
    }
    domain = map["domain"] ?? "";
    domains = List<String>.from(map["domains"] ?? []);
    userAgent = map["user_agent"] ?? "";
    urltestUrl = map["urltest_url"] ?? "";
    xhwid = map["xhwid"] ?? false;
    web = map["web"] ?? false;
    overwrite = map["overwrite"] ?? true;
    overwriteDns = map["overwrite_dns"] ?? true;
    version = map["version"] ?? "";
    userAgreement = map["user_agreement"] ?? "";
    clientServiceUrl = map["client_service_url"] ?? "";
    subscriptionChannelUrl = map["subscription_channel_url"] ?? "";
    loginUrl = map["login_url"] ?? "";
    registerUrl = map["register_url"];
    forgotPasswordUrl = map["forgot_password_url"] ?? "";
    planUrl = map["plan_url"] ?? "";
    homeUrl = map["home_url"] ?? "";
    appIconUrl = map["app_icon_url"] ?? "";
    benefits = List<String>.from(map["benefits"] ?? []);
    botCookie = map["bot_cookie"] ?? ""; //"cf_clearance";
    // lastUpdated = map["last_updated"] != null
    //     ? DateTime.fromMicrosecondsSinceEpoch(map["last_updated"])
    //    : null;
  }
}

class BoardProviderManager {
  static List<BoardProviderConfig> _providers = [];
  static bool _saving = false;
  static Future<void> updateSessionProviders() async {
    await BoardSessionPersistentManager.instance().updateProviders(_providers);
  }

  static List<BoardProviderConfig> getProviders() {
    return _providers;
  }

  static BoardProviderConfig? getProviderById(String id) {
    if (id.isEmpty) {
      return null;
    }
    for (final provider in _providers) {
      if (provider.id == id) {
        return provider;
      }
    }
    return null;
  }

  static Future<ReturnResult<BoardProviderConfig>> getProvider(
    String name,
  ) async {
    if (name.isEmpty) {
      return ReturnResult(
        error: ReturnResultError("getProvider: name is empty"),
      );
    }

    for (final provider in _providers) {
      if (provider.names.contains(name)) {
        if (provider.lastUpdated != null &&
            DateTime.now().difference(provider.lastUpdated!) <=
                const Duration(hours: 1)) {
          if (provider.name != name) {
            provider.name = name;
            await _save();
          }
          return ReturnResult(data: provider);
        }
        break;
      }
    }
    var result = await HttpUtils.httpPostRequest(
      "https://${BoardProviderPrivate.getDomain()}/dotfile?nick=${Uri.encodeComponent(name)}",
      null,
      null,
      "",
      const Duration(seconds: 10),
      null,
      null,
      null,
      checkStatuscode: false,
    );

    if (result.error != null &&
        result.error!.message.contains("http response timeout")) {
      result = await HttpUtils.httpPostRequest(
        "https://${BoardProviderPrivate.getDomainBackup()}/dotfile?nick=${Uri.encodeComponent(name)}",
        null,
        null,
        "",
        const Duration(seconds: 10),
        null,
        null,
        null,
        checkStatuscode: false,
      );
    }
    if (result.error != null) {
      for (final provider in _providers) {
        if (provider.names.contains(name)) {
          if (provider.name != name) {
            provider.name = name;
            await _save();
          }
          return ReturnResult(data: provider);
        }
      }
      return ReturnResult(error: ReturnResultError(result.error!.message));
    }

    if (result.data!.item1 != 200) {
      final updated = _providers
          .where((element) => element.names.contains(name))
          .isNotEmpty;
      _providers.removeWhere((element) => element.names.contains(name));
      if (updated) {
        await _save();
      }
    }

    if (result.data!.item1 != 200) {
      return ReturnResult(
        error: ReturnResultError(
          result.data!.item1 == 410
              ? "${t.loginScreen.unsupportedProvider}: $name"
              : "getProvider $name: http statuscode ${result.data!.item1}",
        ),
      );
    }

    final decodedBody = jsonDecode(result.data!.item2);
    BoardProviderConfig config = BoardProviderConfig();
    BoardProviderConfigError error = BoardProviderConfigError();
    error.fromJson(decodedBody);
    config.fromJson(decodedBody);
    if (error.code != 0) {
      final updated = _providers
          .where((element) => element.names.contains(name))
          .isNotEmpty;
      _providers.removeWhere((element) => element.names.contains(name));
      if (updated) {
        await _save();
      }
      return ReturnResult(
        error: ReturnResultError(
          error.msg ?? "getProvider $name: error code ${error.code}",
        ),
      );
    }
    if (config.id.isEmpty) {
      return ReturnResult(
        error: ReturnResultError(
          error.msg ?? "getProvider $name: invalid provider config, empty id",
        ),
      );
    }
    if (!config.names.contains(name)) {
      config.names.add(name);
    }
    if (config.name != name) {
      config.name = name;
    }

    var updated = _providers
        .where((element) => element.id == config.id)
        .isEmpty;

    config.lastUpdated = DateTime.now();
    if (updated) {
      _providers.add(config);
    } else {
      updated = true;
      for (var i = 0; i < _providers.length; i++) {
        if (_providers[i].id == config.id) {
          _providers[i] = config;
          break;
        }
      }
    }

    await _save();

    return ReturnResult(data: config);
  }

  static Future<void> init() async {
    await _load();
  }

  static Future<void> _save() async {
    if (_saving) {
      return;
    }
    _saving = true;
    final file = File(await PathUtils.providersConfigFilePath());
    const JsonEncoder encoder = JsonEncoder.withIndent('  ');
    String content = encoder.convert(_providers);
    await file.writeAsString(content);
    _saving = false;
  }

  static Future<void> _load() async {
    _providers = [];
    final file = File(await PathUtils.providersConfigFilePath());
    if (await file.exists()) {
      try {
        String content = await file.readAsString();
        List<dynamic> jsonData = jsonDecode(content);
        _providers = jsonData.map((item) {
          var config = BoardProviderConfig();
          config.fromJson(item);
          return config;
        }).toList();
      } catch (e) {}
    } else {
      await _save();
    }
    await updateSessionProviders();
    final sessionNames = BoardSessionPersistentManager.instance().getAllNames();
    for (var name in sessionNames) {
      getProvider(name);
    }
  }
}
