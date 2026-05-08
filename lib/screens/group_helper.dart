// ignore_for_file: unused_catch_stack, empty_catches

import 'dart:async';
import 'dart:io';

import 'package:skivpn/app/clash/clash_config.dart';
import 'package:skivpn/app/local_services/vpn_service.dart';
import 'package:skivpn/app/modules/auto_update_manager.dart';
import 'package:skivpn/app/modules/clash_setting_manager.dart';
import 'package:skivpn/app/modules/profile_manager.dart';
import 'package:skivpn/app/modules/remote_config_manager.dart';
import 'package:skivpn/app/modules/setting_manager.dart';
import 'package:skivpn/app/runtime/return_result.dart';
import 'package:skivpn/app/utils/network_utils.dart';
import 'package:skivpn/app/utils/platform_utils.dart';
import 'package:skivpn/app/utils/url_launcher_utils.dart';
import 'package:skivpn/i18n/strings.g.dart';
import 'package:skivpn/screens/dialog_utils.dart';
import 'package:skivpn/screens/group_item_creator.dart';
import 'package:skivpn/screens/group_item_options.dart';
import 'package:skivpn/screens/group_screen.dart';
import 'package:skivpn/screens/language_settings_screen.dart';
import 'package:skivpn/screens/list_add_screen.dart';
import 'package:skivpn/screens/perapp_android_screen.dart';
import 'package:skivpn/screens/version_update_screen.dart';
import 'package:skivpn/screens/webview_helper.dart';
import 'package:skivpn/screens/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:libclash_vpn_service/vpn_service.dart';
import 'package:url_launcher/url_launcher.dart';

