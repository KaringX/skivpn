///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsAr with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsAr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ar,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ar>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsAr _root = this; // ignore: unused_field

	@override 
	TranslationsAr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsAr(meta: meta ?? this.$meta);

	// Translations
	@override late final _Translations$LaunchFailedScreen$ar LaunchFailedScreen = _Translations$LaunchFailedScreen$ar._(_root);
	@override late final _Translations$PerAppAndroidScreen$ar PerAppAndroidScreen = _Translations$PerAppAndroidScreen$ar._(_root);
	@override late final _Translations$UserAgreementScreen$ar UserAgreementScreen = _Translations$UserAgreementScreen$ar._(_root);
	@override late final _Translations$VersionUpdateScreen$ar VersionUpdateScreen = _Translations$VersionUpdateScreen$ar._(_root);
	@override late final _Translations$homeScreen$ar homeScreen = _Translations$homeScreen$ar._(_root);
	@override late final _Translations$loginScreen$ar loginScreen = _Translations$loginScreen$ar._(_root);
	@override late final _Translations$planWidget$ar planWidget = _Translations$planWidget$ar._(_root);
	@override late final _Translations$xboardRegisterScreen$ar xboardRegisterScreen = _Translations$xboardRegisterScreen$ar._(_root);
	@override late final _Translations$main$ar main = _Translations$main$ar._(_root);
	@override late final _Translations$meta$ar meta = _Translations$meta$ar._(_root);
	@override late final _Translations$permission$ar permission = _Translations$permission$ar._(_root);
	@override late final _Translations$tun$ar tun = _Translations$tun$ar._(_root);
	@override String get edgeRuntimeNotInstalled => 'لم يتم تثبيت وقت تشغيل Edge WebView2 على الجهاز الحالي ولا يمكن عرض الصفحة، يرجى تنزيل وتثبيت وقت تشغيل Edge WebView2 (x64)، وإعادة تشغيل التطبيق والمحاولة مرة أخرى.';
	@override Map<String, String> get locales => {
		'en': 'English',
		'zh-CN': '简体中文',
		'zh-TW': '繁體中文',
		'ja': '日本語',
		'ko': '한국어',
		'ar': 'عربي',
		'ru': 'Русский',
		'fa': 'فارسی',
	};
}

// Path: LaunchFailedScreen
class _Translations$LaunchFailedScreen$ar implements Translations$LaunchFailedScreen$en {
	_Translations$LaunchFailedScreen$ar._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get invalidProcess => 'فشل التطبيق في البدء [اسم عملية غير صالح] ، يرجى إعادة تثبيت التطبيق إلى دليل منفصل';
	@override String get invalidProfile => 'فشل التطبيق في البدء [فشل في الوصول إلى الملف الشخصي] ، يرجى إعادة تثبيت التطبيق';
	@override String get invalidVersion => 'فشل التطبيق في بدء [إصدار غير صالح] ، يرجى إعادة تثبيت التطبيق';
	@override String get systemVersionLow => 'فشل بدء تشغيل التطبيق [إصدار النظام منخفض جدًا]';
	@override String get invalidInstallPath => 'مسار التثبيت غير صالح ، يرجى إعادة تثبيته إلى مسار صالح';
}

// Path: PerAppAndroidScreen
class _Translations$PerAppAndroidScreen$ar implements Translations$PerAppAndroidScreen$en {
	_Translations$PerAppAndroidScreen$ar._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'لكل وكيل تطبيق';
	@override String get whiteListMode => 'وضع القائمة البيضاء';
	@override String get whiteListModeTip => 'عند التمكين: فقط التطبيقات التي تم فحصها هي وكلاء ؛عندما لا يتم تمكينها: فقط التطبيقات التي لم يتم فحصها هي وكلاء';
}

// Path: UserAgreementScreen
class _Translations$UserAgreementScreen$ar implements Translations$UserAgreementScreen$en {
	_Translations$UserAgreementScreen$ar._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get privacyFirst => 'خصوصيتك تأتي أولا';
	@override String get agreeAndContinue => 'قبول ومتابعة';
}

// Path: VersionUpdateScreen
class _Translations$VersionUpdateScreen$ar implements Translations$VersionUpdateScreen$en {
	_Translations$VersionUpdateScreen$ar._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String versionReady({required Object p}) => 'الإصدار الجديد [${p}] جاهز';
	@override String get update => 'أعد التشغيل للتحديث';
	@override String get cancel => 'ليس الآن';
}

