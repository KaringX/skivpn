// ignore_for_file: empty_catches, no_leading_underscores_for_local_identifiers

import 'dart:convert';
import 'dart:io';

import 'package:skivpn/app/local_services/vpn_service.dart';
import 'package:skivpn/app/modules/remote_config.dart';
import 'package:skivpn/app/modules/remote_config_manager.dart';
import 'package:skivpn/app/runtime/return_result.dart';
import 'package:skivpn/app/utils/app_url_utils.dart';
import 'package:skivpn/app/utils/http_utils.dart';
import 'package:skivpn/app/utils/log.dart';
import 'package:skivpn/app/utils/url_launcher_utils.dart';
import 'package:tuple/tuple.dart';

class AutoupdateItem {
  String platform = "";

  List<String> channels = [];

  List<String> abis = [];
  String version = "";
  String url = "";
  String sha256 = "";
  String fileName = "";
  List<String> updateChannel = []; //stable, beta

  void fromJson(Map<String, dynamic>? map) {
    if (map == null) {
      return;
    }
    platform = map["platform"] ?? "";

    var _channels = map["channels"] ?? [];
    for (var i in _channels) {
      channels.add(i as String);
    }

    var _abis = map["abis"] ?? [];
    for (var i in _abis) {
      abis.add(i as String);
    }
    version = map["version"] ?? "";
    url = map["url"] ?? "";
    sha256 = map["sha256"] ?? "";
    fileName = map["file_name"] ?? "";
    var _versionChannel = map["version_channel"] ?? [];
    for (var i in _versionChannel) {
      updateChannel.add(i as String);
    }
  }
}

abstract final class AutoupdateUtils {
  static Future<ReturnResult<List<AutoupdateItem>>> getAutoupdate(
    bool withQueryParams,
  ) async {
    String url = RemoteConfigManager.getConfig().autoUpdate;
    if (withQueryParams) {
      String queryParams = await AppUrlUtils.getQueryParamsForUrl(bodyLen: 1);
      url = UrlLauncherUtils.reorganizationUrl(url, queryParams) ?? url;
    }

    late ReturnResult<Tuple2<int, String>> response;
    List<int?> ports = await VPNService.getPortsByPrefer(false);
    for (var port in ports) {
      response = await HttpUtils.httpGetRequest(
        url,
        port,
        null,
        const Duration(seconds: 10),
        null,
        null,
      );
      if (response.error == null) {
        break;
      }
    }
    List<AutoupdateItem> items = [];
    if (response.error != null) {
      return ReturnResult(error: response.error);
    }
    try {
      if (response.data!.item2.isNotEmpty) {
        var decodedResponse = jsonDecode(response.data!.item2);
        if (decodedResponse is List) {
          for (var i in decodedResponse) {
            AutoupdateItem item = AutoupdateItem();
            item.fromJson(i);
            if (item.platform == Platform.operatingSystem) {
              items.add(item);
            }
          }
        }
      }
    } catch (err, _) {
      Log.i('AutoupdateUtils getAutoupdate exception ${err.toString()}');
    }
    return ReturnResult(data: items);
  }

  static Future<ReturnResult<RemoteConfig>> getRemoteConfig() async {
    RemoteConfig rc = RemoteConfig();
    String url = RemoteConfigManager.getConfig().config;
    late ReturnResult<Tuple2<int, String>> response;
    List<int?> ports = await VPNService.getPortsByPrefer(false);
    for (var port in ports) {
      response = await HttpUtils.httpGetRequest(
        url,
        port,
        null,
        const Duration(seconds: 10),
        null,
        null,
      );
      if (response.error == null) {
        break;
      }
    }

    if (response.error != null) {
      return ReturnResult(error: response.error);
    }
    try {
      if (response.data!.item2.isNotEmpty) {
        var decodedResponse = jsonDecode(response.data!.item2);
        rc.fromJson(decodedResponse);
      }
    } catch (err, _) {
      Log.i('AutoupdateUtils getRemoteConfig exception ${err.toString()}');
    }
    return ReturnResult(data: rc);
  }
}
