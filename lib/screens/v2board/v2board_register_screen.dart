import 'dart:async';

import 'package:board_service/v2board/v2board_client.dart';
import 'package:board_service/v2board/v2board_models.dart';
import 'package:flutter/material.dart';
import 'package:skivpn/app/modules/board_provider_manager.dart';
import 'package:skivpn/app/utils/url_launcher_utils.dart';
import 'package:skivpn/i18n/strings.g.dart';
import 'package:skivpn/screens/dialog_utils.dart';
import 'package:skivpn/screens/theme_define.dart';
import 'package:tuple/tuple.dart';

class V2boardRegisterScreen extends StatefulWidget {
  static RouteSettings routSettings() {
    return const RouteSettings(name: "V2boardRegisterScreen");
  }

  final BoardProviderConfig provider;
  const V2boardRegisterScreen({super.key, required this.provider});
  @override
  State<V2boardRegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<V2boardRegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _formKeyEmail = GlobalKey<FormFieldState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _emailCodeController = TextEditingController();
  final _verificationCodeController = TextEditingController();
  final _inviteCodeController = TextEditingController();

  late V2BoardClient _client;
  bool _agreeToUserAgreement = false;
  bool _isSending = false;
  int _countdown = 0;
  Timer? _timer;
  bool _registering = false;
  CommonConfig? _config;
  @override
  void initState() {
    super.initState();
    _client = V2BoardClient(
      baseUrl: "https://${widget.provider.domain}",
      id: widget.provider.id,
      persistent: null,
    );
    _client.setVersion(widget.provider.version);
    getRegisterConfig();
  }

  @override
  Widget build(BuildContext context) {
    final tcontext = Translations.of(context);
    bool loading = true;
    bool isEmailVerify = false;
    bool isRecaptcha = false;
    String recaptcha = "";

    if (_config != null) {
      loading = false;
      isEmailVerify = _config!.isEmailVerify;
      isRecaptcha = _config!.isRecaptcha;
      recaptcha = _config!.recaptchaSiteKey ?? "";
    }
    const primaryPurple = Color(0xFF7B5FF5);
    return Scaffold(
      appBar: AppBar(title: Text(widget.provider.name), centerTitle: true),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
                child: loading
                    ? const RepaintBoundary(child: CircularProgressIndicator())
                    : Form(
                        key: _formKey,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                tcontext.xboardRegisterScreen.register,
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                  //  color: textDark,
                                ),
                              ),
                              const SizedBox(height: 18),
                              TextFormField(
                                key: _formKeyEmail,
                                controller: _emailController,
                                decoration: InputDecoration(
                                  labelText:
                                      tcontext.xboardRegisterScreen.email,
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: ThemeDefine.kColorBlue,
                                  ),
                                ),
                                keyboardType: TextInputType.emailAddress,
                                validator: _validateEmail,
                              ),