// Path: homeScreen
class _Translations$homeScreen$ar implements Translations$homeScreen$en {
	_Translations$homeScreen$ar._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get traffic => 'حجم:';
	@override String get speed => 'السرعة:';
	@override String get autoSelect => 'اختيار تلقائي';
	@override String get loadBalance => 'موازنة التحميل';
	@override String get serviceCenter => 'مركز الخدمة';
	@override String get onlineSupport => 'الدعم المباشر';
	@override String get subscriptionChannel => 'قناة الاشتراك';
	@override String get buyPlan => 'شراء الباقة';
}

// Path: loginScreen
class _Translations$loginScreen$ar implements Translations$loginScreen$en {
	_Translations$loginScreen$ar._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get login => 'دخول';
	@override String get register => 'إنشاء حساب';
	@override String get forgotPassword => 'هل نسيت كلمة المرور';
	@override String get provider => 'مزود الخدمة';
	@override String get providerName => 'رمز/اسم مستعار ${_root.loginScreen.provider}';
	@override String get providerNameRequired => 'يرجى إدخال الرمز/الاسم المستعار لـ ${_root.loginScreen.provider}';
	@override String get account => 'حساب';
	@override String get accountRequired => 'يرجى إدخال الحساب';
	@override String get email => 'البريد الإلكتروني';
	@override String get emailRequired => 'يرجى إدخال عنوان بريدك الإلكتروني';
	@override String get password => 'كلمة المرور';
	@override String get passwordRequired => 'يرجى إدخال كلمة المرور';
	@override String get validEmailRequired => 'يرجى إدخال عنوان بريد إلكتروني صحيح';
	@override String passwordMinLength({required Object minLength}) => 'يجب أن تكون كلمة المرور ${minLength} أحرف على الأقل';
	@override String get unsupportedProvider => '${_root.loginScreen.provider} غير مدعوم';
	@override String get unsupportedProviderType => 'نوع ${_root.loginScreen.provider} غير مدعوم';
}

// Path: planWidget
class _Translations$planWidget$ar implements Translations$planWidget$en {
	_Translations$planWidget$ar._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get used => 'المستخدمة';
	@override String get totalTraffic => 'إجمالي حجم البيانات';
	@override String get expirationTime => 'وقت انتهاء الصلاحية';
	@override String get remainingTime => 'الوقت المتبقي';
}

// Path: xboardRegisterScreen
class _Translations$xboardRegisterScreen$ar implements Translations$xboardRegisterScreen$en {
	_Translations$xboardRegisterScreen$ar._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get register => 'تسجيل';
	@override String get email => 'البريد الإلكتروني';
	@override String get emailVerificationCode => 'رمز التحقق من البريد الإلكتروني';
	@override String get send => 'إرسال';
	@override String get password => 'كلمة المرور';
	@override String get confirmPassword => 'تأكيد كلمة المرور';
	@override String get verificationCode => 'رمز التحقق';
	@override String get invitationCode => 'كود الدعوة';
	@override String get emailSentNotice => 'تم إرسال رمز التحقق إلى بريدك الإلكتروني';
	@override String get registerSuccess => 'تم التسجيل بنجاح';
	@override String get invalidEmail => 'يرجى إدخال عنوان بريد إلكتروني صحيح';
	@override String get passwordRequired => 'يرجى إدخال كلمة المرور';
	@override String passwordMinLength({required Object minLength}) => 'يجب أن تكون كلمة المرور ${minLength} أحرف على الأقل';
	@override String get confirmPasswordRequired => 'يرجى إدخال كلمة المرور مرة أخرى';
	@override String get passwordMismatch => 'كلمات المرور غير متطابقة';
	@override String get emailCodeRequired => 'يرجى إدخال رمز التحقق من البريد الإلكتروني';
	@override String emailCodeLength({required Object codeLength}) => 'يجب أن يكون رمز التحقق من البريد الإلكتروني ${codeLength} أرقام';
	@override String get verificationCodeRequired => 'يرجى إدخال رمز التحقق';
	@override String get verificationCodeLength => 'خطأ في طول رمز التحقق';
	@override String get userAgreement => 'اتفاقية المستخدم';
	@override String get pleaseCheck => 'يرجى التحديد';
}

