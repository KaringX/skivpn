// ignore_for_file: unused_catch_stack

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:skivpn/app/local_services/vpn_service.dart';
import 'package:skivpn/app/modules/clash_setting_manager.dart';
import 'package:skivpn/app/modules/setting_manager.dart';
import 'package:skivpn/app/utils/app_utils.dart';
import 'package:skivpn/app/utils/file_utils.dart';
import 'package:skivpn/app/utils/network_utils.dart';
import 'package:skivpn/app/utils/path_utils.dart';
import 'package:skivpn/app/utils/platform_utils.dart';
import 'package:skivpn/i18n/strings.g.dart';
import 'package:skivpn/screens/dialog_utils.dart';
import 'package:skivpn/screens/group_helper.dart';
import 'package:skivpn/screens/group_item_creator.dart';
import 'package:skivpn/screens/group_item_options.dart';
import 'package:skivpn/screens/group_screen.dart';
import 'package:skivpn/screens/richtext_viewer.screen.dart';
import 'package:skivpn/screens/theme_config.dart';
import 'package:skivpn/screens/webview_helper.dart';
import 'package:skivpn/screens/widgets/framework.dart';
import 'package:skivpn/screens/file_view_screen.dart';

class AboutScreen extends LasyRenderingStatefulWidget {
  static RouteSettings routSettings() {
    return const RouteSettings(name: "AboutScreen");
  }

  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends LasyRenderingState<AboutScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tcontext = Translations.of(context);
    Size windowSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.zero, child: AppBar()),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const SizedBox(
                        width: 50,
                        height: 30,
                        child: Icon(Icons.arrow_back_ios_outlined, size: 26),
                      ),
                    ),
                    SizedBox(
                      width: windowSize.width - 50 * 2,
                      child: Text(
                        tcontext.meta.about,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: ThemeConfig.kFontWeightTitle,
                          fontSize: ThemeConfig.kFontSizeTitle,
                        ),
                      ),
                    ),
                    const SizedBox(width: 50),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                child: SingleChildScrollView(
                  child: FutureBuilder(
                    future: getGroupOptions(),
                    builder:
                        (
                          BuildContext context,
                          AsyncSnapshot<List<GroupItem>> snapshot,
                        ) {
                          List<GroupItem> data = snapshot.hasData
                              ? snapshot.data!
                              : [];
                          return Column(
                            children: GroupItemCreator.createGroups(
                              context,
                              data,
                            ),
                          );
                        },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<List<GroupItem>> getGroupOptions() async {
    final tcontext = Translations.of(context);

    List<GroupItem> groupOptions = [];

    List<GroupItemOptions> options = [
      GroupItemOptions(
        textOptions: GroupItemTextOptions(
          name: tcontext.meta.name,
          text: AppUtils.getName(),
          onLongPress: () async {
            SettingManager.getConfig().dev = !SettingManager.getConfig().dev;
            setState(() {});
          },
        ),
      ),
      GroupItemOptions(
        textOptions: GroupItemTextOptions(
          name: tcontext.meta.version,
          text: AppUtils.getBuildinVersion(),
        ),
      ),
    ];

    groupOptions.add(GroupItem(options: options));

    if (SettingManager.getConfig().dev) {
      List<GroupItemOptions> options2 = [
        GroupItemOptions(
          pushOptions: GroupItemPushOptions(
            name: tcontext.meta.devOptions,
            onPush: () async {
              onTapDevOptions(SettingManager.getConfig().dev);
            },
          ),
        ),
      ];
      groupOptions.add(GroupItem(options: options2));
    }

    return groupOptions;
  }

  void onTapDevOptions(bool dev) async {
    final tcontext = Translations.of(context);
    Future<List<GroupItem>> getOptions(
      BuildContext context,
      SetStateCallback? setstate,
    ) async {
      bool connected = await VPNService.getStarted();
      List<GroupItemOptions> options = [
        if (PlatformUtils.isPC()) ...[
          GroupItemOptions(
            pushOptions: GroupItemPushOptions(
              name: tcontext.meta.openDir,
              onPush: () async {
                await FileUtils.openDirectory(await PathUtils.profileDir());
              },
            ),
          ),
        ],

        GroupItemOptions(
          pushOptions: GroupItemPushOptions(
            name: tcontext.meta.settingCore,
            onPush: () async {
              await GroupHelper.showClashSettings(context);
            },
          ),
        ),
        GroupItemOptions(
          pushOptions: GroupItemPushOptions(
            name: tcontext.meta.coreLog,
            onPush: () async {
              String content = "";
              final filePath = await PathUtils.serviceLogFilePath();
              final item = await FileUtils.readAsStringReverse(
                filePath,
                20 * 1024,
                false,
              );
              if (item != null) {
                content = item.item1;
              }
              if (!context.mounted) {
                return;
              }
              Navigator.push(
                context,
                MaterialPageRoute(
                  settings: RichtextViewScreen.routSettings(),
                  builder: (context) => RichtextViewScreen(
                    title: tcontext.meta.coreLog,
                    file: "",
                    content: content,
                    showAction: true,
                  ),
                ),
              );
            },
          ),
        ),
        if (connected) ...[
          GroupItemOptions(
            pushOptions: GroupItemPushOptions(
              name: "Core RunTime Profile",
              onPush: () async {
                late String content;
                try {
                  final path =
                      await PathUtils.serviceCoreRuntimeProfileFilePath();
                  content = await File(path).readAsString();
                } catch (err) {
                  if (!context.mounted) {
                    return;
                  }
                  DialogUtils.showAlertDialog(
                    context,
                    err.toString(),
                    showCopy: true,
                    showFAQ: true,
                    withVersion: true,
                  );
                  return;
                }
                if (!context.mounted) {
                  return;
                }
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    settings: FileViewScreen.routSettings(),
                    builder: (context) => FileViewScreen(
                      title: tcontext.meta.runtimeProfile,
                      content: content,
                    ),
                  ),
                );
              },
            ),
          ),
          GroupItemOptions(
            pushOptions: GroupItemPushOptions(
              name: tcontext.meta.board,
              onPush: () async {
                var setting = SettingManager.getConfig();
                if (setting.boardUrl.isEmpty) {
                  return;
                }
                final uri = Uri.tryParse(setting.boardUrl);
                if (uri == null) {
                  final msg = "${tcontext.meta.urlInvalid}:${setting.boardUrl}";
                  DialogUtils.showAlertDialog(context, msg, withVersion: true);
                  return;
                }
                final shortUrl = Uri(
                  scheme: uri.scheme,
                  userInfo: uri.userInfo,
                  host: uri.host,
                  port: uri.port,
                );
                String host = Platform.isIOS
                    ? await _getLocalAddress()
                    : "127.0.0.1";
                String secret = ClashSettingManager.getConfig().Secret ?? "";
                final url =
                    '${shortUrl.toString()}/?hostname=$host&port=${ClashSettingManager.getControlPort()}&secret=$secret&http=true';
                if (!context.mounted) {
                  return;
                }
                await WebviewHelper.loadUrl(
                  context,
                  url,
                  "onlineboard",
                  title: tcontext.meta.board,
                  inappWebViewOpenExternal: false,
                );
              },
            ),
          ),
        ],
      ];

      return [GroupItem(options: options)];
    }

    await Navigator.push(
      context,
      MaterialPageRoute(
        settings: GroupScreen.routSettings("devOptions"),
        builder: (context) => GroupScreen(
          title: tcontext.meta.devOptions,
          getOptions: getOptions,
        ),
      ),
    );
    setState(() {});
  }

  Future<String> _getLocalAddress() async {
    String ipLocal = "127.0.0.1";
    String ipInterface = ipLocal;

    List<NetInterfacesInfo> interfaces = await NetworkUtils.getInterfaces(
      addressType: InternetAddressType.IPv4,
    );
    if (interfaces.isNotEmpty) {
      ipInterface = interfaces.first.address;
    }
    for (var interf in interfaces) {
      if (interf.name.startsWith("en") || interf.name.startsWith("wlan")) {
        ipInterface = interf.address;
        break;
      }
    }

    return ipInterface;
  }
}
