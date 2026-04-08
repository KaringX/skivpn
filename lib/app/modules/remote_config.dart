class RemoteConfig {
  static const String kDefaultHost = "skivpn.com";
  static const String kDefaultConfig =
      "https://dot.$kDefaultHost/ski_config.json";
  static const String kDefaultAutoUpdate =
      "https://dot.$kDefaultHost/ski_autoupdate.json";

  static const String kDefaultTutorial = "https://$kDefaultHost/guide/";
  static const String kDefaultFaq = "https://$kDefaultHost/guide/faq/";
  static const String kDefaultDownload = "https://$kDefaultHost/download/";
  static const String kDefaultTelegram = "https://t.me/SkiVPNApp";

  String latestCheck = "";

  String host = kDefaultHost;
  String config = kDefaultConfig;
  String autoUpdate = kDefaultAutoUpdate;

  String tutorial = kDefaultTutorial;
  String faq = kDefaultFaq;
  String download = kDefaultDownload;
  String telegram = kDefaultTelegram;

  Map<String, dynamic> toJson() {
    Map<String, dynamic> ret = {'latest_check': latestCheck};

    if (tutorial != kDefaultTutorial) {
      ret["tutorial"] = tutorial;
    }
    if (faq != kDefaultFaq) {
      ret["faq"] = faq;
    }
    if (download != kDefaultDownload) {
      ret["download"] = download;
    }
    if (telegram != kDefaultTelegram) {
      ret["telegram"] = telegram;
    }

    return ret;
  }

  void fromJson(Map<String, dynamic>? map) {
    if (map == null) {
      return;
    }
    latestCheck = map["latest_check"] ?? "";

    tutorial = map["tutorial"] ?? kDefaultTutorial;
    faq = map["faq"] ?? kDefaultFaq;
    download = map["download"] ?? kDefaultDownload;
    telegram = map["telegram"] ?? kDefaultTelegram;
  }

  static RemoteConfig fromJsonStatic(Map<String, dynamic>? map) {
    RemoteConfig config = RemoteConfig();
    config.fromJson(map);
    return config;
  }
}