// Path: main
class _Translations$main$ar implements Translations$main$en {
	_Translations$main$ar._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override late final _Translations$main$tray$ar tray = _Translations$main$tray$ar._(_root);
}

// Path: meta
class _Translations$meta$ar implements Translations$meta$en {
	_Translations$meta$ar._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get enable => 'يُمكَِن';
	@override String get disable => 'إبطال';
	@override String get open => 'يفتح';
	@override String get close => 'إنهاء';
	@override String get quit => 'يترك';
	@override String get add => 'اضف إليه';
	@override String get byDefault => 'تقصير';
	@override String get more => 'أكثر';
	@override String get tips => 'معلومات';
	@override String get copy => 'ينسخ';
	@override String get save => 'يحفظ';
	@override String get ok => 'نعم';
	@override String get cancel => 'يلغي';
	@override String get faq => 'أسئلة مكررة';
	@override String get download => 'تحميل';
	@override String get loading => 'تحميل...';
	@override String get days => 'أيام';
	@override String get hours => 'ساعات';
	@override String get minutes => 'دقائق';
	@override String get seconds => 'ثانية';
	@override String get milliseconds => 'ميلي ثانية';
	@override String get protocol => 'بروتوكول';
	@override String get search => 'يبحث';
	@override String get custom => 'مخصص';
	@override String get connect => 'يتصل';
	@override String get disconnect => 'قطع الاتصال';
	@override String get connected => 'متصل';
	@override String get disconnected => 'انقطع الاتصال';
	@override String get connecting => 'توصيل';
	@override String get connectTimeout => 'ربط مهلة';
	@override String get timeout => 'نفذ الوقت';
	@override String get timeoutDuration => 'مدة مهلة الانتظار';
	@override String get latency => 'تأخير';
	@override String get latencyTest => 'كشف التأخير';
	@override String get language => 'لغة';
	@override String get next => 'التالي';
	@override String get done => 'منتهي';
	@override String get apply => 'يتقدم';
	@override String get refresh => 'ينعش';
	@override String get retry => 'إعادة المحاولة?';
	@override String get update => 'تجديد';
	@override String get none => 'لا أحد';
	@override String get reset => 'إعادة ضبط';
	@override String get authentication => 'التفويض';
	@override String get submit => 'يُقدِّم';
	@override String get user => 'مستخدم';
	@override String get account => 'حساب';
	@override String get password => 'كلمة المرور';
	@override String get required => 'مطلوب';
	@override String get sudoPassword => 'كلمة مرور sudo (مطلوبة لوضع TUN)';
	@override String get other => 'آخر';
	@override String get dns => 'DNS';
	@override String get url => 'URL';
	@override String get urlInvalid => 'URL غير صالح';
	@override String get urlCannotEmpty => 'لا يمكن أن يكون الرابط فارغًا';
	@override String get launchAtStartup => 'إطلاق عند بدء التشغيل';
	@override String get launchAtStartupRunAsAdmin => 'يرجى إعادة تشغيل SkiVPN كمسؤول';
	@override String get tunModeRunAsAdmin => 'يتطلب وضع TUN أذونات مسؤول النظام ، يرجى إعادة تشغيل التطبيق كمسؤول';
	@override String get requireAdminPrivilegeAtStartup => 'أعد تشغيل التطبيق كمسؤول (يتطلب وضع TUN أذونات المسؤول)';
	@override String get portableMode => 'الوضع المحمول';
	@override String get portableModeDisableTips => 'إذا كنت بحاجة إلى الخروج من الوضع المحمول، فيرجى الخروج من [skivpn] وحذف المجلد [portable] يدويًا في نفس الدليل مثل [ski.exe]';
	@override String get systemProxy => 'وكيل النظام';
	@override String get autoConnectAfterLaunch => 'اتصال السيارات بعد الإطلاق';
	@override String get autoConnectAtBoot => 'الاتصال التلقائي بعد بدء تشغيل النظام';
	@override String get autoConnectAtBootTips => 'يجب دعم النظام؛ وقد تتطلب بعض الأنظمة أيضًا تمكين [البدء التلقائي].';
	@override String get hideAfterLaunch => 'إخفاء النافذة بعد بدء التشغيل';
	@override String get autoSetSystemProxy => 'وكيل نظام تعيين تلقائي عند الاتصال';
	@override String get bypassSystemProxy => 'أسماء النطاقات المسموح لها بتجاوز وكيل النظام';
	@override String get excludeFromRecent => 'إخفاء من المهام الأخيرة';
	@override String get wakeLock => 'قفل الاستيقاظ';
	@override String get hideVpn => 'إخفاء أيقونة VPN';
	@override String get hideVpnTips => 'سيؤدي تمكين IPv6 إلى فشل هذه الوظيفة';
	@override String get hideDockIcon => 'إخفاء أيقونة Dock';
	@override String get website => 'موقع إلكتروني';
	@override String get termOfUse => 'شرط الخدمة';
	@override String get privacyPolicy => 'سياسة الخصوصية';
	@override String get log => 'سجل';
	@override String get coreLog => 'سجل النواة';
	@override String get core => 'جوهر';
	@override String get help => 'يساعد';
	@override String get tutorial => 'درس تعليمي';
	@override String get board => 'لوحة';
	@override String get boardOnline => 'استخدام اللوحة عبر الإنترنت';
	@override String get boardOnlineUrl => 'عنوان URL للوحة عبر الإنترنت';
	@override String get boardLocalPort => 'منفذ اللوحة المحلية';
	@override String get disableFontScaler => 'Disable Font scaling(Restart takes effect)';
	@override String get autoOrientation => 'Rotate with the screen';
	@override String get restartTakesEffect => 'Restart takes effect';
	@override String get reconnectTakesEffect => 'سيتم تطبيقه بعد إعادة الاتصال.';
	@override String get runtimeProfile => 'تكوين وقت التشغيل';
	@override String get willCompleteAfterRebootInstall => 'يرجى إعادة تشغيل جهازك لإكمال تثبيت توسيع النظام';
	@override String get willCompleteAfterRebootUninstall => 'يرجى إعادة تشغيل جهازك لإكمال إلغاء تثبيت ملحق النظام';
	@override String get requestNeedsUserApproval => '١. يُرجى السماح لـ SkiVPN بتثبيت ملحقات النظام من [إعدادات النظام] - [الخصوصية والأمان]. ٢. : [إعدادات النظام] - [عام] - [عناصر تسجيل الدخول والملحقات - ملحقات الشبكة] فعّل [skiServiceSE]. أعد الاتصال بعد الانتهاء.';
	@override String get FullDiskAccessPermissionRequired => 'يرجى تمكين إذن skiServiceSE في [إعدادات النظام]-[الخصوصية والأمان]-[الوصول الكامل للقرص] وإعادة الاتصال.';
	@override String get proxy => 'التمثيل';
	@override String get theme => 'سمة';
	@override String get tvMode => 'وضع التلفزيون';
	@override String get autoUpdate => 'التحديثات التلقائية';
	@override String get updateChannel => 'تحديث القنوات تلقائيا';
	@override String hasNewVersion({required Object p}) => 'تحديث الإصدار ${p}';
	@override String get autoDownloadPkg => 'تنزيل حزم التحديث تلقائيًا';
	@override String get devOptions => 'خيارات للمطور';
	@override String get about => 'عن';
	@override String get name => 'اسم';
	@override String get logout => 'تسجيل الخروج';
	@override String get version => 'إصدار';
	@override String get notice => 'يلاحظ';
	@override String get sort => 'إعادة ترتيب';
	@override String get recommended => 'يوصي';
	@override String innerError({required Object p}) => 'خطأ داخلي: ${p}';
	@override String get server => 'الخادم';
	@override String get setting => 'إعدادات';
	@override String get settingCore => 'الإعدادات الأساسية';
	@override String get settingApp => 'إعدادات التطبيق';
	@override String get deviceNoSpace => 'مساحة غير كافيه في القرص';
	@override String get hideSystemApp => 'إخفاء تطبيقات النظام';
	@override String get hideAppIcon => 'إخفاء أيقونة التطبيق';
	@override String get openDir => 'فتح دليل الملف';
	@override String get uwpExemption => 'إعفاء عزل شبكة UWP';
}