                              const SizedBox(height: 16),
                              if (isEmailVerify) ...[
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        controller: _emailCodeController,
                                        decoration: InputDecoration(
                                          labelText: tcontext
                                              .xboardRegisterScreen
                                              .emailVerificationCode,
                                          prefixIcon: Icon(
                                            Icons.verified,
                                            color: ThemeDefine.kColorBlue,
                                          ),
                                        ),
                                        validator: _validateEmailCode,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    SizedBox(
                                      width: 100,
                                      height: 45,
                                      child: ElevatedButton(
                                        onPressed: _countdown > 0
                                            ? null
                                            : _sendEmailCode,
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
                                            borderRadius: BorderRadius.circular(
                                              14,
                                            ),
                                          ),
                                          child: Container(
                                            alignment: Alignment.center,
                                            child: _isSending
                                                ? SizedBox(
                                                    width: 20,
                                                    height: 20,
                                                    child: const RepaintBoundary(
                                                      child: CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                              Color
                                                            >(Colors.white),
                                                        strokeWidth: 2,
                                                      ),
                                                    ),
                                                  )
                                                : Text(
                                                    _countdown > 0
                                                        ? '${_countdown}s'
                                                        : tcontext
                                                              .xboardRegisterScreen
                                                              .send,
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                              ],
                              TextFormField(
                                controller: _passwordController,
                                decoration: InputDecoration(
                                  labelText:
                                      tcontext.xboardRegisterScreen.password,
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: ThemeDefine.kColorBlue,
                                  ),
                                ),
                                obscureText: true,
                                validator: _validatePassword,
                              ),
                              const SizedBox(height: 16),
                              // Confirm password input
                              TextFormField(
                                controller: _confirmPasswordController,
                                decoration: InputDecoration(
                                  labelText: tcontext
                                      .xboardRegisterScreen
                                      .confirmPassword,
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: ThemeDefine.kColorBlue,
                                  ),
                                ),
                                obscureText: true,
                                validator: _validateConfirmPassword,
                              ),
                              const SizedBox(height: 16),
                              if (isRecaptcha && recaptcha.isNotEmpty) ...[
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        controller: _verificationCodeController,
                                        decoration: InputDecoration(
                                          labelText: tcontext
                                              .xboardRegisterScreen
                                              .verificationCode,
                                          prefixIcon: Icon(
                                            Icons.verified,
                                            color: ThemeDefine.kColorBlue,
                                          ),
                                        ),
                                        validator: (value) =>
                                            _validateVerificationCode(
                                              value,
                                              recaptcha,
                                            ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    SizedBox(width: 60, child: Text(recaptcha)),
                                    const SizedBox(width: 10),
                                    InkWell(
                                      child: Icon(Icons.refresh),
                                      onTap: () {
                                        getRegisterConfig();
                                      },
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                              ],
                              TextFormField(
                                controller: _inviteCodeController,
                                decoration: InputDecoration(
                                  labelText: tcontext
                                      .xboardRegisterScreen
                                      .invitationCode,
                                  prefixIcon: Icon(
                                    Icons.share,
                                    color: ThemeDefine.kColorBlue,
                                  ),
                                ),
                              ),
                              if (widget.provider.userAgreement.isNotEmpty) ...[
                                const SizedBox(width: 10),
                                Row(
                                  children: [
                                    Checkbox(
                                      value: _agreeToUserAgreement,
                                      onChanged: (value) {
                                        setState(() {
                                          _agreeToUserAgreement =
                                              value ?? false;
                                        });
                                      },
                                    ),
                                    const SizedBox(width: 10),

                                    TextButton(
                                      onPressed: () async {
                                        UrlLauncherUtils.loadUrl(
                                          widget.provider.userAgreement,
                                        );
                                      },
                                      child: Text(
                                        tcontext
                                            .xboardRegisterScreen
                                            .userAgreement,
                                        style: TextStyle(
                                          color: ThemeDefine.kColorBlue,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],

                              const SizedBox(height: 18),
                              SizedBox(
                                width: double.infinity,
                                height: 48,
                                child: ElevatedButton(
                                  onPressed: _registering ? null : _register,
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
                                      child: _registering
                                          ? SizedBox(
                                              width: 20,
                                              height: 20,
                                              child: const RepaintBoundary(
                                                child: CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                        Color
                                                      >(Colors.white),
                                                  strokeWidth: 2,
                                                ),
                                              ),
                                            )
                                          : Text(
                                              tcontext
                                                  .xboardRegisterScreen
                                                  .register,
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

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _emailCodeController.dispose();
    _verificationCodeController.dispose();
    _inviteCodeController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _sendEmailCode() async {
    final tcontext = Translations.of(context);
    if (!_formKeyEmail.currentState!.validate()) {
      return;
    }
    _isSending = true;
    setState(() {});
    final result = await _client.sendEmailVerify(
      SendEmailVerifyRequest(
        email: _emailController.text,
        captchaToken: _verificationCodeController.text.isEmpty
            ? null
            : _verificationCodeController.text,
      ),
    );
    if (!mounted) {
      return;
    }
    _isSending = false;
    setState(() {});
    if (result.statusCode != 200) {
      DialogUtils.showAlertDialog(
        context,
        result.getFullMessage(),
        showCopy: true,
        showFAQ: true,
        withVersion: true,
      );
      return;
    }
    _countdown = 60;
    // Start countdown
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      setState(() {
        if (_countdown > 0) {
          _countdown--;
        } else {
          timer.cancel();
        }
      });
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(tcontext.xboardRegisterScreen.emailSentNotice)),
    );
  }

  void _register() async {
    final tcontext = Translations.of(context);
    if (!_formKey.currentState!.validate()) {
      return;
    }
    if (widget.provider.userAgreement.isNotEmpty) {
      if (!_agreeToUserAgreement) {
        DialogUtils.showAlertDialog(
          context,
          '${tcontext.xboardRegisterScreen.pleaseCheck} ${tcontext.xboardRegisterScreen.userAgreement}',
          showCopy: false,
          showFAQ: false,
          withVersion: false,
        );

        return;
      }
    }

    _registering = true;
    setState(() {});
    final result = await _client.register(
      RegisterRequest(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
        emailVerifyCode: _emailCodeController.text.trim().isEmpty
            ? null
            : _emailCodeController.text.trim(),
        captchaToken: _verificationCodeController.text.trim().isEmpty
            ? null
            : _verificationCodeController.text.trim(),
        inviteCode: _inviteCodeController.text.trim().isEmpty
            ? null
            : _inviteCodeController.text.trim(),
      ),
    );
    if (!mounted) {
      return;
    }
    if (result.statusCode != 200) {
      DialogUtils.showAlertDialog(
        context,
        result.getFullMessage(),
        showCopy: true,
        showFAQ: true,
        withVersion: true,
      );
      _registering = false;
      setState(() {});
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(tcontext.xboardRegisterScreen.registerSuccess)),
    );

    _registering = false;
    setState(() {});
    Navigator.of(
      context,
    ).pop(Tuple2(_emailController.text, _passwordController.text));
  }

  String? _validateEmail(String? value) {
    final tcontext = Translations.of(context);
    if (value == null ||
        value.trim().isEmpty ||
        !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value.trim())) {
      return tcontext.xboardRegisterScreen.invalidEmail;
    }
    return null;
  }

  String? _validatePassword(String? value) {
    final tcontext = Translations.of(context);
    const minLength = 8;
    if (value == null || value.trim().isEmpty) {
      return tcontext.xboardRegisterScreen.passwordRequired;
    }
    if (value.trim().length < minLength) {
      return tcontext.xboardRegisterScreen.passwordMinLength(
        minLength: minLength,
      );
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    final tcontext = Translations.of(context);
    if (value == null || value.trim().isEmpty) {
      return tcontext.xboardRegisterScreen.confirmPasswordRequired;
    }
    if (value.trim() != _passwordController.text.trim()) {
      return tcontext.xboardRegisterScreen.passwordMismatch;
    }
    return null;
  }

  String? _validateEmailCode(String? value) {
    final tcontext = Translations.of(context);
    const codeLength = 6;
    if (value == null || value.trim().isEmpty) {
      return tcontext.xboardRegisterScreen.emailCodeRequired;
    }
    if (value.trim().length != codeLength) {
      return tcontext.xboardRegisterScreen.emailCodeLength(
        codeLength: codeLength,
      );
    }
    return null;
  }

  String? _validateVerificationCode(String? value, String recaptcha) {
    final tcontext = Translations.of(context);
    if (value == null || value.trim().isEmpty) {
      return tcontext.xboardRegisterScreen.verificationCodeRequired;
    }
    if (value.trim().length < 4 || value.trim().length > 8) {
      return tcontext.xboardRegisterScreen.verificationCodeLength;
    }
    return null;
  }

  Future<void> getRegisterConfig() async {
    final response = await _client.getGuestConfig();
    if (!mounted) {
      return;
    }
    if (response.statusCode != 200) {
      DialogUtils.showAlertDialog(
        context,
        response.getFullMessage(),
        showCopy: true,
        showFAQ: true,
        withVersion: true,
      );
      return;
    }
    _config = response.data;

    setState(() {});
  }
}
