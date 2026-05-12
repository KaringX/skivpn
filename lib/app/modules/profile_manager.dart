// ignore_for_file: unused_catch_stack, empty_catches

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:libclash_vpn_service/state.dart';
import 'package:path/path.dart' as path;
import 'package:skivpn/app/local_services/vpn_service.dart';
import 'package:skivpn/app/modules/setting_manager.dart';
import 'package:skivpn/app/runtime/return_result.dart';
import 'package:skivpn/app/utils/app_lifecycle_state_notify.dart';
import 'package:skivpn/app/utils/clash_yaml.dart';
import 'package:skivpn/app/utils/download_utils.dart';
import 'package:skivpn/app/utils/emoji_utils.dart';
import 'package:skivpn/app/utils/file_utils.dart';
import 'package:skivpn/app/utils/log.dart';
import 'package:skivpn/app/utils/path_utils.dart';
import 'package:skivpn/app/utils/platform_utils.dart';
import 'package:yaml/yaml.dart';

class ProxyGroups {
  String selectGroupName;
  List<dynamic> groups;
  List<ClashYamlOubboundOptions> outboundGroupsAndServers = [];

  ProxyGroups({
    this.selectGroupName = "",
    this.groups = const [],
    this.outboundGroupsAndServers = const [],
  });
}

class ProfileSetting {
  ProfileSetting({
    this.id = "",
    this.updateInterval,
    this.update,
    this.url = "",
    this.xhwid = false,
    this.overwriteDns = false,
    this.userAgent = "",
    this.urltestUrl = "",
    this.proxies = const [],
    this.currentProxy = "",
  });
  String id = "";
  Duration? updateInterval;
  DateTime? update;
  String url;
  String userAgent;
  bool xhwid = false;
  bool overwriteDns = false;
  num upload = 0;
  num download = 0;
  num total = 0;
  num? expire;
  String urltestUrl = "";
  num? filehash;
  List<ClashYamlOubboundOptions> proxies = [];
  String currentProxy = "";

  Map<String, dynamic> toJson() => {
    'id': id,
    'update_interval': updateInterval?.inSeconds,
    'update': update.toString(),
    'url': url,
    'user_agent': userAgent,
    'xhwid': xhwid,
    'overwrite_dns': overwriteDns,
    'upload': upload,
    'download': download,
    'total': total,
    'expire': expire,
    'urltest_url': urltestUrl,
    'filehash': filehash,
    'proxies': proxies.map((e) => e.toJson()).toList(),
    'current_proxy': currentProxy,
  };
  void fromJson(Map<String, dynamic>? map) {
    if (map == null) {
      return;
    }

    id = map['id'] ?? '';
    var updateIntervalTime = map['update_interval'];
    if (updateIntervalTime is int) {
      if (updateIntervalTime < 60) {
        updateIntervalTime = 24 * 60;
      }
      updateInterval = Duration(seconds: updateIntervalTime);
    }
    final updateTime = map['update'];
    if (updateTime is String) {
      update = DateTime.tryParse(updateTime);
    }
    url = map['url'] ?? '';
    userAgent = map['user_agent'] ?? '';
    xhwid = map['xhwid'] ?? false;
    overwriteDns = map['overwrite_dns'] ?? false;
    upload = map['upload'] ?? 0;
    download = map['download'] ?? 0;
    total = map['total'] ?? 0;
    final expireTime = map['expire'];
    if (expireTime is int) {
      expire = expireTime;
    }
    urltestUrl = map['urltest_url'] ?? '';
    filehash = map['filehash'];
    currentProxy = map['current_proxy'] ?? '';
    final proxiesMap = map['proxies'];
    if (proxiesMap is List) {
      List<ClashYamlOubboundOptions> proxies_ = [];
      for (var proxy in proxiesMap) {
        if (proxy is Map<String, dynamic>) {
          ClashYamlOubboundOptions opt = ClashYamlOubboundOptions();
          opt.fromJson(proxy);
          if (opt.name.isEmpty ||
              opt.type.isEmpty ||
              opt.server.isEmpty ||
              opt.port.isEmpty) {
            continue;
          }
          proxies_.add(opt);
        }
      }
      proxies = proxies_;
    }

    updateCurrentProxy();
  }