// Path: permission
class _Translations$permission$ar implements Translations$permission$en {
	_Translations$permission$ar._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get appQuery => 'الحصول على قائمة التطبيقات';
	@override String request({required Object p}) => 'تمكين أذونات [${p}]';
	@override String requestNeed({required Object p}) => 'الرجاء تفعيل إذن [${p}]';
}

// Path: tun
class _Translations$tun$ar implements Translations$tun$en {
	_Translations$tun$ar._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get stack => 'مكدس الشبكة';
	@override String get inet4Address => 'نطاق عناوين IPv4';
	@override String get inet6Address => 'نطاق عناوين IPv6';
	@override String get dnsHijack => 'اختطاف DNS';
	@override String get strictRoute => 'التوجيه الصارم';
	@override String get icmpForward => 'توجيه رسائل ICMP';
	@override String get allowBypass => 'السماح للتطبيقات بتجاوز VPN';
	@override String get appendHttpProxy => 'إلحاق وكيل HTTP إلى VPN';
	@override String get bypassHttpProxyDomain => 'المجالات المسموح لها بتجاوز وكيل HTTP';
}

// Path: main.tray
class _Translations$main$tray$ar implements Translations$main$tray$en {
	_Translations$main$tray$ar._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get menuOpen => 'يفتح';
	@override String get menuExit => 'مخرج';
}

