import 'package:board_service/sspanel_uim/sspanel_uim_client.dart'
    as sspanel_client;
import 'package:board_service/v2board/v2board_client.dart' as v2board_client;
import 'package:board_service/xboard/xboard_client.dart' as xboard_client;
import 'package:flutter/material.dart';
import 'package:skivpn/app/modules/board_provider_manager.dart';
import 'package:skivpn/app/modules/board_session_persistent_manager.dart';
import 'package:skivpn/app/utils/app_utils.dart';
import 'package:skivpn/app/utils/url_launcher_utils.dart';
import 'package:skivpn/i18n/strings.g.dart';
import 'package:skivpn/screens/dialog_utils.dart';
import 'package:skivpn/screens/sspanel/sspanel_login.dart';
import 'package:skivpn/screens/theme_define.dart';
import 'package:skivpn/screens/v2board/v2board_login.dart';
import 'package:skivpn/screens/xboard/xboard_login.dart';

class LoginScreen extends StatefulWidget {
  static RouteSettings routSettings() {
    return const RouteSettings(name: "LoginScreen");
  }

  static bool isAlive = false;

  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _serviceNameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final FocusNode _serviceNameFocus = FocusNode();
  bool _isPasswordVisible = false;
  bool _logining = false;
  BoardProviderConfig? _provider;

  @override
  void initState() {
    LoginScreen.isAlive = true;
    final session = BoardSessionPersistentManager.instance().current();
    if (session != null) {
      _serviceNameController.text = session.provider.name;
      _usernameController.text = session.account;
      _provider = session.provider;
    }
    _serviceNameFocus.addListener(() async {
      if (_serviceNameFocus.hasFocus) {
        return;
      }
      _validateServiceNameAsync();
    });
    super.initState();
  }

  @override
  void dispose() {
    _serviceNameFocus.dispose();
    _serviceNameController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
    LoginScreen.isAlive = false;
  }