  bool isProxiesDiff(List<ClashYamlOubboundOptions> other) {
    if (proxies.length != other.length) {
      return true;
    }

    for (int index = 0; index < proxies.length; index += 1) {
      if (!proxies[index].isSame(other[index])) {
        return true;
      }
    }
    return false;
  }

  void updateCurrentProxy() {
    final proxyGroups = getProxyGroups();
    bool findCurrent = false;
    for (var p in proxyGroups.outboundGroupsAndServers) {
      if (p.name == currentProxy) {
        findCurrent = true;
        break;
      }
    }
    if (!findCurrent && proxyGroups.outboundGroupsAndServers.isNotEmpty) {
      currentProxy = getAutoSelectGroupName();
    }
  }

  void updateDelay(Map<String, int?> delayMap) {
    if (delayMap.isEmpty) {
      return;
    }
    for (var proxy in proxies) {
      proxy.delay = delayMap[proxy.name];
    }
  }

  static String getManualSelectGroupName() {
    return "manualSelect";
  }

  static String getLoadBalanceGroupName() {
    return "loadBalance";
  }

  static String getAutoSelectGroupName() {
    return "autoSelect";
  }

  ProxyGroups getProxyGroups() {
    List<ClashYamlOubboundOptions> outboundGroupsAndServers = proxies.toList();
    List<String> servers = [];
    for (var proxy in proxies) {
      servers.add(proxy.name);
    }
    final interval = 3600 * 12;
    final url = urltestUrl.isNotEmpty
        ? urltestUrl
        : "http://www.gstatic.com/generate_204";
    final autoName = getAutoSelectGroupName();
    final loadBalanceName = getLoadBalanceGroupName();
    final selectName = getManualSelectGroupName();
    final selector = {
      "name": selectName,
      "type": "select",
      "proxies": [autoName, loadBalanceName, ...servers],
    };
    final loadbance = {
      "name": loadBalanceName,
      "type": "load-balance",
      "strategy": "consistent-hashing",
      "include-all": true,
      "timeout": 3000,
      "interval": interval,
      "tolerance": 50,
      "max-failed-times": 5,
      "lazy": true,
      "url": url,
    };
    final autoSelect = {
      "name": autoName,
      "type": "url-test",
      "proxies": servers,
      "interval": interval,
      "url": url,
    };
    outboundGroupsAndServers.insertAll(0, [
      ClashYamlOubboundOptions(name: autoName, type: "url-test"),
      ClashYamlOubboundOptions(name: loadBalanceName, type: "load-balance"),
    ]);
    return ProxyGroups(
      selectGroupName: selectName,
      groups: [selector, autoSelect, loadbance],
      outboundGroupsAndServers: outboundGroupsAndServers,
    );
  }

  void updateSubscriptionTraffic(HttpHeaders? header) {
    if (header == null) {
      return;
    }
    //subscription-userinfo: upload=9579993656; download=92563554739; total=2684354560000; expire=1695781320
    List<String>? subscription = header["subscription-userinfo"];
    if (subscription == null || subscription.isEmpty) {
      return;
    }
    List<String> items = subscription[0].split(';');
    if (items.isEmpty) {
      return;
    }

    for (var item in items) {
      List<String> subitems = item.split('=');
      if (subitems.length != 2) {
        continue;
      }
      String key = subitems[0].trim();
      num? value = num.tryParse(subitems[1].trim());
      if (value == null) {
        continue;
      }

      switch (key) {
        case "upload":
          upload = value;
          break;
        case "download":
          download = value;
          break;
        case "total":
          total = value;
          break;
        case "expire":
          expire = value;
          break;
      }
    }
  }

  ProfileSetting clone() {
    ProfileSetting ps = ProfileSetting();
    ps.id = id;
    ps.updateInterval = updateInterval;
    ps.update = update;
    ps.url = url;
    ps.userAgent = userAgent;
    ps.xhwid = xhwid;
    ps.upload = upload;
    ps.download = download;
    ps.total = total;
    ps.expire = expire;
    ps.urltestUrl = urltestUrl;
    ps.filehash = filehash;
    ps.proxies = proxies.map((e) => e.clone()).toList();
    ps.currentProxy = currentProxy;

    return ps;
  }
}

class ProfileConfig {
  List<ProfileSetting> profiles = [];

  Map<String, dynamic> toJson() => {'profiles': profiles};

