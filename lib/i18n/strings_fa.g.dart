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
class TranslationsFa with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsFa({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.fa,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <fa>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsFa _root = this; // ignore: unused_field

	@override 
	TranslationsFa $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsFa(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsLaunchFailedScreenFa LaunchFailedScreen = _TranslationsLaunchFailedScreenFa._(_root);
	@override late final _TranslationsPerAppAndroidScreenFa PerAppAndroidScreen = _TranslationsPerAppAndroidScreenFa._(_root);
	@override late final _TranslationsUserAgreementScreenFa UserAgreementScreen = _TranslationsUserAgreementScreenFa._(_root);
	@override late final _TranslationsVersionUpdateScreenFa VersionUpdateScreen = _TranslationsVersionUpdateScreenFa._(_root);
	@override late final _TranslationsHomeScreenFa homeScreen = _TranslationsHomeScreenFa._(_root);
	@override late final _TranslationsLoginScreenFa loginScreen = _TranslationsLoginScreenFa._(_root);
	@override late final _TranslationsPlanWidgetFa planWidget = _TranslationsPlanWidgetFa._(_root);
	@override late final _TranslationsXboardRegisterScreenFa xboardRegisterScreen = _TranslationsXboardRegisterScreenFa._(_root);
	@override late final _TranslationsMainFa main = _TranslationsMainFa._(_root);
	@override late final _TranslationsMetaFa meta = _TranslationsMetaFa._(_root);
	@override late final _TranslationsPermissionFa permission = _TranslationsPermissionFa._(_root);
	@override late final _TranslationsTunFa tun = _TranslationsTunFa._(_root);
	@override String get edgeRuntimeNotInstalled => 'زمان اجرا Edge WebView2 روی دستگاه فعلی نصب نشده است و صفحه قابل نمایش نیست لطفاً زمان اجرا Edge WebView2 (x64) را بارگیری و نصب کنید، برنامه را مجدداً راه اندازی کنید و دوباره امتحان کنید.';
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
class _TranslationsLaunchFailedScreenFa implements TranslationsLaunchFailedScreenEn {
	_TranslationsLaunchFailedScreenFa._(this._root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get invalidProcess => 'اجرای نرم‌افزار ناموفق بود [نام‌ اجرایی پروسه نامعتبر]، لطفا مجدد نرم‌افزار را در دایرکتوری دیگری نصب کنید';
	@override String get invalidProfile => 'اجرای نرم‌افزار ناموفق بود [دسترسی به پروفایل ناموفق بود]، لطفا مجدد نرم افزار را نصب کنید';
	@override String get invalidVersion => 'اجرای نرم‌افزار ناموفق بود [ورژن نامعتبر]، لطفا مجدد نرم‌افزار را نصب کنید';
	@override String get systemVersionLow => 'راه اندازی برنامه ناموفق بود [نسخه سیستم خیلی کم است]';
	@override String get invalidInstallPath => 'مسیر نصب نامعتبر است، لطفا مجدد در مسیر معتبر نصب کنید';
}

// Path: PerAppAndroidScreen
class _TranslationsPerAppAndroidScreenFa implements TranslationsPerAppAndroidScreenEn {
	_TranslationsPerAppAndroidScreenFa._(this._root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'پروکسی به‌تفکیک برنامه';
	@override String get whiteListMode => 'حالت لیست سفید';
	@override String get whiteListModeTip => 'وقتی فعال باشد: فقط برنامه‌هایی که انتخاب شده‌اند پروکسی می‌شوند؛ وقتی فعال نباشد: فقط برنامه‌هایی که انتخاب نشده‌اند پروکسی می‌شوند';
}

// Path: UserAgreementScreen
class _TranslationsUserAgreementScreenFa implements TranslationsUserAgreementScreenEn {
	_TranslationsUserAgreementScreenFa._(this._root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get privacyFirst => 'حریم‌خصوصی شما اولویت دارد';
	@override String get agreeAndContinue => 'پذیرفتن و ادامه';
}

// Path: VersionUpdateScreen
class _TranslationsVersionUpdateScreenFa implements TranslationsVersionUpdateScreenEn {
	_TranslationsVersionUpdateScreenFa._(this._root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String versionReady({required Object p}) => 'نسخه جدید [${p}] آماده است';
	@override String get update => 'راه‌اندازی مجدد برای به‌روزرسانی';
	@override String get cancel => 'الان‌ نه';
}

// Path: homeScreen
class _TranslationsHomeScreenFa implements TranslationsHomeScreenEn {
	_TranslationsHomeScreenFa._(this._root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get traffic => 'ترافیک:';
	@override String get speed => 'سرعت:';
	@override String get autoSelect => 'انتخاب خودکار';
	@override String get loadBalance => 'تعادل بار';
	@override String get serviceCenter => 'مرکز خدمات';
	@override String get onlineSupport => 'پشتیبانی آنلاین';
	@override String get subscriptionChannel => 'کانال اشتراک';
	@override String get buyPlan => 'خرید طرح';
}

// Path: loginScreen
class _TranslationsLoginScreenFa implements TranslationsLoginScreenEn {
	_TranslationsLoginScreenFa._(this._root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get login => 'ورود';
	@override String get register => 'ایجاد حساب';
	@override String get forgotPassword => 'فراموشی رمز عبور';
	@override String get provider => 'ارائه دهنده خدمات';
	@override String get providerName => 'کد/نام مستعار ${_root.loginScreen.provider}';
	@override String get providerNameRequired => 'لطفا کد/نام مستعار ${_root.loginScreen.provider} را وارد کنید';
	@override String get account => 'حساب';
	@override String get accountRequired => 'لطفا حساب را وارد کنید';
	@override String get email => 'ایمیل';
	@override String get emailRequired => 'لطفا آدرس ایمیل را وارد کنید';
	@override String get password => 'رمز عبور';
	@override String get passwordRequired => 'لطفا رمز عبور را وارد کنید';
	@override String get validEmailRequired => 'لطفا یک آدرس ایمیل معتبر وارد کنید';
	@override String passwordMinLength({required Object minLength}) => 'طول رمز عبور باید حداقل ${minLength} کاراکتر باشد';
	@override String get unsupportedProvider => '${_root.loginScreen.provider} پشتیبانی نمی شود';
	@override String get unsupportedProviderType => 'نوع ${_root.loginScreen.provider} پشتیبانی نمی شود';
}

// Path: planWidget
class _TranslationsPlanWidgetFa implements TranslationsPlanWidgetEn {
	_TranslationsPlanWidgetFa._(this._root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get used => 'استفاده شده';
	@override String get totalTraffic => 'کل ترافیک';
	@override String get expirationTime => 'زمان انقضا';
	@override String get remainingTime => 'زمان باقی مانده';
}

// Path: xboardRegisterScreen
class _TranslationsXboardRegisterScreenFa implements TranslationsXboardRegisterScreenEn {
	_TranslationsXboardRegisterScreenFa._(this._root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get register => 'ثبت نام';
	@override String get email => 'ایمیل';
	@override String get emailVerificationCode => 'کد تایید ایمیل';
	@override String get send => 'ارسال';
	@override String get password => 'رمز عبور';
	@override String get confirmPassword => 'تأیید رمز عبور';
	@override String get verificationCode => 'کد تایید';
	@override String get invitationCode => 'کد دعوت';
	@override String get emailSentNotice => 'کد تایید برای ایمیل شما ارسال شد';
	@override String get registerSuccess => 'ثبت نام با موفقیت انجام شد';
	@override String get invalidEmail => 'لطفا یک آدرس ایمیل معتبر وارد کنید';
	@override String get passwordRequired => 'لطفا رمز عبور را وارد کنید';
	@override String passwordMinLength({required Object minLength}) => 'طول رمز عبور باید حداقل ${minLength} کاراکتر باشد';
	@override String get confirmPasswordRequired => 'لطفا رمز عبور را دوباره وارد کنید';
	@override String get passwordMismatch => 'رمزهای عبور مطابقت ندارند';
	@override String get emailCodeRequired => 'لطفا کد تایید ایمیل را وارد کنید';
	@override String emailCodeLength({required Object codeLength}) => 'کد تایید ایمیل باید ${codeLength} رقم باشد';
	@override String get verificationCodeRequired => 'لطفا کد تایید را وارد کنید';
	@override String get verificationCodeLength => 'خطا در طول کد تایید';
	@override String get userAgreement => 'توافق‌نامه کاربر';
	@override String get pleaseCheck => 'لطفاً تیک بزنید';
}

// Path: main
class _TranslationsMainFa implements TranslationsMainEn {
	_TranslationsMainFa._(this._root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsMainTrayFa tray = _TranslationsMainTrayFa._(_root);
}

// Path: meta
class _TranslationsMetaFa implements TranslationsMetaEn {
	_TranslationsMetaFa._(this._root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get enable => 'فعال‌سازی';
	@override String get disable => 'غیرفعال';
	@override String get open => 'باز کن';
	@override String get close => 'بسته';
	@override String get quit => 'خروج';
	@override String get add => 'افزودن';
	@override String get byDefault => 'پیش‌فرض';
	@override String get more => 'بیشتر';
	@override String get tips => 'اطلاعات';
	@override String get copy => 'کپی';
	@override String get save => 'ذخیره کنید';
	@override String get ok => 'خُب';
	@override String get cancel => 'لغو';
	@override String get faq => 'سوالات متداول';
	@override String get download => 'دانلود';
	@override String get loading => 'درحال بارگذاری…';
	@override String get days => 'روز';
	@override String get hours => 'ساعت';
	@override String get minutes => 'دقیقه';
	@override String get seconds => 'دومین';
	@override String get protocol => 'پروتکل';
	@override String get search => 'جستجو';
	@override String get custom => 'سفارشی';
	@override String get connect => 'اتصال';
	@override String get disconnect => 'قطع‌ اتصال';
	@override String get connected => 'وصل شد';
	@override String get disconnected => 'قطع شد';
	@override String get connecting => 'درحال اتصال';
	@override String get connectTimeout => 'اتمام مهلت اتصال';
	@override String get timeout => 'تایم اوت';
	@override String get timeoutDuration => 'مدت زمان وقفه';
	@override String get latency => 'تاخیر';
	@override String get latencyTest => 'بررسی تاخیر';
	@override String get language => 'زبان';
	@override String get next => 'بعدی';
	@override String get done => 'انجام‌شد';
	@override String get apply => 'درخواست دادن';
	@override String get refresh => 'بارگذاری مجدد';
	@override String get retry => 'دوباره امتحان کنید؟';
	@override String get update => 'تجدید';
	@override String get none => 'هیچ‌کدام';
	@override String get reset => 'ریست';
	@override String get authentication => 'مجوز';
	@override String get submit => 'ارسال';
	@override String get user => 'کاربر';
	@override String get account => 'نام‌کاربری';
	@override String get password => 'رمز‌عبور';
	@override String get required => 'الزامی';
	@override String get sudoPassword => 'رمز عبور sudo (برای حالت TUN لازم است)';
	@override String get other => 'دیگر';
	@override String get dns => 'DNS';
	@override String get url => 'URL';
	@override String get urlInvalid => 'URL نامعتبر';
	@override String get urlCannotEmpty => 'لینک نمی‌تواند خالی باشد';
	@override String get launchAtStartup => 'اجرا در راه‌اندازی';
	@override String get launchAtStartupRunAsAdmin => 'لطفاً SkiVPN را به عنوان مدیر راه اندازی مجدد کنید';
	@override String get tunModeRunAsAdmin => 'حالت TUN نیازمند مجوز مدیر سیستم می‌باشد لطفا نرم‌افزار را مجدد با حالت مدیر (administrator) راه‌اندازی کنید';
	@override String get requireAdminPrivilegeAtStartup => 'برنامه را به عنوان مدیر راه اندازی مجدد کنید (حالت TUN نیازمند مجوز مدیر می‌باشد)';
	@override String get portableMode => 'حالت قابل‌حمل';
	@override String get portableModeDisableTips => 'اگر نیاز دارین از حالت قابل‌حمل خارج شوید لطفا از [skivpn] خارج شده و به‌صورت دستی پوشه [portable] هم مسیر با فایل [ski.exe] را حذف کنید';
	@override String get systemProxy => 'پروکسی سیستم';
	@override String get autoConnectAfterLaunch => 'اتصال خودکار پس‌از راه‌اندازی';
	@override String get autoConnectAtBoot => 'اتصال خودکار پس از روشن شدن سیستم';
	@override String get autoConnectAtBootTips => 'پشتیبانی سیستم مورد نیاز است؛ برخی سیستم‌ها ممکن است نیاز به فعال بودن [شروع خودکار] نیز داشته باشند.';
	@override String get hideAfterLaunch => 'پنهان کردن پنجره پس از راه اندازی';
	@override String get autoSetSystemProxy => 'تنظیم خودکار حالت پروکسی سیستم پس‌از اتصال';
	@override String get bypassSystemProxy => 'نام های دامنه ای که مجاز به دور زدن پراکسی سیستم هستند';
	@override String get excludeFromRecent => 'پنهان شدن از وظایف اخیر';
	@override String get hideDockIcon => 'پنهان کردن آیکون داک';
	@override String get wakeLock => 'قفل بیدارباش';
	@override String get hideVpn => 'مخفی کردن آیکون VPN';
	@override String get hideVpnTips => 'فعال کردن IPv6 باعث از کار افتادن این عملکرد خواهد شد.';
	@override String get website => 'وبسایت';
	@override String get termOfUse => 'شرایط استفاده';
	@override String get privacyPolicy => 'سیاست حریم خصوصی';
	@override String get log => 'ورود به سیستم';
	@override String get coreLog => 'گزارش هسته';
	@override String get core => 'هسته';
	@override String get help => 'کمک کند';
	@override String get tutorial => 'آموزش';
	@override String get board => 'پانل';
	@override String get boardOnline => 'با استفاده از پنل آنلاین';
	@override String get boardOnlineUrl => 'آدرس پنل آنلاین';
	@override String get boardLocalPort => 'پورت پانل محلی';
	@override String get disableFontScaler => 'غیرفعال‌سازی مقیاس‌بندی فونت(با راه‌اندازی مجدد اعمال می‌شود)';
	@override String get autoOrientation => 'چرخش صفحه را دنبال کنید';
	@override String get restartTakesEffect => 'با راه‌اندازی مجدد اعمال می‌شود';
	@override String get reconnectTakesEffect => 'پس از اتصال مجدد، اعمال خواهد شد.';
	@override String get runtimeProfile => 'پیکربندی زمان اجرا';
	@override String get willCompleteAfterRebootInstall => 'لطفاً دستگاه خود را مجدداً راه اندازی کنید تا نصب افزونه سیستم تکمیل شود.';
	@override String get willCompleteAfterRebootUninstall => 'لطفاً دستگاه خود را مجدداً راه‌اندازی کنید تا حذف نصب افزونه سیستم تکمیل شود';
	@override String get requestNeedsUserApproval => '۱. لطفاً به SkiVPN اجازه دهید افزونه‌های سیستمی را در [تنظیمات سیستم] - [حریم خصوصی و امنیت] نصب کند. ۲. : [تنظیمات سیستم] - [عمومی] - [موارد ورود و افزونه‌ها - افزونه‌های شبکه] [skiServiceSE] را فعال کنید. پس از اتمام، دوباره متصل شوید.';
	@override String get FullDiskAccessPermissionRequired => 'لطفاً مجوز skiServiceSE را در [تنظیمات سیستم]-[حریم خصوصی و امنیت]-[دسترسی کامل به دیسک] فعال کنید و دوباره متصل شوید.';
	@override String get proxy => 'بازیگری';
	@override String get theme => 'موضوع';
	@override String get tvMode => 'حالت تلویزیون';
	@override String get autoUpdate => 'به روز رسانی خودکار';
	@override String get updateChannel => 'کانال به‌روزرسانی خودکار';
	@override String hasNewVersion({required Object p}) => 'به‌روزرسانی نسخه ${p} ';
	@override String get autoDownloadPkg => 'دانلود خودکار بسته‌های به‌روزرسانی';
	@override String get devOptions => 'تنظیمات توسعه‌دهندگان';
	@override String get about => 'درباره';
	@override String get name => 'نام';
	@override String get logout => 'خروج';
	@override String get version => 'نسخه';
	@override String get notice => 'اطلاعیه';
	@override String get sort => 'مرتب‌سازی';
	@override String get recommended => 'پیشنهادی';
	@override String innerError({required Object p}) => 'خطای داخلی: ${p}';
	@override String get server => 'سرور';
	@override String get setting => 'تنظیمات';
	@override String get settingCore => 'تنظیمات اصلی';
	@override String get settingApp => 'تنظیمات برنامه';
	@override String get deviceNoSpace => 'فضای خالی کافی ندارید';
	@override String get hideSystemApp => 'برنامه های سیستم را مخفی کنید';
	@override String get hideAppIcon => 'پنهان کردن نماد برنامه';
	@override String get openDir => 'بازکردن دایرکتوری فایل';
	@override String get uwpExemption => 'معافیت جداسازی شبکه UWP';
}

// Path: permission
class _TranslationsPermissionFa implements TranslationsPermissionEn {
	_TranslationsPermissionFa._(this._root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get appQuery => 'Get Application List';
	@override String request({required Object p}) => 'مجوزهای [${p}] را فعال کنید';
	@override String requestNeed({required Object p}) => 'لطفاً مجوز [${p}] را فعال کنید';
}

// Path: tun
class _TranslationsTunFa implements TranslationsTunEn {
	_TranslationsTunFa._(this._root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get stack => 'پشته شبکه';
	@override String get inet4Address => 'محدوده آدرس IPv4';
	@override String get inet6Address => 'محدوده آدرس IPv6';
	@override String get dnsHijack => 'ربودن DNS';
	@override String get strictRoute => 'مسیریابی دقیق';
	@override String get icmpForward => 'ارسال ICMP';
	@override String get allowBypass => 'به برنامه‌ها اجازه دهید VPN را دور بزنند';
	@override String get appendHttpProxy => 'پیوست دادن پروکسی HTTP به وی‌پی‌ان';
	@override String get bypassHttpProxyDomain => 'دامنه ها مجاز به دور زدن پروکسی HTTP هستند';
}

// Path: main.tray
class _TranslationsMainTrayFa implements TranslationsMainTrayEn {
	_TranslationsMainTrayFa._(this._root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get menuOpen => 'بازکردن';
	@override String get menuExit => 'بستن';
}

/// The flat map containing all translations for locale <fa>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsFa {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'LaunchFailedScreen.invalidProcess' => 'اجرای نرم‌افزار ناموفق بود [نام‌ اجرایی پروسه نامعتبر]، لطفا مجدد نرم‌افزار را در دایرکتوری دیگری نصب کنید',
			'LaunchFailedScreen.invalidProfile' => 'اجرای نرم‌افزار ناموفق بود [دسترسی به پروفایل ناموفق بود]، لطفا مجدد نرم افزار را نصب کنید',
			'LaunchFailedScreen.invalidVersion' => 'اجرای نرم‌افزار ناموفق بود [ورژن نامعتبر]، لطفا مجدد نرم‌افزار را نصب کنید',
			'LaunchFailedScreen.systemVersionLow' => 'راه اندازی برنامه ناموفق بود [نسخه سیستم خیلی کم است]',
			'LaunchFailedScreen.invalidInstallPath' => 'مسیر نصب نامعتبر است، لطفا مجدد در مسیر معتبر نصب کنید',
			'PerAppAndroidScreen.title' => 'پروکسی به‌تفکیک برنامه',
			'PerAppAndroidScreen.whiteListMode' => 'حالت لیست سفید',
			'PerAppAndroidScreen.whiteListModeTip' => 'وقتی فعال باشد: فقط برنامه‌هایی که انتخاب شده‌اند پروکسی می‌شوند؛ وقتی فعال نباشد: فقط برنامه‌هایی که انتخاب نشده‌اند پروکسی می‌شوند',
			'UserAgreementScreen.privacyFirst' => 'حریم‌خصوصی شما اولویت دارد',
			'UserAgreementScreen.agreeAndContinue' => 'پذیرفتن و ادامه',
			'VersionUpdateScreen.versionReady' => ({required Object p}) => 'نسخه جدید [${p}] آماده است',
			'VersionUpdateScreen.update' => 'راه‌اندازی مجدد برای به‌روزرسانی',
			'VersionUpdateScreen.cancel' => 'الان‌ نه',
			'homeScreen.traffic' => 'ترافیک:',
			'homeScreen.speed' => 'سرعت:',
			'homeScreen.autoSelect' => 'انتخاب خودکار',
			'homeScreen.loadBalance' => 'تعادل بار',
			'homeScreen.serviceCenter' => 'مرکز خدمات',
			'homeScreen.onlineSupport' => 'پشتیبانی آنلاین',
			'homeScreen.subscriptionChannel' => 'کانال اشتراک',
			'homeScreen.buyPlan' => 'خرید طرح',
			'loginScreen.login' => 'ورود',
			'loginScreen.register' => 'ایجاد حساب',
			'loginScreen.forgotPassword' => 'فراموشی رمز عبور',
			'loginScreen.provider' => 'ارائه دهنده خدمات',
			'loginScreen.providerName' => 'کد/نام مستعار ${_root.loginScreen.provider}',
			'loginScreen.providerNameRequired' => 'لطفا کد/نام مستعار ${_root.loginScreen.provider} را وارد کنید',
			'loginScreen.account' => 'حساب',
			'loginScreen.accountRequired' => 'لطفا حساب را وارد کنید',
			'loginScreen.email' => 'ایمیل',
			'loginScreen.emailRequired' => 'لطفا آدرس ایمیل را وارد کنید',
			'loginScreen.password' => 'رمز عبور',
			'loginScreen.passwordRequired' => 'لطفا رمز عبور را وارد کنید',
			'loginScreen.validEmailRequired' => 'لطفا یک آدرس ایمیل معتبر وارد کنید',
			'loginScreen.passwordMinLength' => ({required Object minLength}) => 'طول رمز عبور باید حداقل ${minLength} کاراکتر باشد',
			'loginScreen.unsupportedProvider' => '${_root.loginScreen.provider} پشتیبانی نمی شود',
			'loginScreen.unsupportedProviderType' => 'نوع ${_root.loginScreen.provider} پشتیبانی نمی شود',
			'planWidget.used' => 'استفاده شده',
			'planWidget.totalTraffic' => 'کل ترافیک',
			'planWidget.expirationTime' => 'زمان انقضا',
			'planWidget.remainingTime' => 'زمان باقی مانده',
			'xboardRegisterScreen.register' => 'ثبت نام',
			'xboardRegisterScreen.email' => 'ایمیل',
			'xboardRegisterScreen.emailVerificationCode' => 'کد تایید ایمیل',
			'xboardRegisterScreen.send' => 'ارسال',
			'xboardRegisterScreen.password' => 'رمز عبور',
			'xboardRegisterScreen.confirmPassword' => 'تأیید رمز عبور',
			'xboardRegisterScreen.verificationCode' => 'کد تایید',
			'xboardRegisterScreen.invitationCode' => 'کد دعوت',
			'xboardRegisterScreen.emailSentNotice' => 'کد تایید برای ایمیل شما ارسال شد',
			'xboardRegisterScreen.registerSuccess' => 'ثبت نام با موفقیت انجام شد',
			'xboardRegisterScreen.invalidEmail' => 'لطفا یک آدرس ایمیل معتبر وارد کنید',
			'xboardRegisterScreen.passwordRequired' => 'لطفا رمز عبور را وارد کنید',
			'xboardRegisterScreen.passwordMinLength' => ({required Object minLength}) => 'طول رمز عبور باید حداقل ${minLength} کاراکتر باشد',
			'xboardRegisterScreen.confirmPasswordRequired' => 'لطفا رمز عبور را دوباره وارد کنید',
			'xboardRegisterScreen.passwordMismatch' => 'رمزهای عبور مطابقت ندارند',
			'xboardRegisterScreen.emailCodeRequired' => 'لطفا کد تایید ایمیل را وارد کنید',
			'xboardRegisterScreen.emailCodeLength' => ({required Object codeLength}) => 'کد تایید ایمیل باید ${codeLength} رقم باشد',
			'xboardRegisterScreen.verificationCodeRequired' => 'لطفا کد تایید را وارد کنید',
			'xboardRegisterScreen.verificationCodeLength' => 'خطا در طول کد تایید',
			'xboardRegisterScreen.userAgreement' => 'توافق‌نامه کاربر',
			'xboardRegisterScreen.pleaseCheck' => 'لطفاً تیک بزنید',
			'main.tray.menuOpen' => 'بازکردن',
			'main.tray.menuExit' => 'بستن',
			'meta.enable' => 'فعال‌سازی',
			'meta.disable' => 'غیرفعال',
			'meta.open' => 'باز کن',
			'meta.close' => 'بسته',
			'meta.quit' => 'خروج',
			'meta.add' => 'افزودن',
			'meta.byDefault' => 'پیش‌فرض',
			'meta.more' => 'بیشتر',
			'meta.tips' => 'اطلاعات',
			'meta.copy' => 'کپی',
			'meta.save' => 'ذخیره کنید',
			'meta.ok' => 'خُب',
			'meta.cancel' => 'لغو',
			'meta.faq' => 'سوالات متداول',
			'meta.download' => 'دانلود',
			'meta.loading' => 'درحال بارگذاری…',
			'meta.days' => 'روز',
			'meta.hours' => 'ساعت',
			'meta.minutes' => 'دقیقه',
			'meta.seconds' => 'دومین',
			'meta.protocol' => 'پروتکل',
			'meta.search' => 'جستجو',
			'meta.custom' => 'سفارشی',
			'meta.connect' => 'اتصال',
			'meta.disconnect' => 'قطع‌ اتصال',
			'meta.connected' => 'وصل شد',
			'meta.disconnected' => 'قطع شد',
			'meta.connecting' => 'درحال اتصال',
			'meta.connectTimeout' => 'اتمام مهلت اتصال',
			'meta.timeout' => 'تایم اوت',
			'meta.timeoutDuration' => 'مدت زمان وقفه',
			'meta.latency' => 'تاخیر',
			'meta.latencyTest' => 'بررسی تاخیر',
			'meta.language' => 'زبان',
			'meta.next' => 'بعدی',
			'meta.done' => 'انجام‌شد',
			'meta.apply' => 'درخواست دادن',
			'meta.refresh' => 'بارگذاری مجدد',
			'meta.retry' => 'دوباره امتحان کنید؟',
			'meta.update' => 'تجدید',
			'meta.none' => 'هیچ‌کدام',
			'meta.reset' => 'ریست',
			'meta.authentication' => 'مجوز',
			'meta.submit' => 'ارسال',
			'meta.user' => 'کاربر',
			'meta.account' => 'نام‌کاربری',
			'meta.password' => 'رمز‌عبور',
			'meta.required' => 'الزامی',
			'meta.sudoPassword' => 'رمز عبور sudo (برای حالت TUN لازم است)',
			'meta.other' => 'دیگر',
			'meta.dns' => 'DNS',
			'meta.url' => 'URL',
			'meta.urlInvalid' => 'URL نامعتبر',
			'meta.urlCannotEmpty' => 'لینک نمی‌تواند خالی باشد',
			'meta.launchAtStartup' => 'اجرا در راه‌اندازی',
			'meta.launchAtStartupRunAsAdmin' => 'لطفاً SkiVPN را به عنوان مدیر راه اندازی مجدد کنید',
			'meta.tunModeRunAsAdmin' => 'حالت TUN نیازمند مجوز مدیر سیستم می‌باشد لطفا نرم‌افزار را مجدد با حالت مدیر (administrator) راه‌اندازی کنید',
			'meta.requireAdminPrivilegeAtStartup' => 'برنامه را به عنوان مدیر راه اندازی مجدد کنید (حالت TUN نیازمند مجوز مدیر می‌باشد)',
			'meta.portableMode' => 'حالت قابل‌حمل',
			'meta.portableModeDisableTips' => 'اگر نیاز دارین از حالت قابل‌حمل خارج شوید لطفا از [skivpn] خارج شده و به‌صورت دستی پوشه [portable] هم مسیر با فایل [ski.exe] را حذف کنید',
			'meta.systemProxy' => 'پروکسی سیستم',
			'meta.autoConnectAfterLaunch' => 'اتصال خودکار پس‌از راه‌اندازی',
			'meta.autoConnectAtBoot' => 'اتصال خودکار پس از روشن شدن سیستم',
			'meta.autoConnectAtBootTips' => 'پشتیبانی سیستم مورد نیاز است؛ برخی سیستم‌ها ممکن است نیاز به فعال بودن [شروع خودکار] نیز داشته باشند.',
			'meta.hideAfterLaunch' => 'پنهان کردن پنجره پس از راه اندازی',
			'meta.autoSetSystemProxy' => 'تنظیم خودکار حالت پروکسی سیستم پس‌از اتصال',
			'meta.bypassSystemProxy' => 'نام های دامنه ای که مجاز به دور زدن پراکسی سیستم هستند',
			'meta.excludeFromRecent' => 'پنهان شدن از وظایف اخیر',
			'meta.hideDockIcon' => 'پنهان کردن آیکون داک',
			'meta.wakeLock' => 'قفل بیدارباش',
			'meta.hideVpn' => 'مخفی کردن آیکون VPN',
			'meta.hideVpnTips' => 'فعال کردن IPv6 باعث از کار افتادن این عملکرد خواهد شد.',
			'meta.website' => 'وبسایت',
			'meta.termOfUse' => 'شرایط استفاده',
			'meta.privacyPolicy' => 'سیاست حریم خصوصی',
			'meta.log' => 'ورود به سیستم',
			'meta.coreLog' => 'گزارش هسته',
			'meta.core' => 'هسته',
			'meta.help' => 'کمک کند',
			'meta.tutorial' => 'آموزش',
			'meta.board' => 'پانل',
			'meta.boardOnline' => 'با استفاده از پنل آنلاین',
			'meta.boardOnlineUrl' => 'آدرس پنل آنلاین',
			'meta.boardLocalPort' => 'پورت پانل محلی',
			'meta.disableFontScaler' => 'غیرفعال‌سازی مقیاس‌بندی فونت(با راه‌اندازی مجدد اعمال می‌شود)',
			'meta.autoOrientation' => 'چرخش صفحه را دنبال کنید',
			'meta.restartTakesEffect' => 'با راه‌اندازی مجدد اعمال می‌شود',
			'meta.reconnectTakesEffect' => 'پس از اتصال مجدد، اعمال خواهد شد.',
			'meta.runtimeProfile' => 'پیکربندی زمان اجرا',
			'meta.willCompleteAfterRebootInstall' => 'لطفاً دستگاه خود را مجدداً راه اندازی کنید تا نصب افزونه سیستم تکمیل شود.',
			'meta.willCompleteAfterRebootUninstall' => 'لطفاً دستگاه خود را مجدداً راه‌اندازی کنید تا حذف نصب افزونه سیستم تکمیل شود',
			'meta.requestNeedsUserApproval' => '۱. لطفاً به SkiVPN اجازه دهید افزونه‌های سیستمی را در [تنظیمات سیستم] - [حریم خصوصی و امنیت] نصب کند. ۲. : [تنظیمات سیستم] - [عمومی] - [موارد ورود و افزونه‌ها - افزونه‌های شبکه] [skiServiceSE] را فعال کنید. پس از اتمام، دوباره متصل شوید.',
			'meta.FullDiskAccessPermissionRequired' => 'لطفاً مجوز skiServiceSE را در [تنظیمات سیستم]-[حریم خصوصی و امنیت]-[دسترسی کامل به دیسک] فعال کنید و دوباره متصل شوید.',
			'meta.proxy' => 'بازیگری',
			'meta.theme' => 'موضوع',
			'meta.tvMode' => 'حالت تلویزیون',
			'meta.autoUpdate' => 'به روز رسانی خودکار',
			'meta.updateChannel' => 'کانال به‌روزرسانی خودکار',
			'meta.hasNewVersion' => ({required Object p}) => 'به‌روزرسانی نسخه ${p} ',
			'meta.autoDownloadPkg' => 'دانلود خودکار بسته‌های به‌روزرسانی',
			'meta.devOptions' => 'تنظیمات توسعه‌دهندگان',
			'meta.about' => 'درباره',
			'meta.name' => 'نام',
			'meta.logout' => 'خروج',
			'meta.version' => 'نسخه',
			'meta.notice' => 'اطلاعیه',
			'meta.sort' => 'مرتب‌سازی',
			'meta.recommended' => 'پیشنهادی',
			'meta.innerError' => ({required Object p}) => 'خطای داخلی: ${p}',
			'meta.server' => 'سرور',
			'meta.setting' => 'تنظیمات',
			'meta.settingCore' => 'تنظیمات اصلی',
			'meta.settingApp' => 'تنظیمات برنامه',
			'meta.deviceNoSpace' => 'فضای خالی کافی ندارید',
			'meta.hideSystemApp' => 'برنامه های سیستم را مخفی کنید',
			'meta.hideAppIcon' => 'پنهان کردن نماد برنامه',
			'meta.openDir' => 'بازکردن دایرکتوری فایل',
			'meta.uwpExemption' => 'معافیت جداسازی شبکه UWP',
			'permission.appQuery' => 'Get Application List',
			'permission.request' => ({required Object p}) => 'مجوزهای [${p}] را فعال کنید',
			'permission.requestNeed' => ({required Object p}) => 'لطفاً مجوز [${p}] را فعال کنید',
			'tun.stack' => 'پشته شبکه',
			'tun.inet4Address' => 'محدوده آدرس IPv4',
			'tun.inet6Address' => 'محدوده آدرس IPv6',
			'tun.dnsHijack' => 'ربودن DNS',
			'tun.strictRoute' => 'مسیریابی دقیق',
			'tun.icmpForward' => 'ارسال ICMP',
			'tun.allowBypass' => 'به برنامه‌ها اجازه دهید VPN را دور بزنند',
			'tun.appendHttpProxy' => 'پیوست دادن پروکسی HTTP به وی‌پی‌ان',
			'tun.bypassHttpProxyDomain' => 'دامنه ها مجاز به دور زدن پروکسی HTTP هستند',
			'edgeRuntimeNotInstalled' => 'زمان اجرا Edge WebView2 روی دستگاه فعلی نصب نشده است و صفحه قابل نمایش نیست لطفاً زمان اجرا Edge WebView2 (x64) را بارگیری و نصب کنید، برنامه را مجدداً راه اندازی کنید و دوباره امتحان کنید.',
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