  @override
  Widget build(BuildContext context) {
    final tcontext = Translations.of(context);

    var accountStr = tcontext.loginScreen.account;
    var accountRequiredStr = tcontext.loginScreen.accountRequired;
    const primaryPurple = Color(0xFF7B5FF5);
    if (_provider != null) {
      if (_provider!.type == BoardProviderType.v2board ||
          _provider!.type == BoardProviderType.xboard ||
          _provider!.type == BoardProviderType.sspanel) {
        accountStr = tcontext.loginScreen.email;
        accountRequiredStr = tcontext.loginScreen.emailRequired;
      }
    }
    bool isProviderSupported =
        _provider != null && BoardProviderType.support(_provider!.type.name);
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.zero,
          child: AppBar(title: Text(AppUtils.getName()), centerTitle: true),
        ),
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              tcontext.loginScreen.login,
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            isProviderSupported &&
                                    _provider!.clientServiceUrl.isNotEmpty
                                ? InkWell(
                                    onTap: () {
                                      UrlLauncherUtils.loadUrl(
                                        _provider!.clientServiceUrl,
                                      );
                                    },
                                    child: Icon(
                                      Icons.contact_support_outlined,
                                      size: 30,
                                      color: ThemeDefine.kColorBlue,
                                    ),
                                  )
                                : const SizedBox.shrink(),
                          ],
                        ),

                        const SizedBox(height: 18),
                        TextFormField(
                          controller: _serviceNameController,
                          focusNode: _serviceNameFocus,
                          decoration: InputDecoration(
                            labelText: tcontext.loginScreen.providerName,
                            hintText: tcontext.loginScreen.providerNameRequired,
                            prefixIcon: const Icon(
                              Icons.business,
                              color: ThemeDefine.kColorBlue,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                isProviderSupported ? Icons.done : null,
                                color: ThemeDefine.kColorGreenBright,
                              ),
                              onPressed: null,
                            ),
                          ),
                          onChanged: (value) async {
                            _provider = null;
                            setState(() {});
                          },
                          validator: _validateServiceName,
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _usernameController,
                          decoration: InputDecoration(
                            labelText: accountStr,
                            hintText: accountRequiredStr,
                            prefixIcon: const Icon(
                              Icons.person,
                              color: ThemeDefine.kColorBlue,
                            ),
                          ),
                          validator: _validateUsername,
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: !_isPasswordVisible,
                          decoration: InputDecoration(
                            labelText: tcontext.loginScreen.password,
                            hintText: tcontext.loginScreen.passwordRequired,
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: ThemeDefine.kColorBlue,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                            ),
                          ),
                          validator: _validatePassword,
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 48,
                          child: ElevatedButton(
                            onPressed: _logining ? null : _login,
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ),
                            child: Ink(
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    ThemeDefine.kColorBlue,
                                    primaryPurple,
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                child: _logining
                                    ? SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: const RepaintBoundary(
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                  Colors.white,
                                                ),
                                            strokeWidth: 2,
                                          ),
                                        ),
                                      )
                                    : Text(
                                        tcontext.loginScreen.login,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed:
                                  isProviderSupported &&
                                      _provider!.forgotPasswordUrl.isNotEmpty
                                  ? () {
                                      _forgotpwd();
                                    }
                                  : null,
                              child: Text(
                                isProviderSupported &&
                                        _provider!.forgotPasswordUrl.isNotEmpty
                                    ? tcontext.loginScreen.forgotPassword
                                    : '',
                                style: TextStyle(
                                  color: ThemeDefine.kColorBlue,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed:
                                  isProviderSupported &&
                                      _provider!.registerUrl.isNotEmpty
                                  ? () async {
                                      _register();
                                    }
                                  : null,
                              child: Text(
                                isProviderSupported &&
                                        _provider!.registerUrl.isNotEmpty
                                    ? tcontext.loginScreen.register
                                    : '',
                                style: TextStyle(
                                  color: ThemeDefine.kColorBlue,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _validateServiceNameAsync() async {
    final value = _serviceNameController.text.trim();
    if (value.isEmpty) {
      return;
    }
    final result = await BoardProviderManager.getProvider(value);
    if (result.error != null) {
      return;
    }
    if (!BoardProviderType.support(result.data!.type.name)) {
      return;
    }
    if (value != _serviceNameController.text.trim()) {
      return;
    }
    _provider = result.data;
    Future.delayed(const Duration(milliseconds: 100)).then((value) {
      setState(() {});
    });
  }

  String? _validateServiceName(String? value) {
    if (value == null || value.isEmpty) {
      final tcontext = Translations.of(context);
      return tcontext.loginScreen.providerNameRequired;
    }
    return null;
  }

  String? _validateUsername(String? value) {
    if (_provider == null) {
      return null;
    }
    if (_provider!.type == BoardProviderType.v2board) {
      return _validateV2boardUsername(value);
    } else if (_provider!.type == BoardProviderType.xboard) {
      return _validateXboardUsername(value);
    } else if (_provider!.type == BoardProviderType.sspanel) {
      return _validateSSPanelUsername(value);
    }
    return null;
  }

  String? _validateV2boardUsername(String? value) {
    if (!v2board_client.V2BoardClient.validateEmail(value?.trim())) {
      final tcontext = Translations.of(context);
      return tcontext.loginScreen.validEmailRequired;
    }
    return null;
  }

  String? _validateXboardUsername(String? value) {
    if (!xboard_client.XboardClient.validateEmail(value?.trim())) {
      final tcontext = Translations.of(context);
      return tcontext.loginScreen.validEmailRequired;
    }
    return null;
  }

  String? _validateSSPanelUsername(String? value) {
    if (!sspanel_client.SSPanelUimClient.validateEmail(value?.trim())) {
      final tcontext = Translations.of(context);
      return tcontext.loginScreen.validEmailRequired;
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      final tcontext = Translations.of(context);
      return tcontext.loginScreen.passwordRequired;
    }
    if (_provider == null) {
      return null;
    }
    if (_provider!.type == BoardProviderType.v2board) {
      return _validateV2boardPassword(value);
    } else if (_provider!.type == BoardProviderType.xboard) {
      return _validateXboardPassword(value);
    } else if (_provider!.type == BoardProviderType.sspanel) {
      return _validateSSPanelPassword(value);
    }

    return null;
  }

  String? _validateV2boardPassword(String value) {
    int minLength = v2board_client.V2BoardClient.getPasswordMinLen();
    if (value.trim().length < minLength) {
      final tcontext = Translations.of(context);
      return tcontext.loginScreen.passwordMinLength(minLength: minLength);
    }
    return null;
  }

  String? _validateXboardPassword(String value) {
    int minLength = xboard_client.XboardClient.getPasswordMinLen();
    if (value.trim().length < minLength) {
      final tcontext = Translations.of(context);
      return tcontext.loginScreen.passwordMinLength(minLength: minLength);
    }
    return null;
  }

  String? _validateSSPanelPassword(String value) {
    int minLength = sspanel_client.SSPanelUimClient.getPasswordMinLen();
    if (value.trim().length < minLength) {
      final tcontext = Translations.of(context);
      return tcontext.loginScreen.passwordMinLength(minLength: minLength);
    }
    return null;
  }

  void _login({bool handle403 = true}) async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    final serviceName = _serviceNameController.text.trim();
    _logining = true;
    setState(() {});
    final result = await BoardProviderManager.getProvider(serviceName);
    if (!mounted) {
      return;
    }
    if (result.error != null) {
      _provider = null;
      _logining = false;
      setState(() {});
      DialogUtils.showAlertDialog(
        context,
        result.error!.message,
        showCopy: true,
        showFAQ: true,
        withVersion: true,
      );
      return;
    }

    if (!BoardProviderType.support(result.data!.type.name)) {
      _provider = null;
      _logining = false;
      setState(() {});
      final tcontext = Translations.of(context);
      DialogUtils.showAlertDialog(
        context,
        "${tcontext.loginScreen.unsupportedProviderType}: $serviceName",
        showCopy: true,
        showFAQ: true,
        withVersion: true,
      );
      return;
    }
    _provider = result.data!;
    BoardProviderConfig provider = _provider!;
    BoardSessionLoginError? sessionLoginError;
    if (provider.type == BoardProviderType.v2board) {
      sessionLoginError = await V2boardLogin.login(
        provider,
        _usernameController.text.trim(),
        _passwordController.text.trim(),
      );
    } else if (provider.type == BoardProviderType.xboard) {
      sessionLoginError = await XboardLogin.login(
        provider,
        _usernameController.text.trim(),
        _passwordController.text.trim(),
      );
    } else if (provider.type == BoardProviderType.sspanel) {
      sessionLoginError = await SSPanelLogin.login(
        provider,
        _usernameController.text.trim(),
        _passwordController.text.trim(),
      );
    }
    if (!mounted) {
      return;
    }

    _logining = false;
    setState(() {});
    if (sessionLoginError != null) {
      /*if (sessionLoginError.httpStatusCode == 403 && handle403) {
        if (await BotHelper().handle403(context, provider, sessionLoginError, (
          bool handle403,
        ) {
          _login(handle403: handle403);
        })) {
          return;
        }
      }
      if (!mounted) {
        return;
      }*/
      DialogUtils.showAlertDialog(
        context,
        sessionLoginError.message ?? "unknown error",
        showCopy: true,
        showFAQ: true,
        withVersion: true,
      );
      return;
    }
    Navigator.of(context).pop();
  }

  void _forgotpwd() async {
    if (_provider == null || _provider!.forgotPasswordUrl.isEmpty) {
      return;
    }
    UrlLauncherUtils.loadUrl(_provider!.forgotPasswordUrl);
  }

  void _register() async {
    if (_provider == null || _provider!.registerUrl.isEmpty) {
      return;
    }
    UrlLauncherUtils.loadUrl(_provider!.registerUrl);
    /* Tuple2<String, String>? up;
    if (_provider!.registerUrl.isNotEmpty) {
      UrlLauncherUtils.loadUrl(_provider!.registerUrl);
      return;
    }
    if (_provider!.type == BoardProviderType.v2board) {
      up = await Navigator.push(
        context,
        MaterialPageRoute(
          settings: V2boardRegisterScreen.routSettings(),
          builder: (context) => V2boardRegisterScreen(provider: _provider!),
        ),
      );
    } else if (_provider!.type == BoardProviderType.xboard) {
      up = await Navigator.push(
        context,
        MaterialPageRoute(
          settings: XboardRegisterScreen.routSettings(),
          builder: (context) => XboardRegisterScreen(provider: _provider!),
        ),
      );
    } else if (_provider!.type == BoardProviderType.sspanel) {
      up = await Navigator.push(
        context,
        MaterialPageRoute(
          settings: SSPanelRegisterScreen.routSettings(),
          builder: (context) => SSPanelRegisterScreen(provider: _provider!),
        ),
      );
    }
    if (up != null && up.item1.isNotEmpty && up.item2.isNotEmpty) {
      _serviceNameController.text = _provider!.name;
      _usernameController.text = up.item1;
      _passwordController.text = up.item2;
      setState(() {});
    }*/
  }
}