  void fromJson(Map<String, dynamic>? map) {
    if (map == null) {
      return;
    }
    final p = map['profiles'];
    if (p is List) {
      for (var value in p) {
        ProfileSetting ps = ProfileSetting();
        try {
          ps.fromJson(value);
          profiles.add(ps);
        } catch (err) {
          Log.w("ProfileConfig.fromJson exception ${err.toString()} ");
        }
      }
    }
  }
}

class ProfileManager {
  static const String yamlExtension = "yaml";
  static const String urlComment = "#url:";
  static final ProfileConfig _config = ProfileConfig();

  static final List<void Function(String, bool, bool, bool)> onEventUpdate = [];
  static final Set<String> updating = {};
  static Timer? _timerChecker;
  static bool _saving = false;

  static Future<void> init() async {
    await load();
    VPNService.onEventStateChanged.add((
      FlutterVpnServiceState state,
      Map<String, String> params,
    ) async {
      if (state == FlutterVpnServiceState.connected) {
        Future.delayed(const Duration(seconds: 3), () async {
          updateByTicker();
        });
      }
    });
    AppLifecycleStateNofity.onStateResumed(null, () {
      Future.delayed(const Duration(seconds: 3), () async {
        updateByTicker();
      });
    });
    Future.delayed(const Duration(seconds: 30), () async {
      updateByTicker();
    });
    if (PlatformUtils.isPC()) {
      _timerChecker = Timer.periodic(const Duration(minutes: 30), (timer) {
        updateByTicker();
      });
    }
  }

  static Future<void> uninit() async {
    _timerChecker?.cancel();
    _timerChecker = null;
    await save();
  }

  static Future<void> reload() async {
    final dir = await PathUtils.profilesDir();
    List<String> ids = [];
    List<String> idsToDelete = [];
    for (var profile in _config.profiles) {
      ids.add(profile.id);
    }
    _config.profiles = [];
    await load();
    for (var id in ids) {
      int index = _config.profiles.indexWhere((value) {
        return value.id == id;
      });
      if (index < 0) {
        idsToDelete.add(id);
      }
    }
    for (var id in idsToDelete) {
      final filePath = path.join(dir, id);
      await FileUtils.deletePath(filePath);
    }
  }

  static Future<void> save() async {
    if (_saving) {
      return;
    }
    _saving = true;
    String filePath = await PathUtils.profilesConfigFilePath();
    const JsonEncoder encoder = JsonEncoder.withIndent('  ');
    String content = encoder.convert(_config);
    try {
      await File(filePath).writeAsString(content, flush: true);
    } catch (err, stacktrace) {
      Log.w("ProfileManager.save exception  $filePath ${err.toString()}");
    }
    _saving = false;
  }

  static Future<void> load() async {
    String filePath = await PathUtils.profilesConfigFilePath();
    var file = File(filePath);
    bool exists = await file.exists();
    if (exists) {
      try {
        String content = await file.readAsString();
        if (content.isNotEmpty) {
          var config = jsonDecode(content);
          _config.fromJson(config);
        }
      } catch (err, stacktrace) {
        Log.w("ProfileManager.load exception ${err.toString()} ");
      }
    } else {
      await save();
    }
  }

  static Future<ReturnResultError?> prepare(ProfileSetting profile) async {
    String dir = await PathUtils.profilesDir();
    final filePath = path.join(dir, profile.id);
    try {
      if (!await File(filePath).exists()) {
        await update(profile.id);
      }
      return null;
    } catch (err) {
      return ReturnResultError(err.toString());
    }
  }

  static List<ProfileSetting> getProfiles() {
    return _config.profiles;
  }

  static String getIdByUrl(String url) {
    for (var profile in _config.profiles) {
      if (profile.url == url) {
        return profile.id;
      }
    }
    return "";
  }

  static ProfileSetting? getByUrl(String url) {
    if (url.isEmpty) {
      return null;
    }
    for (var profile in _config.profiles) {
      if (profile.url == url) {
        return profile;
      }
    }
    return null;
  }

  static void updateDelay(String url, Map<String, int?> delayMap) {
    if (url.isEmpty) {
      return;
    }
    for (var profile in _config.profiles) {
      if (profile.url == url) {
        profile.updateDelay(delayMap);
        break;
      }
    }
  }

