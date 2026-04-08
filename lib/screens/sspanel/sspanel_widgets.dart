import 'dart:io';
import 'dart:math';

import 'package:board_service/base_client.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:skivpn/app/clash/clash_http_api.dart';
import 'package:skivpn/app/modules/board_session_persistent_manager.dart';
import 'package:skivpn/app/modules/profile_manager.dart';
import 'package:skivpn/app/modules/setting_manager.dart';
import 'package:skivpn/app/utils/app_lifecycle_state_notify.dart';
import 'package:skivpn/app/utils/url_launcher_utils.dart';
import 'package:skivpn/i18n/strings.g.dart';
import 'package:skivpn/screens/sspanel/sspanel_login.dart';
import 'package:skivpn/screens/theme_define.dart';
import 'package:skivpn/screens/webview_helper.dart';

class SSPanelWidgetPlan extends StatefulWidget {
  final BoardSession session;
  const SSPanelWidgetPlan({super.key, required this.session});

  @override
  State<SSPanelWidgetPlan> createState() => _SSPanelWidgetPlanState();
}

class _SSPanelWidgetPlanState extends State<SSPanelWidgetPlan> {
  bool _loading = false;
  @override
  void initState() {
    SSPanelLogin.onEventLogin[hashCode] = () {
      if (!mounted) {
        return;
      }
      setState(() {});
    };

    AppLifecycleStateNofity.onStateResumed(hashCode, _onStateResumed);
    super.initState();
  }

  @override
  void dispose() {
    SSPanelLogin.onEventLogin.remove(hashCode);
    AppLifecycleStateNofity.onStateResumed(hashCode, null);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tcontext = Translations.of(context);
    final settings = SettingManager.getConfig();
    final session = BoardSessionPersistentManager.instance().current();
    final client = session?.ssPanel;
    final provider = session?.provider;
    final subscribeUrl = client?.getSubscribePersisted();
    final profile = ProfileManager.getByUrl(subscribeUrl ?? "");
    if (profile != null) {
      final totalTraffic = ClashHttpApi.convertTrafficToStringDouble(
        profile.total,
      );
      final usedTraffic = ClashHttpApi.convertTrafficToStringDouble(
        profile.upload + profile.download,
      );
      double percent = profile.total != 0
          ? (profile.upload + profile.download) / profile.total
          : 0;
      final expireAt = profile.expire != null
          ? DateTime.fromMillisecondsSinceEpoch(profile.expire!.toInt() * 1000)
          : null;

      int? expireLeft = expireAt?.difference(DateTime.now()).inDays;
      if (expireLeft != null && expireLeft < 0) {
        expireLeft = 0;
      }
      final smallTitleStyle = TextStyle(fontSize: 12, color: Colors.grey[600]);
      return Card(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: provider != null && provider.planUrl.isNotEmpty
                          ? () {
                              if (Platform.isIOS) {
                                UrlLauncherUtils.loadUrl(provider.planUrl);
                                return;
                              }
                              WebviewHelper.loadUrl(
                                context,
                                session!.provider.planUrl,
                                "planUrl",
                                title: tcontext.homeScreen.buyPlan,
                                useInappWebViewForPC: true,
                                inappWebViewOpenExternal: true,
                                refreshWhenLoaded: true,
                                headers: session.headers(),
                                cookies: session.cookies(),
                                localStorage: session.localStorage(),
                              );
                            }
                          : null,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.subscriptions_outlined,
                            color: ThemeDefine.kColorBlue,
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: Text(
                              "",
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: _loading || session == null
                            ? null
                            : () async {
                                _refreshSubscribeInfo(session);
                              },
                        child: _loading
                            ? SizedBox(
                                width: 20,
                                height: 20,
                                child: const RepaintBoundary(
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      ThemeDefine.kColorBlue,
                                    ),
                                    strokeWidth: 2,
                                  ),
                                ),
                              )
                            : Icon(
                                Icons.refresh,
                                color: ThemeDefine.kColorBlue,
                              ),
                      ),
                    ],
                  ),
                ],
              ),
              const Divider(),
              const SizedBox(height: 10),
              LinearProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(
                  expireLeft != null && expireLeft <= 14
                      ? Colors.red
                      : ThemeDefine.kColorBlue,
                ),
                value: min(1.0, percent),
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    tcontext.planWidget.used,
                    textAlign: TextAlign.left,
                    style: smallTitleStyle,
                  ),
                  Text(
                    tcontext.planWidget.totalTraffic,
                    textAlign: TextAlign.right,
                    style: smallTitleStyle,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    usedTraffic,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  Text(
                    "$totalTraffic (${(percent * 100).toStringAsFixed(1)}%)",
                    textAlign: TextAlign.right,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Divider(),
              if (expireAt != null) ...[
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tcontext.planWidget.expirationTime,
                      textAlign: TextAlign.left,
                      style: smallTitleStyle,
                    ),

                    Text(
                      tcontext.planWidget.remainingTime,
                      textAlign: TextAlign.right,
                      style: smallTitleStyle,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      settings.languageTag.isEmpty
                          ? DateFormat('yyyy-MM-dd').format(expireAt)
                          : DateFormat.yMd(
                              settings.languageTag,
                            ).format(expireAt),
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: expireLeft != null && expireLeft <= 14
                            ? Colors.red
                            : null,
                      ),
                    ),

                    Text(
                      "$expireLeft ${tcontext.meta.days}",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: expireLeft != null && expireLeft <= 14
                            ? Colors.red
                            : null,
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      );
    }
    if (provider != null && provider.planUrl.isNotEmpty) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      if (Platform.isIOS) {
                        UrlLauncherUtils.loadUrl(provider.planUrl);
                        return;
                      }
                      WebviewHelper.loadUrl(
                        context,
                        session!.provider.planUrl,
                        "planUrl",
                        title: tcontext.homeScreen.buyPlan,
                        useInappWebViewForPC: true,
                        inappWebViewOpenExternal: true,
                        headers: session.headers(),
                        cookies: session.cookies(),
                        localStorage: session.localStorage(),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.subscriptions_outlined,
                          color: ThemeDefine.kColorBlue,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          tcontext.homeScreen.buyPlan,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: _loading || session == null
                            ? null
                            : () async {
                                _refreshSubscribeInfo(session);
                              },
                        child: _loading
                            ? SizedBox(
                                width: 20,
                                height: 20,
                                child: const RepaintBoundary(
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      ThemeDefine.kColorBlue,
                                    ),
                                    strokeWidth: 2,
                                  ),
                                ),
                              )
                            : Icon(
                                Icons.refresh,
                                color: ThemeDefine.kColorBlue,
                              ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }
    return const SizedBox.shrink();
  }

  Future<void> _onStateResumed() async {}
  void _refreshSubscribeInfo(BoardSession sess) async {
    if (_loading) {
      return;
    }
    setState(() {
      _loading = true;
    });
    String? err = await SSPanelLogin.getSubscribe(sess);
    if (!mounted) {
      return;
    }
    setState(() {
      _loading = false;
    });
    if (err == kReLoginRequiredMessage) {
      BoardSessionPersistentManager.instance().relogin();
      return;
    }
    if (err != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(err)));
    }
  }
}