class GroupHelper {
  static Future<void> newVersionUpdate(BuildContext context) async {
    AutoUpdateCheckVersion versionCheck = AutoUpdateManager.getVersionCheck();
    if (!versionCheck.newVersion) {
      return;
    }
    var remoteConfig = RemoteConfigManager.getConfig();
    String url = remoteConfig.download.isEmpty
        ? versionCheck.url
        : remoteConfig.download;
    if (AutoUpdateManager.isSupport()) {
      String? installerNew = await AutoUpdateManager.checkReplace();
      if (!context.mounted) {
        return;
      }
      if (installerNew != null) {
        await Navigator.push(
          context,
          MaterialPageRoute(
            settings: VersionUpdateScreen.routSettings(),
            builder: (context) => const VersionUpdateScreen(),
          ),
        );
      } else {
        await UrlLauncherUtils.loadUrl(
          url,
          mode: LaunchMode.externalApplication,
        );
      }
    } else {
      await UrlLauncherUtils.loadUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  static Future<void> showHelp(BuildContext context) async {
    Future<List<GroupItem>> getOptions(
      BuildContext context,
      SetStateCallback? setstate,
    ) async {
      final tcontext = Translations.of(context);

      List<GroupItemOptions> options = [
        GroupItemOptions(
          pushOptions: GroupItemPushOptions(
            name: tcontext.meta.download,
            onPush: () async {
              var remoteConfig = RemoteConfigManager.getConfig();
              await UrlLauncherUtils.loadUrl(
                remoteConfig.download,
                mode: LaunchMode.externalApplication,
              );
            },
          ),
        ),
        /*GroupItemOptions(
          pushOptions: GroupItemPushOptions(
            name: tcontext.meta.tutorial,
            onPush: () async {
              var remoteConfig = RemoteConfigManager.getConfig();
              await WebviewHelper.loadUrl(
                context,
                remoteConfig.tutorial,
                tcontext.meta.tutorial,
              );
            },
          ),
        ),*/
        GroupItemOptions(
          pushOptions: GroupItemPushOptions(
            name: tcontext.meta.faq,
            onPush: () async {
              var remoteConfig = RemoteConfigManager.getConfig();
              await WebviewHelper.loadUrl(
                context,
                remoteConfig.faq,
                tcontext.meta.faq,
              );
            },
          ),
        ),
        /*GroupItemOptions(
          pushOptions: GroupItemPushOptions(
            name: "Telegram",
            onPush: () async {
              var remoteConfig = RemoteConfigManager.getConfig();
              await WebviewHelper.loadUrl(
                context,
                remoteConfig.telegram,
                "Telegram",
              );
            },
          ),
        ),*/
      ];

      return [GroupItem(options: options)];
    }

    final tcontext = Translations.of(context);
    await Navigator.push(
      context,
      MaterialPageRoute(
        settings: GroupScreen.routSettings("help"),
        builder: (context) =>
            GroupScreen(title: tcontext.meta.help, getOptions: getOptions),
      ),
    );
    SettingManager.save();
  }

  static Future<void> showAppSettings(BuildContext context) async {
    Future<List<GroupItem>> getOptions(
      BuildContext context,
      SetStateCallback? setstate,
    ) async {
      final tcontext = Translations.of(context);
      var setting = SettingManager.getConfig();
      List<GroupItemOptions> options0 = [
        GroupItemOptions(
          pushOptions: GroupItemPushOptions(
            name: tcontext.meta.reset,
            onPush: () async {
              SettingManager.reset();

              /*Provider.of<Themes>(
                context,
                listen: false,
              ).setTheme(setting.ui.theme, true);*/
              TextFieldEx.popupEdit = setting.ui.tvMode;
            },
          ),
        ),
      ];
      List<GroupItemOptions> options = [
        GroupItemOptions(
          pushOptions: GroupItemPushOptions(
            name: tcontext.meta.language,
            icon: Icons.language_outlined,
            text: tcontext.locales[setting.languageTag],
            textWidthPercent: 0.5,
            onPush: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  settings: LanguageSettingsScreen.routSettings(),
                  builder: (context) => const LanguageSettingsScreen(
                    canPop: true,
                    canGoBack: true,
                  ),
                ),
              );
            },
          ),
        ),
        /*GroupItemOptions(
          stringPickerOptions: GroupItemStringPickerOptions(
            name: tcontext.meta.theme,
            selected: setting.ui.theme,
            strings: [
              ThemeDefine.kThemeLight,
              ThemeDefine.kThemeDark,
              ThemeDefine.kThemeSystem,
            ],
            textWidthPercent: 0.3,
            onPicker: (String? selected) async {
              if (selected == null) {
                return;
              }
              setting.ui.theme = selected;
              Provider.of<Themes>(
                context,
                listen: false,
              ).setTheme(selected, true);
            },
          ),
        ),*/
        if (Platform.isAndroid) ...[
          GroupItemOptions(
            switchOptions: GroupItemSwitchOptions(
              name: tcontext.meta.tvMode,
              switchValue: setting.ui.tvMode,
              onSwitch: (bool value) async {
                setting.ui.tvMode = value;
                TextFieldEx.popupEdit = setting.ui.tvMode;
              },
            ),
          ),
        ],
        if (PlatformUtils.isMobile()) ...[
          GroupItemOptions(
            switchOptions: GroupItemSwitchOptions(
              name: tcontext.meta.autoOrientation,
              switchValue: setting.ui.autoOrientation,
              onSwitch: (bool value) async {
                setting.ui.autoOrientation = value;
                if (value) {
                  SystemChrome.setPreferredOrientations([
                    DeviceOrientation.portraitUp,
                    DeviceOrientation.landscapeLeft,
                    DeviceOrientation.portraitDown,
                    DeviceOrientation.landscapeRight,
                  ]);
                } else {
                  SystemChrome.setPreferredOrientations([
                    DeviceOrientation.portraitUp,
                  ]);
                }
              },
            ),
          ),
        ],
        if (AutoUpdateManager.isSupport()) ...[
          GroupItemOptions(
            stringPickerOptions: GroupItemStringPickerOptions(
              name: tcontext.meta.updateChannel,
              selected: setting.autoUpdateChannel,
              strings: AutoUpdateManager.updateChannels(),
              textWidthPercent: 0.3,
              onPicker: (String? selected) async {
                if (selected == null || setting.autoUpdateChannel == selected) {
                  return;
                }
                setting.autoUpdateChannel = selected;
                AutoUpdateManager.updateChannelChanged();
              },
            ),
          ),
        ],
        if (AutoUpdateManager.isSupport()) ...[
          GroupItemOptions(
            switchOptions: GroupItemSwitchOptions(
              name: tcontext.meta.autoDownloadPkg,
              switchValue: SettingManager.getConfig().autoDownloadUpdatePkg,
              onSwitch: (bool value) async {
                setting.autoDownloadUpdatePkg = value;
              },
            ),
          ),
        ],
      ];

      List<GroupItemOptions> options4 = [
        GroupItemOptions(
          switchOptions: GroupItemSwitchOptions(
            name: tcontext.meta.launchAtStartup,
            switchValue: await VPNService.getLaunchAtStartup(),
            onSwitch: (bool value) async {
              if (!VPNService.isRunAsAdmin()) {
                DialogUtils.showAlertDialog(
                  context,
                  tcontext.meta.launchAtStartupRunAsAdmin,
                  showCopy: true,
                  showFAQ: false,
                  withVersion: true,
                );
                return;
              }
              ReturnResultError? err = await VPNService.setLaunchAtStartup(
                value,
              );
              if (err != null) {
                if (!context.mounted) {
                  return;
                }
                DialogUtils.showAlertDialog(
                  context,
                  err.message,
                  showCopy: true,
                  showFAQ: false,
                  withVersion: true,
                );
              }
            },
          ),
        ),
      ];
      List<GroupItemOptions> options5 = [
        if (Platform.isWindows) ...[
          GroupItemOptions(
            switchOptions: GroupItemSwitchOptions(
              name: tcontext.meta.hideAfterLaunch,
              switchValue: setting.ui.hideAfterLaunch,
              onSwitch: (bool value) async {
                setting.ui.hideAfterLaunch = value;
              },
            ),
          ),
        ],
        GroupItemOptions(
          switchOptions: GroupItemSwitchOptions(
            name: tcontext.meta.autoConnectAfterLaunch,
            switchValue: setting.autoConnectAfterLaunch,
            onSwitch: (bool value) async {
              setting.autoConnectAfterLaunch = value;
            },
          ),
        ),
        GroupItemOptions(
          switchOptions: GroupItemSwitchOptions(
            name: tcontext.meta.autoSetSystemProxy,
            switchValue: setting.autoSetSystemProxy,
            onSwitch: (bool value) async {
              setting.autoSetSystemProxy = value;
            },
          ),
        ),
        if (PlatformUtils.isPC()) ...[
          GroupItemOptions(
            pushOptions: GroupItemPushOptions(
              name: tcontext.meta.bypassSystemProxy,
              onPush: !setting.autoSetSystemProxy
                  ? null
                  : () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          settings: ListAddScreen.routSettings(
                            "systemProxyBypassDomain",
                          ),
                          builder: (context) => ListAddScreen(
                            title: tcontext.meta.bypassSystemProxy,
                            data: setting.systemProxyBypassDomain,
                          ),
                        ),
                      );
                    },
            ),
          ),
        ],
      ];

      List<GroupItemOptions> options7 = [
        GroupItemOptions(
          switchOptions: GroupItemSwitchOptions(
            name: tcontext.meta.excludeFromRecent,
            switchValue: setting.excludeFromRecent,
            onSwitch: (bool value) async {
              setting.excludeFromRecent = value;
              final err = await FlutterVpnService.setExcludeFromRecents(value);
              if (err != null) {
                if (!context.mounted) {
                  return;
                }
                DialogUtils.showAlertDialog(
                  context,
                  err,
                  showCopy: true,
                  showFAQ: true,
                  withVersion: true,
                );
              }
            },
          ),
        ),
        GroupItemOptions(
          switchOptions: GroupItemSwitchOptions(
            name: tcontext.meta.wakeLock,
            switchValue: setting.wakeLock,
            onSwitch: (bool value) async {
              setting.wakeLock = value;
            },
          ),
        ),
        GroupItemOptions(
          switchOptions: GroupItemSwitchOptions(
            name: tcontext.meta.autoConnectAtBoot,
            switchValue: setting.autoConnectAtBoot,
            tips:
                "${tcontext.meta.reconnectTakesEffect};${tcontext.meta.autoConnectAtBootTips}",
            onSwitch: (bool value) async {
              setting.autoConnectAtBoot = value;
            },
          ),
        ),
      ];
      List<GroupItemOptions> options8 = [
        GroupItemOptions(
          switchOptions: GroupItemSwitchOptions(
            name: tcontext.meta.hideDockIcon,
            tips: tcontext.meta.restartTakesEffect,
            switchValue: setting.hideDockIcon,
            onSwitch: (bool value) async {
              setting.hideDockIcon = value;
            },
          ),
        ),
      ];

      List<GroupItem> gitems = [
        GroupItem(options: options0),
        GroupItem(options: options),
      ];
      if (Platform.isWindows) {
        gitems.add(GroupItem(options: options4));
      }
      if (PlatformUtils.isPC()) {
        gitems.add(GroupItem(options: options5));
      }

      if (Platform.isAndroid) {
        gitems.add(GroupItem(options: options7));
      }
      if (Platform.isMacOS) {
        gitems.add(GroupItem(options: options8));
      }

      return gitems;
    }

    final tcontext = Translations.of(context);
    await Navigator.push(
      context,
      MaterialPageRoute(
        settings: GroupScreen.routSettings("appSettings"),
        builder: (context) => GroupScreen(
          title: tcontext.meta.settingApp,
          getOptions: getOptions,
        ),
      ),
    );
    SettingManager.save();
  }

  static Future<void> showClashSettings(BuildContext context) async {
    final tcontext = Translations.of(context);
    Future<List<GroupItem>> getOptions(
      BuildContext context,
      SetStateCallback? setstate,
    ) async {
      var setting = ClashSettingManager.getConfig();
      var extensions = setting.Extension!;
      final logLevels = ClashLogLevel.toList();

      List<GroupItemOptions> options1 = [
        GroupItemOptions(
          stringPickerOptions: GroupItemStringPickerOptions(
            name: "log-level",
            tips: "log-level",
            selected: logLevels.contains(setting.LogLevel)
                ? setting.LogLevel
                : logLevels.last,
            strings: logLevels,
            onPicker: (String? selected) async {
              setting.LogLevel = selected;
            },
          ),
        ),
        if (Platform.isAndroid) ...[
          GroupItemOptions(
            pushOptions: GroupItemPushOptions(
              name: tcontext.PerAppAndroidScreen.title,
              onPush: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    settings: PerAppAndroidScreen.routSettings(),
                    builder: (context) => const PerAppAndroidScreen(),
                  ),
                );
              },
            ),
          ),
        ],
        GroupItemOptions(
          textFormFieldOptions: GroupItemTextFieldOptions(
            name: "Pprof Address",
            text: extensions.PprofAddr,
            hint: "127.0.0.1:4578",
            textWidthPercent: 0.5,
            onChanged: (String value) {
              extensions.PprofAddr = value;
            },
          ),
        ),
        GroupItemOptions(
          pushOptions: GroupItemPushOptions(
            name: "Pprof",
            onPush: () async {
              if (extensions.PprofAddr == null ||
                  extensions.PprofAddr!.isEmpty) {
                return;
              }
              await UrlLauncherUtils.loadUrl(
                "http://${extensions.PprofAddr}/debug/pprof/",
              );
            },
          ),
        ),
      ];

      List<GroupItemOptions> options2 = [
        GroupItemOptions(
          pushOptions: GroupItemPushOptions(
            name: "tun",
            tips: "tun",
            onPush: () async {
              showClashSettingsTUN(context);
            },
          ),
        ),
      ];

      List<GroupItemOptions> options3 = [
        GroupItemOptions(
          pushOptions: GroupItemPushOptions(
            name: tcontext.meta.dns,
            tips: "dns",
            onPush: () async {
              showClashSettingsDNS(context);
            },
          ),
        ),
      ];

      List<GroupItem> groups = [];

      groups.addAll([
        GroupItem(options: options1),
        GroupItem(options: options2),
        GroupItem(options: options3),
      ]);

      return groups;
    }

    await Navigator.push(
      context,
      MaterialPageRoute(
        settings: GroupScreen.routSettings("clashSettings"),
        builder: (context) => GroupScreen(
          title: tcontext.meta.settingCore,
          getOptions: getOptions,
        ),
      ),
    );
    ClashSettingManager.save();

    ProfileManager.save();
  }

  static Future<void> showClashSettingsTUN(BuildContext context) async {
    final tcontext = Translations.of(context);
    Future<List<GroupItem>> getOptions(
      BuildContext context,
      SetStateCallback? setstate,
    ) async {
      var setting = ClashSettingManager.getConfig();

      var tun = setting.Tun!;
      var extensions = setting.Extension!;
      final tunStacks = ClashTunStack.toList();
      List<GroupItemOptions> options = [
        GroupItemOptions(
          switchOptions: GroupItemSwitchOptions(
            name: "overwrite",
            switchValue: tun.OverWrite,
            onSwitch: (bool value) async {
              tun.OverWrite = value;
            },
          ),
        ),
        GroupItemOptions(
          switchOptions: GroupItemSwitchOptions(
            name: tcontext.meta.enable,
            tips: "enable",
            switchValue: tun.Enable,
            onSwitch: tun.OverWrite != true
                ? null
                : (bool value) async {
                    tun.Enable = value;
                  },
          ),
        ),
        GroupItemOptions(
          textFormFieldOptions: GroupItemTextFieldOptions(
            name: tcontext.tun.inet4Address,
            text: tun.Inet4Address?.first ?? ClashSettingManager.iNet4Address,
            textWidthPercent: 0.6,
            onChanged: (String value) {
              final parts = value.split('/');
              if (parts.length != 2) {
                return;
              }
              if (!NetworkUtils.isIpv4(parts[0])) {
                return;
              }
              tun.Inet4Address = [value];
            },
          ),
        ),
        GroupItemOptions(
          stringPickerOptions: GroupItemStringPickerOptions(
            name: tcontext.tun.stack,
            tips: "stack",
            selected: tunStacks.contains(tun.Stack)
                ? tun.Stack
                : tunStacks.first,
            strings: tunStacks,
            onPicker: tun.OverWrite != true || tun.Enable != true
                ? null
                : (String? selected) async {
                    tun.Stack = selected;
                  },
          ),
        ),
        GroupItemOptions(
          switchOptions: GroupItemSwitchOptions(
            name: tcontext.tun.dnsHijack,
            tips: "dns-hijack",
            switchValue: tun.DNSHijack?.isNotEmpty,
            onSwitch: tun.OverWrite != true || tun.Enable != true
                ? null
                : (bool value) async {
                    tun.DNSHijack = value
                        ? [ClashSettingManager.dnsHijack]
                        : null;
                  },
          ),
        ),
        GroupItemOptions(
          switchOptions: GroupItemSwitchOptions(
            name: tcontext.tun.strictRoute,
            tips: "strict-route",
            switchValue: tun.StrictRoute,
            onSwitch: tun.OverWrite != true || tun.Enable != true
                ? null
                : (bool value) async {
                    tun.StrictRoute = value;
                  },
          ),
        ),
        if (Platform.isIOS || Platform.isMacOS) ...[
          GroupItemOptions(
            switchOptions: GroupItemSwitchOptions(
              name: tcontext.tun.tunDefaultRoute,
              switchValue:
                  extensions.Tun.autoRouteUseSubRangesByDefault != true,
              onSwitch: tun.OverWrite != true || tun.Enable != true
                  ? null
                  : (bool value) async {
                      extensions.Tun.autoRouteUseSubRangesByDefault = !value;
                    },
            ),
          ),
          GroupItemOptions(
            switchOptions: GroupItemSwitchOptions(
              name: "includeAllNetworks",
              tips: "iOS 14.0+;macOS 10.15+",
              switchValue: extensions.Tun.includeAllNetworks,
              onSwitch: tun.OverWrite != true || tun.Enable != true
                  ? null
                  : (bool value) async {
                      extensions.Tun.includeAllNetworks = value;
                    },
            ),
          ),
          GroupItemOptions(
            switchOptions: GroupItemSwitchOptions(
              name: "excludeLocalNetworks",
              tips: "iOS 14.2+;macOS 10.15+",
              switchValue: extensions.Tun.excludeLocalNetworks,
              onSwitch: tun.OverWrite != true || tun.Enable != true
                  ? null
                  : (bool value) async {
                      extensions.Tun.excludeLocalNetworks = value;
                    },
            ),
          ),
          GroupItemOptions(
            switchOptions: GroupItemSwitchOptions(
              name: "excludeCellularServices",
              tips: "iOS 16.4+;macOS 13.3+",
              switchValue: extensions.Tun.excludeCellularServices,
              onSwitch: tun.OverWrite != true || tun.Enable != true
                  ? null
                  : (bool value) async {
                      extensions.Tun.excludeCellularServices = value;
                    },
            ),
          ),
          GroupItemOptions(
            switchOptions: GroupItemSwitchOptions(
              name: "excludeAPNs",
              tips: "iOS 16.4+;macOS 13.3+",
              switchValue: extensions.Tun.excludeApns,
              onSwitch: tun.OverWrite != true || tun.Enable != true
                  ? null
                  : (bool value) async {
                      extensions.Tun.excludeApns = value;
                    },
            ),
          ),
          GroupItemOptions(
            switchOptions: GroupItemSwitchOptions(
              name: "excludeDeviceCommunication",
              tips: "iOS 17.4+;macOS 14.4+",
              switchValue: extensions.Tun.excludeDeviceCommunication,
              onSwitch: tun.OverWrite != true || tun.Enable != true
                  ? null
                  : (bool value) async {
                      extensions.Tun.excludeDeviceCommunication = value;
                    },
            ),
          ),
          GroupItemOptions(
            switchOptions: GroupItemSwitchOptions(
              name: "enforceRoutes",
              tips: "iOS 14.2+;macOS 11.0+",
              switchValue: extensions.Tun.enforceRoutes,
              onSwitch: tun.OverWrite != true || tun.Enable != true
                  ? null
                  : (bool value) async {
                      extensions.Tun.enforceRoutes = value;
                    },
            ),
          ),
        ],
        if (PlatformUtils.isPC()) ...[
          GroupItemOptions(
            switchOptions: GroupItemSwitchOptions(
              name: tcontext.tun.icmpForward,
              tips: "disable-icmp-forwarding",
              switchValue:
                  tun.DisableICMPForwarding == false ||
                  tun.DisableICMPForwarding == null,
              onSwitch: tun.OverWrite != true || tun.Enable != true
                  ? null
                  : (bool value) async {
                      tun.DisableICMPForwarding = !value;
                    },
            ),
          ),
        ],
      ];
      List<GroupItemOptions> options1 = [];
      if (Platform.isAndroid) {
        options1.addAll([
          GroupItemOptions(
            switchOptions: GroupItemSwitchOptions(
              name: tcontext.tun.allowBypass,
              switchValue: extensions.Tun.httpProxy.AllowBypass,
              onSwitch: tun.OverWrite != true || tun.Enable != true
                  ? null
                  : (bool value) async {
                      extensions.Tun.httpProxy.AllowBypass = value;
                    },
            ),
          ),
        ]);
      }
      if (Platform.isAndroid || Platform.isIOS) {
        options1.addAll([
          GroupItemOptions(
            switchOptions: GroupItemSwitchOptions(
              name: tcontext.tun.appendHttpProxy,
              switchValue: extensions.Tun.httpProxy.Enable,
              onSwitch: tun.OverWrite != true || tun.Enable != true
                  ? null
                  : (bool value) async {
                      extensions.Tun.httpProxy.Enable = value;
                      extensions.Tun.httpProxy.Server = value
                          ? "127.0.0.1"
                          : null;
                      extensions.Tun.httpProxy.ServerPort = value
                          ? setting.MixedPort
                          : null;
                    },
            ),
          ),
          GroupItemOptions(
            pushOptions: GroupItemPushOptions(
              name: tcontext.tun.bypassHttpProxyDomain,
              onPush: tun.OverWrite != true || tun.Enable != true
                  ? null
                  : () async {
                      extensions.Tun.httpProxy.BypassDomain ??= [];
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          settings: ListAddScreen.routSettings(
                            "HttpProxyBypassDomain",
                          ),
                          builder: (context) => ListAddScreen(
                            title: tcontext.tun.bypassHttpProxyDomain,
                            data: extensions.Tun.httpProxy.BypassDomain!,
                          ),
                        ),
                      );
                    },
            ),
          ),
        ]);
      }
      if (Platform.isIOS) {
        options1.addAll([
          GroupItemOptions(
            switchOptions: GroupItemSwitchOptions(
              name: tcontext.meta.hideVpn,
              tips: tcontext.meta.hideVpnTips,
              switchValue: tun.RouteExcludeAddress?.contains("0.0.0.0/31"),
              onSwitch: (bool value) async {
                tun.RouteExcludeAddress = ["0.0.0.0/31", "::/127"];
              },
            ),
          ),
        ]);
      }

      return [GroupItem(options: options), GroupItem(options: options1)];
    }

    await Navigator.push(
      context,
      MaterialPageRoute(
        settings: GroupScreen.routSettings("tun"),
        builder: (context) => GroupScreen(title: "tun", getOptions: getOptions),
      ),
    );
  }

  static Future<void> showClashSettingsDNS(BuildContext context) async {
    final tcontext = Translations.of(context);
    Future<List<GroupItem>> getOptions(
      BuildContext context,
      SetStateCallback? setstate,
    ) async {
      var setting = ClashSettingManager.getConfig();
      var dns = setting.DNS!;

      final enhancedModes = ClashDnsEnhancedMode.toList();
      final enhancedModesTuple = ClashDnsEnhancedMode.toTupleList();
      final fakeIPFilterModes = ClashFakeIPFilterMode.toList();
      List<GroupItemOptions> options = [
        GroupItemOptions(
          switchOptions: GroupItemSwitchOptions(
            name: "overwrite",
            switchValue: dns.OverWrite,
            onSwitch: (bool value) async {
              dns.OverWrite = value;
            },
          ),
        ),
        GroupItemOptions(
          switchOptions: GroupItemSwitchOptions(
            name: "enable",
            tips: "enable",
            switchValue: dns.Enable,
            onSwitch: dns.OverWrite != true
                ? null
                : (bool value) async {
                    dns.Enable = value;
                  },
          ),
        ),
        GroupItemOptions(
          textFormFieldOptions: GroupItemTextFieldOptions(
            name: "listen",
            text: dns.Listen,
            textWidthPercent: 0.5,
            hint: "0.0.0.0:53",
            readOnly: dns.OverWrite != true || dns.Enable != true,
            tips: "listen",
            onChanged: (String value) {
              dns.Listen = value;
            },
          ),
        ),

        GroupItemOptions(
          switchOptions: GroupItemSwitchOptions(
            name: "prefer-h3",
            tips: "prefer-h3",
            switchValue: dns.PreferH3,
            onSwitch: dns.OverWrite != true || dns.Enable != true
                ? null
                : (bool value) async {
                    dns.PreferH3 = value;
                  },
          ),
        ),
        GroupItemOptions(
          switchOptions: GroupItemSwitchOptions(
            name: "use-hosts",
            tips: "use-hosts",
            switchValue: dns.UseHosts,
            onSwitch: dns.OverWrite != true || dns.Enable != true
                ? null
                : (bool value) async {
                    dns.UseHosts = value;
                  },
          ),
        ),
        GroupItemOptions(
          switchOptions: GroupItemSwitchOptions(
            name: "use-system-hosts",
            tips: "use-system-hosts",
            switchValue: dns.UseSystemHosts,
            onSwitch: dns.OverWrite != true || dns.Enable != true
                ? null
                : (bool value) async {
                    dns.UseSystemHosts = value;
                  },
          ),
        ),
        /*   GroupItemOptions(
          switchOptions: GroupItemSwitchOptions(
              name: "respect-rules",
              switchValue: dns.RespectRules,
              onSwitch: dns.OverWrite != true || dns.Enable != true
                    ? null
                    : (bool value) async {
                dns.RespectRules = value;
              }))  ,
        GroupItemOptions(
          switchOptions: GroupItemSwitchOptions(
              name: "direct-name-server-follow-policy",
              switchValue: dns.DirectNameServerFollowPolicy,
              onSwitch:dns.OverWrite != true || dns.Enable != true
                    ? null
                    :  (bool value) async {
                dns.DirectNameServerFollowPolicy = value;
              }))  ,*/
      ];

      List<GroupItemOptions> options1 = [
        GroupItemOptions(
          stringPickerOptions: GroupItemStringPickerOptions(
            name: "enhanced-mode",
            tips: "enhanced-mode",
            selected: enhancedModes.contains(dns.EnhancedMode)
                ? dns.EnhancedMode
                : enhancedModes.last,
            tupleStrings: enhancedModesTuple,
            onPicker: dns.OverWrite != true || dns.Enable != true
                ? null
                : (String? selected) async {
                    dns.EnhancedMode = selected;
                  },
          ),
        ),
        GroupItemOptions(
          stringPickerOptions: GroupItemStringPickerOptions(
            name: "fake-ip-filter-mode",
            tips: "fake-ip-filter-mode",
            selected: fakeIPFilterModes.contains(dns.FakeIPFilterMode)
                ? dns.FakeIPFilterMode
                : fakeIPFilterModes.last,
            strings: fakeIPFilterModes,
            onPicker: dns.OverWrite != true || dns.Enable != true
                ? null
                : (String? selected) async {
                    dns.FakeIPFilterMode = selected;
                  },
          ),
        ),
        GroupItemOptions(
          pushOptions: GroupItemPushOptions(
            name: "fake-ip-filter",
            tips: "fake-ip-filter",
            onPush: dns.OverWrite != true || dns.Enable != true
                ? null
                : () async {
                    dns.FakeIPFilter ??= [];
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        settings: ListAddScreen.routSettings("FakeIPFilter"),
                        builder: (context) => ListAddScreen(
                          title: "fake-ip-filter",
                          data: dns.FakeIPFilter!,
                        ),
                      ),
                    );
                  },
          ),
        ),
      ];
      List<GroupItemOptions> options2 = [
        GroupItemOptions(
          switchOptions: GroupItemSwitchOptions(
            name: "respect-rules",
            tips: "respect-rules",
            switchValue: dns.RespectRules,
            onSwitch: dns.OverWrite != true || dns.Enable != true
                ? null
                : (bool value) async {
                    dns.RespectRules = value;
                  },
          ),
        ),
        GroupItemOptions(
          pushOptions: GroupItemPushOptions(
            name: "default-nameserver",
            tips: "default-nameserver",
            onPush: dns.OverWrite != true || dns.Enable != true
                ? null
                : () async {
                    dns.DefaultNameserver ??= [];
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        settings: ListAddScreen.routSettings(
                          "DefaultNameserver",
                        ),
                        builder: (context) => ListAddScreen(
                          title: "default-nameserver",
                          data: dns.DefaultNameserver!,
                        ),
                      ),
                    );
                  },
          ),
        ),
        GroupItemOptions(
          pushOptions: GroupItemPushOptions(
            name: "nameserver",
            tips: "nameserver",
            onPush: dns.OverWrite != true || dns.Enable != true
                ? null
                : () async {
                    dns.NameServer ??= [];
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        settings: ListAddScreen.routSettings("NameServer"),
                        builder: (context) => ListAddScreen(
                          title: "nameserver",
                          data: dns.NameServer!,
                        ),
                      ),
                    );
                  },
          ),
        ),
        GroupItemOptions(
          pushOptions: GroupItemPushOptions(
            name: "proxy-server-nameserver",
            tips: "proxy-server-nameserver",
            onPush: dns.OverWrite != true || dns.Enable != true
                ? null
                : () async {
                    dns.ProxyServerNameserver ??= [];
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        settings: ListAddScreen.routSettings(
                          "ProxyServerNameserver",
                        ),
                        builder: (context) => ListAddScreen(
                          title: "proxy-server-nameserver",
                          data: dns.ProxyServerNameserver!,
                        ),
                      ),
                    );
                  },
          ),
        ),
        GroupItemOptions(
          pushOptions: GroupItemPushOptions(
            name: "direct-nameserver",
            tips: "direct-nameserver",
            onPush: dns.OverWrite != true || dns.Enable != true
                ? null
                : () async {
                    dns.DirectNameServer ??= [];
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        settings: ListAddScreen.routSettings(
                          "DirectNameServer",
                        ),
                        builder: (context) => ListAddScreen(
                          title: "direct-nameserver",
                          data: dns.DirectNameServer!,
                        ),
                      ),
                    );
                  },
          ),
        ),
        GroupItemOptions(
          pushOptions: GroupItemPushOptions(
            name: "fallback",
            tips: "fallback",
            onPush: dns.OverWrite != true || dns.Enable != true
                ? null
                : () async {
                    dns.Fallback ??= [];
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        settings: ListAddScreen.routSettings("Fallback"),
                        builder: (context) => ListAddScreen(
                          title: "fallback",
                          data: dns.Fallback!,
                        ),
                      ),
                    );
                  },
          ),
        ),
        GroupItemOptions(
          switchOptions: GroupItemSwitchOptions(
            name: "geoip",
            tips: "geoip",
            switchValue: dns.FallbackFilter?.GeoIP,
            onSwitch: dns.OverWrite != true || dns.Enable != true
                ? null
                : (bool value) async {
                    dns.FallbackFilter ??= RawFallbackFilter.by();
                    dns.FallbackFilter?.GeoIP = value;
                  },
          ),
        ),
        GroupItemOptions(
          textFormFieldOptions: GroupItemTextFieldOptions(
            name: "geoip-code",
            text: dns.FallbackFilter?.GeoIPCode,
            textWidthPercent: 0.5,
            readOnly: dns.OverWrite != true || dns.Enable != true,
            tips: "geoip-code",
            onChanged: (String value) {
              dns.FallbackFilter ??= RawFallbackFilter.by();
              dns.FallbackFilter?.GeoIPCode = value;
            },
          ),
        ),
      ];

      return [
        GroupItem(options: options),

        GroupItem(options: options1),
        GroupItem(options: options2),
      ];
    }

    await Navigator.push(
      context,
      MaterialPageRoute(
        settings: GroupScreen.routSettings("dns"),
        builder: (context) =>
            GroupScreen(title: tcontext.meta.dns, getOptions: getOptions),
      ),
    );
  }
}