/// The flat map containing all translations for locale <ar>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsAr {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'LaunchFailedScreen.invalidProcess' => 'فشل التطبيق في البدء [اسم عملية غير صالح] ، يرجى إعادة تثبيت التطبيق إلى دليل منفصل',
			'LaunchFailedScreen.invalidProfile' => 'فشل التطبيق في البدء [فشل في الوصول إلى الملف الشخصي] ، يرجى إعادة تثبيت التطبيق',
			'LaunchFailedScreen.invalidVersion' => 'فشل التطبيق في بدء [إصدار غير صالح] ، يرجى إعادة تثبيت التطبيق',
			'LaunchFailedScreen.systemVersionLow' => 'فشل بدء تشغيل التطبيق [إصدار النظام منخفض جدًا]',
			'LaunchFailedScreen.invalidInstallPath' => 'مسار التثبيت غير صالح ، يرجى إعادة تثبيته إلى مسار صالح',
			'PerAppAndroidScreen.title' => 'لكل وكيل تطبيق',
			'PerAppAndroidScreen.whiteListMode' => 'وضع القائمة البيضاء',
			'PerAppAndroidScreen.whiteListModeTip' => 'عند التمكين: فقط التطبيقات التي تم فحصها هي وكلاء ؛عندما لا يتم تمكينها: فقط التطبيقات التي لم يتم فحصها هي وكلاء',
			'UserAgreementScreen.privacyFirst' => 'خصوصيتك تأتي أولا',
			'UserAgreementScreen.agreeAndContinue' => 'قبول ومتابعة',
			'VersionUpdateScreen.versionReady' => ({required Object p}) => 'الإصدار الجديد [${p}] جاهز',
			'VersionUpdateScreen.update' => 'أعد التشغيل للتحديث',
			'VersionUpdateScreen.cancel' => 'ليس الآن',
			'homeScreen.traffic' => 'حجم:',
			'homeScreen.speed' => 'السرعة:',
			'homeScreen.autoSelect' => 'اختيار تلقائي',
			'homeScreen.loadBalance' => 'موازنة التحميل',
			'homeScreen.serviceCenter' => 'مركز الخدمة',
			'homeScreen.onlineSupport' => 'الدعم المباشر',
			'homeScreen.subscriptionChannel' => 'قناة الاشتراك',
			'homeScreen.buyPlan' => 'شراء الباقة',
			'loginScreen.login' => 'دخول',
			'loginScreen.register' => 'إنشاء حساب',
			'loginScreen.forgotPassword' => 'هل نسيت كلمة المرور',
			'loginScreen.provider' => 'مزود الخدمة',
			'loginScreen.providerName' => 'رمز/اسم مستعار ${_root.loginScreen.provider}',
			'loginScreen.providerNameRequired' => 'يرجى إدخال الرمز/الاسم المستعار لـ ${_root.loginScreen.provider}',
			'loginScreen.account' => 'حساب',
			'loginScreen.accountRequired' => 'يرجى إدخال الحساب',
			'loginScreen.email' => 'البريد الإلكتروني',
			'loginScreen.emailRequired' => 'يرجى إدخال عنوان بريدك الإلكتروني',
			'loginScreen.password' => 'كلمة المرور',
			'loginScreen.passwordRequired' => 'يرجى إدخال كلمة المرور',
			'loginScreen.validEmailRequired' => 'يرجى إدخال عنوان بريد إلكتروني صحيح',
			'loginScreen.passwordMinLength' => ({required Object minLength}) => 'يجب أن تكون كلمة المرور ${minLength} أحرف على الأقل',
			'loginScreen.unsupportedProvider' => '${_root.loginScreen.provider} غير مدعوم',
			'loginScreen.unsupportedProviderType' => 'نوع ${_root.loginScreen.provider} غير مدعوم',
			'planWidget.used' => 'المستخدمة',
			'planWidget.totalTraffic' => 'إجمالي حجم البيانات',
			'planWidget.expirationTime' => 'وقت انتهاء الصلاحية',
			'planWidget.remainingTime' => 'الوقت المتبقي',
			'xboardRegisterScreen.register' => 'تسجيل',
			'xboardRegisterScreen.email' => 'البريد الإلكتروني',
			'xboardRegisterScreen.emailVerificationCode' => 'رمز التحقق من البريد الإلكتروني',
			'xboardRegisterScreen.send' => 'إرسال',
			'xboardRegisterScreen.password' => 'كلمة المرور',
			'xboardRegisterScreen.confirmPassword' => 'تأكيد كلمة المرور',
			'xboardRegisterScreen.verificationCode' => 'رمز التحقق',
			'xboardRegisterScreen.invitationCode' => 'كود الدعوة',
			'xboardRegisterScreen.emailSentNotice' => 'تم إرسال رمز التحقق إلى بريدك الإلكتروني',
			'xboardRegisterScreen.registerSuccess' => 'تم التسجيل بنجاح',
			'xboardRegisterScreen.invalidEmail' => 'يرجى إدخال عنوان بريد إلكتروني صحيح',
			'xboardRegisterScreen.passwordRequired' => 'يرجى إدخال كلمة المرور',
			'xboardRegisterScreen.passwordMinLength' => ({required Object minLength}) => 'يجب أن تكون كلمة المرور ${minLength} أحرف على الأقل',
			'xboardRegisterScreen.confirmPasswordRequired' => 'يرجى إدخال كلمة المرور مرة أخرى',
			'xboardRegisterScreen.passwordMismatch' => 'كلمات المرور غير متطابقة',
			'xboardRegisterScreen.emailCodeRequired' => 'يرجى إدخال رمز التحقق من البريد الإلكتروني',
			'xboardRegisterScreen.emailCodeLength' => ({required Object codeLength}) => 'يجب أن يكون رمز التحقق من البريد الإلكتروني ${codeLength} أرقام',
			'xboardRegisterScreen.verificationCodeRequired' => 'يرجى إدخال رمز التحقق',
			'xboardRegisterScreen.verificationCodeLength' => 'خطأ في طول رمز التحقق',
			'xboardRegisterScreen.userAgreement' => 'اتفاقية المستخدم',
			'xboardRegisterScreen.pleaseCheck' => 'يرجى التحديد',
			'main.tray.menuOpen' => 'يفتح',
			'main.tray.menuExit' => 'مخرج',
			'meta.enable' => 'يُمكَِن',
			'meta.disable' => 'إبطال',
			'meta.open' => 'يفتح',
			'meta.close' => 'إنهاء',
			'meta.quit' => 'يترك',
			'meta.add' => 'اضف إليه',
			'meta.byDefault' => 'تقصير',
			'meta.more' => 'أكثر',
			'meta.tips' => 'معلومات',
			'meta.copy' => 'ينسخ',
			'meta.save' => 'يحفظ',
			'meta.ok' => 'نعم',
			'meta.cancel' => 'يلغي',
			'meta.faq' => 'أسئلة مكررة',
			'meta.download' => 'تحميل',
			'meta.loading' => 'تحميل...',
			'meta.days' => 'أيام',
			'meta.hours' => 'ساعات',
			'meta.minutes' => 'دقائق',
			'meta.seconds' => 'ثانية',
			'meta.milliseconds' => 'ميلي ثانية',
			'meta.protocol' => 'بروتوكول',
			'meta.search' => 'يبحث',
			'meta.custom' => 'مخصص',
			'meta.connect' => 'يتصل',
			'meta.disconnect' => 'قطع الاتصال',
			'meta.connected' => 'متصل',
			'meta.disconnected' => 'انقطع الاتصال',
			'meta.connecting' => 'توصيل',
			'meta.connectTimeout' => 'ربط مهلة',
			'meta.timeout' => 'نفذ الوقت',
			'meta.timeoutDuration' => 'مدة مهلة الانتظار',
			'meta.latency' => 'تأخير',
			'meta.latencyTest' => 'كشف التأخير',
			'meta.language' => 'لغة',
			'meta.next' => 'التالي',
			'meta.done' => 'منتهي',
			'meta.apply' => 'يتقدم',
			'meta.refresh' => 'ينعش',
			'meta.retry' => 'إعادة المحاولة?',
			'meta.update' => 'تجديد',
			'meta.none' => 'لا أحد',
			'meta.reset' => 'إعادة ضبط',
			'meta.authentication' => 'التفويض',
			'meta.submit' => 'يُقدِّم',
			'meta.user' => 'مستخدم',
			'meta.account' => 'حساب',
			'meta.password' => 'كلمة المرور',
			'meta.required' => 'مطلوب',
			'meta.sudoPassword' => 'كلمة مرور sudo (مطلوبة لوضع TUN)',
			'meta.other' => 'آخر',
			'meta.dns' => 'DNS',
			'meta.url' => 'URL',
			'meta.urlInvalid' => 'URL غير صالح',
			'meta.urlCannotEmpty' => 'لا يمكن أن يكون الرابط فارغًا',
			'meta.launchAtStartup' => 'إطلاق عند بدء التشغيل',
			'meta.launchAtStartupRunAsAdmin' => 'يرجى إعادة تشغيل SkiVPN كمسؤول',
			'meta.tunModeRunAsAdmin' => 'يتطلب وضع TUN أذونات مسؤول النظام ، يرجى إعادة تشغيل التطبيق كمسؤول',
			'meta.requireAdminPrivilegeAtStartup' => 'أعد تشغيل التطبيق كمسؤول (يتطلب وضع TUN أذونات المسؤول)',
			'meta.portableMode' => 'الوضع المحمول',
			'meta.portableModeDisableTips' => 'إذا كنت بحاجة إلى الخروج من الوضع المحمول، فيرجى الخروج من [skivpn] وحذف المجلد [portable] يدويًا في نفس الدليل مثل [ski.exe]',
			'meta.systemProxy' => 'وكيل النظام',
			'meta.autoConnectAfterLaunch' => 'اتصال السيارات بعد الإطلاق',
			'meta.autoConnectAtBoot' => 'الاتصال التلقائي بعد بدء تشغيل النظام',
			'meta.autoConnectAtBootTips' => 'يجب دعم النظام؛ وقد تتطلب بعض الأنظمة أيضًا تمكين [البدء التلقائي].',
			'meta.hideAfterLaunch' => 'إخفاء النافذة بعد بدء التشغيل',
			'meta.autoSetSystemProxy' => 'وكيل نظام تعيين تلقائي عند الاتصال',
			'meta.bypassSystemProxy' => 'أسماء النطاقات المسموح لها بتجاوز وكيل النظام',
			'meta.excludeFromRecent' => 'إخفاء من المهام الأخيرة',
			'meta.wakeLock' => 'قفل الاستيقاظ',
			'meta.hideVpn' => 'إخفاء أيقونة VPN',
			'meta.hideVpnTips' => 'سيؤدي تمكين IPv6 إلى فشل هذه الوظيفة',
			'meta.hideDockIcon' => 'إخفاء أيقونة Dock',
			'meta.website' => 'موقع إلكتروني',
			'meta.termOfUse' => 'شرط الخدمة',
			'meta.privacyPolicy' => 'سياسة الخصوصية',
			'meta.log' => 'سجل',
			'meta.coreLog' => 'سجل النواة',
			'meta.core' => 'جوهر',
			'meta.help' => 'يساعد',
			'meta.tutorial' => 'درس تعليمي',
			'meta.board' => 'لوحة',
			'meta.boardOnline' => 'استخدام اللوحة عبر الإنترنت',
			'meta.boardOnlineUrl' => 'عنوان URL للوحة عبر الإنترنت',
			'meta.boardLocalPort' => 'منفذ اللوحة المحلية',
			'meta.disableFontScaler' => 'Disable Font scaling(Restart takes effect)',
			'meta.autoOrientation' => 'Rotate with the screen',
			'meta.restartTakesEffect' => 'Restart takes effect',
			'meta.reconnectTakesEffect' => 'سيتم تطبيقه بعد إعادة الاتصال.',
			'meta.runtimeProfile' => 'تكوين وقت التشغيل',
			'meta.willCompleteAfterRebootInstall' => 'يرجى إعادة تشغيل جهازك لإكمال تثبيت توسيع النظام',
			'meta.willCompleteAfterRebootUninstall' => 'يرجى إعادة تشغيل جهازك لإكمال إلغاء تثبيت ملحق النظام',
			'meta.requestNeedsUserApproval' => '١. يُرجى السماح لـ SkiVPN بتثبيت ملحقات النظام من [إعدادات النظام] - [الخصوصية والأمان]. ٢. : [إعدادات النظام] - [عام] - [عناصر تسجيل الدخول والملحقات - ملحقات الشبكة] فعّل [skiServiceSE]. أعد الاتصال بعد الانتهاء.',
			'meta.FullDiskAccessPermissionRequired' => 'يرجى تمكين إذن skiServiceSE في [إعدادات النظام]-[الخصوصية والأمان]-[الوصول الكامل للقرص] وإعادة الاتصال.',
			'meta.proxy' => 'التمثيل',
			'meta.theme' => 'سمة',
			'meta.tvMode' => 'وضع التلفزيون',
			'meta.autoUpdate' => 'التحديثات التلقائية',
			'meta.updateChannel' => 'تحديث القنوات تلقائيا',
			'meta.hasNewVersion' => ({required Object p}) => 'تحديث الإصدار ${p}',
			'meta.autoDownloadPkg' => 'تنزيل حزم التحديث تلقائيًا',
			'meta.devOptions' => 'خيارات للمطور',
			'meta.about' => 'عن',
			'meta.name' => 'اسم',
			'meta.logout' => 'تسجيل الخروج',
			'meta.version' => 'إصدار',
			'meta.notice' => 'يلاحظ',
			'meta.sort' => 'إعادة ترتيب',
			'meta.recommended' => 'يوصي',
			'meta.innerError' => ({required Object p}) => 'خطأ داخلي: ${p}',
			'meta.server' => 'الخادم',
			'meta.setting' => 'إعدادات',
			'meta.settingCore' => 'الإعدادات الأساسية',
			'meta.settingApp' => 'إعدادات التطبيق',
			'meta.deviceNoSpace' => 'مساحة غير كافيه في القرص',
			'meta.hideSystemApp' => 'إخفاء تطبيقات النظام',
			'meta.hideAppIcon' => 'إخفاء أيقونة التطبيق',
			'meta.openDir' => 'فتح دليل الملف',
			'meta.uwpExemption' => 'إعفاء عزل شبكة UWP',
			'permission.appQuery' => 'الحصول على قائمة التطبيقات',
			'permission.request' => ({required Object p}) => 'تمكين أذونات [${p}]',
			'permission.requestNeed' => ({required Object p}) => 'الرجاء تفعيل إذن [${p}]',
			'tun.stack' => 'مكدس الشبكة',
			'tun.inet4Address' => 'نطاق عناوين IPv4',
			'tun.inet6Address' => 'نطاق عناوين IPv6',
			'tun.dnsHijack' => 'اختطاف DNS',
			'tun.strictRoute' => 'التوجيه الصارم',
			'tun.icmpForward' => 'توجيه رسائل ICMP',
			'tun.allowBypass' => 'السماح للتطبيقات بتجاوز VPN',
			'tun.appendHttpProxy' => 'إلحاق وكيل HTTP إلى VPN',
			'tun.bypassHttpProxyDomain' => 'المجالات المسموح لها بتجاوز وكيل HTTP',
			'edgeRuntimeNotInstalled' => 'لم يتم تثبيت وقت تشغيل Edge WebView2 على الجهاز الحالي ولا يمكن عرض الصفحة، يرجى تنزيل وتثبيت وقت تشغيل Edge WebView2 (x64)، وإعادة تشغيل التطبيق والمحاولة مرة أخرى.',
			'locales.en' => 'English',
			'locales.zh-CN' => '简体中文',
			'locales.zh-TW' => '繁體中文',
			'locales.ja' => '日本語',
			'locales.ko' => '한국어',
			'locales.ar' => 'عربي',
			'locales.ru' => 'Русский',
			'locales.fa' => 'فارسی',
			_ => null,
		};
	}
}
