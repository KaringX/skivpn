// ignore_for_file: non_constant_identifier_names, empty_catches, no_leading_underscores_for_local_identifiers

import 'package:skivpn/app/utils/emoji_utils.dart';
import 'package:yaml/yaml.dart';

class ClashYamlOubboundOptions {
  String name = "";
  String type = "";
  String server = "";
  String port = "";
  int? delay;
  int? hash;

  ClashYamlOubboundOptions({
    this.name = "",
    this.type = "",
    this.server = "",
    this.port = "",
    this.delay,
    this.hash,
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'type': type,
    'server': server,
    'port': port,
    'delay': delay,
    'hash': hash,
  };
  void fromJson(Map<String, dynamic>? map) {
    if (map == null) {
      return;
    }

    name = map["name"] ?? "";
    type = map["type"] ?? "";
    server = map["server"] ?? "";
    port = map["port"] ?? "";
    delay = map["delay"];
    hash = map["hash"];
  }

  void fromYaml(YamlMap? map) {
    if (map == null) {
      return;
    }

    name = (map["name"] ?? "").toString();
    name = emojiName(name).trim();
    if (name.contains("%")) {
      try {
        name = Uri.decodeComponent(name);
      } catch (err) {}
    }

    type = map["type"] ?? "";
    var serverRaw = map["server"];
    if (serverRaw is String) {
      server = serverRaw;
    } else if (serverRaw is YamlList) {
      if (serverRaw.isNotEmpty) {
        server = serverRaw[0];
      }
    }
    port = (map["port"] ?? "").toString();
    hash = 0;
    map.forEach((key, value) {
      hash = hash! | key.hashCode | value.hashCode;
    });
  }

  bool isSame(ClashYamlOubboundOptions other) {
    return hash == other.hash;
  }

  static ClashYamlOubboundOptions? fromYamlStatic(YamlMap? map) {
    if (map == null) {
      return null;
    }
    ClashYamlOubboundOptions opt = ClashYamlOubboundOptions();
    opt.fromYaml(map);
    return opt;
  }

  static String emojiName(String name) {
    name = EmojiUtils.emojify(name).trim();
    if (name.contains("%")) {
      try {
        name = Uri.decodeComponent(name);
      } catch (err) {}
    }
    return name;
  }

  ClashYamlOubboundOptions clone() {
    return ClashYamlOubboundOptions(
      name: name,
      type: type,
      server: server,
      port: port,
      delay: delay,
    );
  }
}