  static Future<ReturnResult<String>> addRemote(
    String url, {
    String userAgent = "",
    bool xhwid = false,
    bool overwriteDns = false,
    String? urltestUrl,
  }) async {
    final uri = Uri.tryParse(url);
    if (uri == null) {
      return ReturnResult(error: ReturnResultError("invalid url"));
    }
    final id = "${url.hashCode}.yaml";
    final savePath = path.join(await PathUtils.profilesDir(), id);
    if (userAgent.isEmpty) {
      userAgent = SettingManager.getConfig().userAgent();
    }

    final result = await DownloadUtils.downloadWithPort(
      uri,
      savePath,
      userAgent,
      xhwid,
      null,
      timeout: const Duration(seconds: 30),
    );
    if (result.error != null) {
      return ReturnResult(error: result.error);
    }

    int index = _config.profiles.indexWhere((value) {
      return value.id == id;
    });
    Duration? updateInterval;
    final profileUpdateInterval = result.data?["profile-update-interval"];
    if (profileUpdateInterval != null && profileUpdateInterval.isNotEmpty) {
      updateInterval = Duration(
        hours: int.tryParse(profileUpdateInterval.first) ?? 0,
      );
      if (updateInterval.inHours < 1) {
        updateInterval = const Duration(days: 1);
      }
    }

    bool proxiesUpdated = false;
    bool fileUpdated = false;
    num fileLen = 0;
    try {
      fileLen = await File(savePath).length();
    } catch (err) {}
    if (index < 0) {
      final profile = ProfileSetting(
        id: id,
        updateInterval: updateInterval ?? const Duration(days: 1),
        update: DateTime.now(),
        url: url,
        userAgent: userAgent,
        xhwid: xhwid,
        overwriteDns: overwriteDns,
        urltestUrl: urltestUrl ?? "",
        currentProxy: ProfileSetting.getAutoSelectGroupName(),
      );
      final old = profile.proxies.toList();
      profile.updateSubscriptionTraffic(result.data);
      profile.proxies = await updateProxies(savePath, profile.proxies);
      profile.updateCurrentProxy();
      fileUpdated = true;
      profile.filehash = fileLen;
      proxiesUpdated = profile.isProxiesDiff(old);
      _config.profiles.add(profile);
    } else {
      var profile = _config.profiles[index];
      final old = profile.proxies.toList();
      profile.updateInterval = updateInterval ?? const Duration(days: 1);
      profile.update = DateTime.now();
      profile.url = url;
      profile.userAgent = userAgent;
      profile.xhwid = xhwid;
      profile.overwriteDns = overwriteDns;
      profile.urltestUrl = urltestUrl ?? "";
      profile.updateSubscriptionTraffic(result.data); //
      profile.proxies = await updateProxies(savePath, profile.proxies);
      profile.updateCurrentProxy();
      fileUpdated = profile.filehash != fileLen;
      profile.filehash = fileLen;
      proxiesUpdated = profile.isProxiesDiff(old);
    }
    Future.delayed(const Duration(milliseconds: 10), () async {
      for (var event in onEventUpdate) {
        event(id, true, fileUpdated, proxiesUpdated);
      }
    });
    await save();
    return ReturnResult(data: id);
  }

  static Future<ReturnResultError?> update(String id) async {
    if (updating.contains(id)) {
      return null;
    }
    int index = _config.profiles.indexWhere((value) {
      return value.id == id;
    });
    if (index < 0) {
      return null;
    }
    ProfileSetting profile = _config.profiles[index];
    final uri = Uri.tryParse(profile.url);
    if (uri == null) {
      return null;
    }
    updating.add(id);
    Future.delayed(const Duration(milliseconds: 10), () async {
      for (var event in onEventUpdate) {
        event(id, false, false, false);
      }
    });

    String userAgent = profile.userAgent;
    if (userAgent.isEmpty) {
      userAgent = SettingManager.getConfig().userAgent();
    }
    final savePath = path.join(await PathUtils.profilesDir(), id);
    final savePathTmp = "$savePath.tmp";
    final result = await DownloadUtils.downloadWithPort(
      uri,
      savePathTmp,
      userAgent,
      profile.xhwid,
      null,
      timeout: const Duration(seconds: 30),
    );
    profile.update = DateTime.now();
    bool proxiesUpdated = false;
    bool fileUpdated = false;
    if (result.error == null) {
      String renameError = "";
      for (var i = 0; i < 3; ++i) {
        try {
          var file = File(savePathTmp);
          await file.rename(savePath);
          renameError = "";
          break;
        } catch (err) {
          renameError = err.toString();
          await Future.delayed(const Duration(seconds: 1));
        }
      }

      final old = profile.proxies.toList();
      if (renameError.isNotEmpty) {
        updating.remove(id);
        await FileUtils.deletePath(savePathTmp);

        Future.delayed(const Duration(milliseconds: 10), () async {
          for (var event in onEventUpdate) {
            event(id, true, false, false);
          }
        });
        return ReturnResultError(
          "Rename file from [$savePathTmp] to [$savePath] failed: $renameError",
        );
      }

      num fileLen = 0;
      try {
        fileLen = await File(savePath).length();
      } catch (err) {}

      profile.updateSubscriptionTraffic(result.data);
      profile.proxies = await updateProxies(savePath, profile.proxies);
      profile.updateCurrentProxy();
      fileUpdated = profile.filehash != fileLen;
      profile.filehash = fileLen;
      proxiesUpdated = profile.isProxiesDiff(old);
    }
    await save();
    updating.remove(id);
    Future.delayed(const Duration(milliseconds: 10), () async {
      for (var event in onEventUpdate) {
        event(id, true, fileUpdated, proxiesUpdated);
      }
    });
    return result.error;
  }

  static Future<void> updateByTicker() async {
    DateTime now = DateTime.now();
    for (var profile in _config.profiles) {
      if (profile.updateInterval == null) {
        continue;
      }
      if (profile.update == null ||
          now.difference(profile.update!).inSeconds >=
              profile.updateInterval!.inSeconds) {
        await update(profile.id);
      }
    }
  }

  static Future<void> remove(String id) async {
    _config.profiles.removeWhere((p) => p.id == id);

    final filePath = path.join(await PathUtils.profilesDir(), id);
    await FileUtils.deletePath(filePath);
    await save();
  }

  static Future<void> removeAllProfile() async {
    var dir = await PathUtils.profilesDir();
    for (var profile in _config.profiles) {
      final filePath = path.join(dir, profile.id);
      await FileUtils.deletePath(filePath);
    }
    _config.profiles.clear();

    await save();
  }

  static ProfileSetting? getProfile(String id) {
    for (var profile in _config.profiles) {
      if (id == profile.id) {
        return profile;
      }
    }
    return null;
  }

  static Future<String> getProfilePath(String id) async {
    final filePath = path.join(await PathUtils.profilesDir(), id);
    return filePath;
  }

  static void updateProfile(String id, ProfileSetting profile) {
    for (int i = 0; i < _config.profiles.length; ++i) {
      if (_config.profiles[i].id == id) {
        _config.profiles[i] = profile;
        break;
      }
    }
  }

  static Future<List<ClashYamlOubboundOptions>> updateProxies(
    String filePath,
    List<ClashYamlOubboundOptions> proxies,
  ) async {
    Map<String, int?> delayMap = {};
    for (var proxy in proxies) {
      delayMap[proxy.name] = proxy.delay;
    }
    String kProxyName = "proxies";
    var content = await FileUtils.readStringByMatchStartAndEnd(
      filePath,
      (line) {
        return line.startsWith("$kProxyName:");
      },
      (line) {
        return !line.startsWith(" ") && !line.trimLeft().startsWith("-");
      },
    );

    if (content == null || content.isEmpty) {
      return proxies;
    }
    content = EmojiUtils.unemojify(content);
    try {
      var doc = loadYaml(content);
      if (doc == null || doc is! YamlMap) {
        return proxies;
      }
      final docProxies = doc[kProxyName];
      if (docProxies == null || (docProxies is! List)) {
        return proxies;
      }
      List<ClashYamlOubboundOptions> newProxies = [];
      for (var proxy in docProxies) {
        ClashYamlOubboundOptions clash = ClashYamlOubboundOptions();
        try {
          clash.fromYaml(proxy);
          if (clash.name.isEmpty ||
              clash.type.isEmpty ||
              clash.server.isEmpty ||
              clash.port.isEmpty) {
            continue;
          }
          clash.delay = delayMap[clash.name] ?? 300;
          newProxies.add(clash);
        } catch (err, stacktrace) {}
      }
      return newProxies;
    } catch (err, stacktrace) {
      return proxies;
    }
  }
}
