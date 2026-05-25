///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final TranslationsLaunchFailedScreenEn LaunchFailedScreen = TranslationsLaunchFailedScreenEn._(_root);
	late final TranslationsPerAppAndroidScreenEn PerAppAndroidScreen = TranslationsPerAppAndroidScreenEn._(_root);
	late final TranslationsUserAgreementScreenEn UserAgreementScreen = TranslationsUserAgreementScreenEn._(_root);
	late final TranslationsVersionUpdateScreenEn VersionUpdateScreen = TranslationsVersionUpdateScreenEn._(_root);
	late final TranslationsHomeScreenEn homeScreen = TranslationsHomeScreenEn._(_root);
	late final TranslationsLoginScreenEn loginScreen = TranslationsLoginScreenEn._(_root);
	late final TranslationsPlanWidgetEn planWidget = TranslationsPlanWidgetEn._(_root);
	late final TranslationsXboardRegisterScreenEn xboardRegisterScreen = TranslationsXboardRegisterScreenEn._(_root);
	late final TranslationsMainEn main = TranslationsMainEn._(_root);
	late final TranslationsMetaEn meta = TranslationsMetaEn._(_root);
	late final TranslationsPermissionEn permission = TranslationsPermissionEn._(_root);
	late final TranslationsTunEn tun = TranslationsTunEn._(_root);

	/// en: 'The current device has not installed the Edge WebView2 runtime, so the page cannot be displayed. Please download and install the Edge WebView2 runtime (x64), restart the App and try again.'
	String get edgeRuntimeNotInstalled => 'The current device has not installed the Edge WebView2 runtime, so the page cannot be displayed. Please download and install the Edge WebView2 runtime (x64), restart the App and try again.';

	Map<String, String> get locales => {
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
class TranslationsLaunchFailedScreenEn {
	TranslationsLaunchFailedScreenEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'The app failed to start [Invalid process name], please reinstall the app to a separate directory'
	String get invalidProcess => 'The app failed to start [Invalid process name], please reinstall the app to a separate directory';

	/// en: 'The app failed to start [Failed to access the profile], please reinstall the app'
	String get invalidProfile => 'The app failed to start [Failed to access the profile], please reinstall the app';

	/// en: 'The app failed to start [Invalid version], please reinstall the app'
	String get invalidVersion => 'The app failed to start [Invalid version], please reinstall the app';

	/// en: 'The app failed to start [system version too low]'
	String get systemVersionLow => 'The app failed to start [system version too low]';

	/// en: 'The installation path is invalid, please reinstall it to a valid path'
	String get invalidInstallPath => 'The installation path is invalid, please reinstall it to a valid path';
}

// Path: PerAppAndroidScreen
class TranslationsPerAppAndroidScreenEn {
	TranslationsPerAppAndroidScreenEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Per-App Proxy'
	String get title => 'Per-App Proxy';

	/// en: 'Whitelist Mode'
	String get whiteListMode => 'Whitelist Mode';

	/// en: 'When enabled: only the apps that have been checked are proxies; when not enabled: only the apps that are not checked are proxies'
	String get whiteListModeTip => 'When enabled: only the apps that have been checked are proxies; when not enabled: only the apps that are not checked are proxies';
}

// Path: UserAgreementScreen
class TranslationsUserAgreementScreenEn {
	TranslationsUserAgreementScreenEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Your Privacy Comes First'
	String get privacyFirst => 'Your Privacy Comes First';

	/// en: 'Accept & Continue'
	String get agreeAndContinue => 'Accept & Continue';
}

// Path: VersionUpdateScreen
class TranslationsVersionUpdateScreenEn {
	TranslationsVersionUpdateScreenEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'The new version[$p] is ready'
	String versionReady({required Object p}) => 'The new version[${p}] is ready';

	/// en: 'Restart To Update'
	String get update => 'Restart To Update';

	/// en: 'Not Now'
	String get cancel => 'Not Now';
}

// Path: homeScreen
class TranslationsHomeScreenEn {
	TranslationsHomeScreenEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Traffic:'
	String get traffic => 'Traffic:';

	/// en: 'Speed:'
	String get speed => 'Speed:';

	/// en: 'Auto Select'
	String get autoSelect => 'Auto Select';

	/// en: 'Load Balance'
	String get loadBalance => 'Load Balance';

	/// en: 'Service Center'
	String get serviceCenter => 'Service Center';

	/// en: 'Online Support'
	String get onlineSupport => 'Online Support';

	/// en: 'Subscription Channel'
	String get subscriptionChannel => 'Subscription Channel';

	/// en: 'Buy Plan'
	String get buyPlan => 'Buy Plan';
}

// Path: loginScreen
class TranslationsLoginScreenEn {
	TranslationsLoginScreenEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Login'
	String get login => 'Login';

	/// en: 'Register Account'
	String get register => 'Register Account';

	/// en: 'Forgot Password'
	String get forgotPassword => 'Forgot Password';

	/// en: 'Provider'
	String get provider => 'Provider';

	/// en: 'Provider Passcode'
	String get providerName => '${_root.loginScreen.provider} Passcode';

	/// en: 'Please enter the Provider passcode'
	String get providerNameRequired => 'Please enter the ${_root.loginScreen.provider} passcode';

	/// en: 'Account'
	String get account => 'Account';

	/// en: 'Please enter account'
	String get accountRequired => 'Please enter account';

	/// en: 'Email'
	String get email => 'Email';

	/// en: 'Please enter email address'
	String get emailRequired => 'Please enter email address';

	/// en: 'Password'
	String get password => 'Password';

	/// en: 'Please enter password'
	String get passwordRequired => 'Please enter password';

	/// en: 'Please enter valid email address'
	String get validEmailRequired => 'Please enter valid email address';

	/// en: 'Password length at least $minLength characters'
	String passwordMinLength({required Object minLength}) => 'Password length at least ${minLength} characters';

	/// en: 'Unsupported Provider'
	String get unsupportedProvider => 'Unsupported ${_root.loginScreen.provider}';

	/// en: 'Unsupported Provider type'
	String get unsupportedProviderType => 'Unsupported ${_root.loginScreen.provider} type';
}

// Path: planWidget
class TranslationsPlanWidgetEn {
	TranslationsPlanWidgetEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Used'
	String get used => 'Used';

	/// en: 'Total Traffic'
	String get totalTraffic => 'Total Traffic';

	/// en: 'Expiration Time'
	String get expirationTime => 'Expiration Time';

	/// en: 'Remaining Time'
	String get remainingTime => 'Remaining Time';
}

// Path: xboardRegisterScreen
class TranslationsXboardRegisterScreenEn {
	TranslationsXboardRegisterScreenEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Register'
	String get register => 'Register';

	/// en: 'Email'
	String get email => 'Email';

	/// en: 'Email Verification Code'
	String get emailVerificationCode => 'Email Verification Code';

	/// en: 'Send'
	String get send => 'Send';

	/// en: 'Password'
	String get password => 'Password';

	/// en: 'Confirm Password'
	String get confirmPassword => 'Confirm Password';

	/// en: 'Verification Code'
	String get verificationCode => 'Verification Code';

	/// en: 'Invitation Code'
	String get invitationCode => 'Invitation Code';

	/// en: 'Verification code sent to your email'
	String get emailSentNotice => 'Verification code sent to your email';

	/// en: 'Registration successful'
	String get registerSuccess => 'Registration successful';

	/// en: 'Please enter valid email address'
	String get invalidEmail => 'Please enter valid email address';

	/// en: 'Please enter password'
	String get passwordRequired => 'Please enter password';

	/// en: 'Password length at least $minLength characters'
	String passwordMinLength({required Object minLength}) => 'Password length at least ${minLength} characters';

	/// en: 'Please enter password again'
	String get confirmPasswordRequired => 'Please enter password again';

	/// en: 'Passwords don't match'
	String get passwordMismatch => 'Passwords don\'t match';

	/// en: 'Please enter email verification code'
	String get emailCodeRequired => 'Please enter email verification code';

	/// en: 'Email verification code should be $codeLength digits'
	String emailCodeLength({required Object codeLength}) => 'Email verification code should be ${codeLength} digits';

	/// en: 'Please enter verification code'
	String get verificationCodeRequired => 'Please enter verification code';

	/// en: 'Verification code length error'
	String get verificationCodeLength => 'Verification code length error';

	/// en: 'User Agreement'
	String get userAgreement => 'User Agreement';

	/// en: 'Please check'
	String get pleaseCheck => 'Please check';
}

// Path: main
class TranslationsMainEn {
	TranslationsMainEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsMainTrayEn tray = TranslationsMainTrayEn._(_root);
}

// Path: meta
class TranslationsMetaEn {
	TranslationsMetaEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Enable'
	String get enable => 'Enable';

	/// en: 'Disable'
	String get disable => 'Disable';

	/// en: 'Open'
	String get open => 'Open';

	/// en: 'Close'
	String get close => 'Close';

	/// en: 'Quit'
	String get quit => 'Quit';

	/// en: 'Add'
	String get add => 'Add';

	/// en: 'Default'
	String get byDefault => 'Default';

	/// en: 'More'
	String get more => 'More';

	/// en: 'Info'
	String get tips => 'Info';

	/// en: 'Copy'
	String get copy => 'Copy';

	/// en: 'Save'
	String get save => 'Save';

	/// en: 'Ok'
	String get ok => 'Ok';

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'FAQ'
	String get faq => 'FAQ';

	/// en: 'Download'
	String get download => 'Download';

	/// en: 'Loading...'
	String get loading => 'Loading...';

	/// en: 'Days'
	String get days => 'Days';

	/// en: 'Hours'
	String get hours => 'Hours';

	/// en: 'Minutes'
	String get minutes => 'Minutes';

	/// en: 'Seconds'
	String get seconds => 'Seconds';

	/// en: 'Protocol'
	String get protocol => 'Protocol';

	/// en: 'Search'
	String get search => 'Search';

	/// en: 'Custom'
	String get custom => 'Custom';

	/// en: 'Connect'
	String get connect => 'Connect';

	/// en: 'Disconnect'
	String get disconnect => 'Disconnect';

	/// en: 'Connected'
	String get connected => 'Connected';

	/// en: 'Disconnected'
	String get disconnected => 'Disconnected';

	/// en: 'Connecting'
	String get connecting => 'Connecting';

	/// en: 'Connect Timeout'
	String get connectTimeout => 'Connect Timeout';

	/// en: 'Timeout'
	String get timeout => 'Timeout';

	/// en: 'Timeout Duration'
	String get timeoutDuration => 'Timeout Duration';

	/// en: 'Latency'
	String get latency => 'Latency';

	/// en: 'Latency Checks'
	String get latencyTest => 'Latency Checks';

	/// en: 'Language'
	String get language => 'Language';

	/// en: 'Next'
	String get next => 'Next';

	/// en: 'Done'
	String get done => 'Done';

	/// en: 'Apply'
	String get apply => 'Apply';

	/// en: 'Refresh'
	String get refresh => 'Refresh';

	/// en: 'Retry?'
	String get retry => 'Retry?';

	/// en: 'Update'
	String get update => 'Update';

	/// en: 'None'
	String get none => 'None';

	/// en: 'Reset'
	String get reset => 'Reset';

	/// en: 'Authentication'
	String get authentication => 'Authentication';

	/// en: 'Submit'
	String get submit => 'Submit';

	/// en: 'User'
	String get user => 'User';

	/// en: 'Account'
	String get account => 'Account';

	/// en: 'Password'
	String get password => 'Password';

	/// en: 'Required'
	String get required => 'Required';

	/// en: 'sudo password (required for TUN mode)'
	String get sudoPassword => 'sudo password (required for TUN mode)';

	/// en: 'Other'
	String get other => 'Other';

	/// en: 'DNS'
	String get dns => 'DNS';

	/// en: 'URL'
	String get url => 'URL';

	/// en: 'Invalid URL'
	String get urlInvalid => 'Invalid URL';

	/// en: 'Link can not be empty'
	String get urlCannotEmpty => 'Link can not be empty';

	/// en: 'Launch at Startup'
	String get launchAtStartup => 'Launch at Startup';

	/// en: 'Please restart SkiVPN as administrator'
	String get launchAtStartupRunAsAdmin => 'Please restart SkiVPN as administrator';

	/// en: 'The TUN mode requires system administrator permissions, please restart the app as an administrator'
	String get tunModeRunAsAdmin => 'The TUN mode requires system administrator permissions, please restart the app as an administrator';

	/// en: 'Please restart the app as administrator (Administrator privileges required for TUN mode)'
	String get requireAdminPrivilegeAtStartup => 'Please restart the app as administrator (Administrator privileges required for TUN mode)';

	/// en: 'Portable Mode'
	String get portableMode => 'Portable Mode';

	/// en: 'If you need to exit portable mode, please exit [skivpn] and manually delete the [portable] folder in the same directory as [ski.exe]'
	String get portableModeDisableTips => 'If you need to exit portable mode, please exit [skivpn] and manually delete the [portable] folder in the same directory as [ski.exe]';

	/// en: 'System Proxy'
	String get systemProxy => 'System Proxy';

	/// en: 'Auto Connection after Launch'
	String get autoConnectAfterLaunch => 'Auto Connection after Launch';

	/// en: 'Auto Connection after System Startup'
	String get autoConnectAtBoot => 'Auto Connection after System Startup';

	/// en: 'System support is required; some systems may also require [auto-start] to be enabled.'
	String get autoConnectAtBootTips => 'System support is required; some systems may also require [auto-start] to be enabled.';

	/// en: 'Hide window after startup'
	String get hideAfterLaunch => 'Hide window after startup';

	/// en: 'Auto Set System Proxy when Connected'
	String get autoSetSystemProxy => 'Auto Set System Proxy when Connected';

	/// en: 'Domain names that are allowed to bypass the system proxy'
	String get bypassSystemProxy => 'Domain names that are allowed to bypass the system proxy';

	/// en: 'Hide from [Recent Tasks]'
	String get excludeFromRecent => 'Hide from [Recent Tasks]';

	/// en: 'Wake Lock'
	String get wakeLock => 'Wake Lock';

	/// en: 'Hide VPN Icon'
	String get hideVpn => 'Hide VPN Icon';

	/// en: 'Enabling IPv6 will cause this function to fail'
	String get hideVpnTips => 'Enabling IPv6 will cause this function to fail';

	/// en: 'Hide Dock Icon'
	String get hideDockIcon => 'Hide Dock Icon';

	/// en: 'Website'
	String get website => 'Website';

	/// en: 'Terms of Service'
	String get termOfUse => 'Terms of Service';

	/// en: 'Privacy & Policy'
	String get privacyPolicy => 'Privacy & Policy';

	/// en: 'Log'
	String get log => 'Log';

	/// en: 'Core Log'
	String get coreLog => 'Core Log';

	/// en: 'Core'
	String get core => 'Core';

	/// en: 'Help'
	String get help => 'Help';

	/// en: 'Tutorial'
	String get tutorial => 'Tutorial';

	/// en: 'Board'
	String get board => 'Board';

	/// en: 'Use Online Board'
	String get boardOnline => 'Use Online Board';

	/// en: 'Online Board URL'
	String get boardOnlineUrl => 'Online Board URL';

	/// en: 'Local Board Port'
	String get boardLocalPort => 'Local Board Port';

	/// en: 'Disable Font scaling(Restart takes effect)'
	String get disableFontScaler => 'Disable Font scaling(Restart takes effect)';

	/// en: 'Rotate with the screen'
	String get autoOrientation => 'Rotate with the screen';

	/// en: 'Restart takes effect'
	String get restartTakesEffect => 'Restart takes effect';

	/// en: 'Reconnect takes effect'
	String get reconnectTakesEffect => 'Reconnect takes effect';

	/// en: 'Runtime Profile'
	String get runtimeProfile => 'Runtime Profile';

	/// en: 'Please restart your device to complete the system extension installation'
	String get willCompleteAfterRebootInstall => 'Please restart your device to complete the system extension installation';

	/// en: 'Please restart your device to complete the the system extension uninstallation'
	String get willCompleteAfterRebootUninstall => 'Please restart your device to complete the the system extension uninstallation';

	/// en: '1. Please [Allow] SkiVPN to install system extensions in [System Settings]-[Privacy and Security] 2. [System Settings]-[General]-[Login Items Extensions]-[Network Extension] enable [skiServiceSE] reconnect after completion'
	String get requestNeedsUserApproval => '1. Please [Allow] SkiVPN to install system extensions in [System Settings]-[Privacy and Security]\n2. [System Settings]-[General]-[Login Items Extensions]-[Network Extension] enable [skiServiceSE]\nreconnect after completion';

	/// en: 'Please enable skiServiceSE permission in [System Settings]-[Privacy and Security]-[Full Disk Access] and reconnect.'
	String get FullDiskAccessPermissionRequired => 'Please enable skiServiceSE permission in [System Settings]-[Privacy and Security]-[Full Disk Access] and reconnect.';

	/// en: 'Proxy'
	String get proxy => 'Proxy';

	/// en: 'Theme'
	String get theme => 'Theme';

	/// en: 'TV Mode'
	String get tvMode => 'TV Mode';

	/// en: 'Auto Update'
	String get autoUpdate => 'Auto Update';

	/// en: 'Auto Update Channel'
	String get updateChannel => 'Auto Update Channel';

	/// en: 'Update Version $p'
	String hasNewVersion({required Object p}) => 'Update Version ${p}';

	/// en: 'Auto Download Update Packages'
	String get autoDownloadPkg => 'Auto Download Update Packages';

	/// en: 'Developer Options'
	String get devOptions => 'Developer Options';

	/// en: 'About'
	String get about => 'About';

	/// en: 'Name'
	String get name => 'Name';

	/// en: 'Logout'
	String get logout => 'Logout';

	/// en: 'Version'
	String get version => 'Version';

	/// en: 'Notice'
	String get notice => 'Notice';

	/// en: 'Reorder'
	String get sort => 'Reorder';

	/// en: 'Recommend'
	String get recommended => 'Recommend';

	/// en: 'Inner Error:$p'
	String innerError({required Object p}) => 'Inner Error:${p}';

	/// en: 'Server'
	String get server => 'Server';

	/// en: 'Settings'
	String get setting => 'Settings';

	/// en: 'Core Settings'
	String get settingCore => 'Core Settings';

	/// en: 'App Settings'
	String get settingApp => 'App Settings';

	/// en: 'Not enough disk space'
	String get deviceNoSpace => 'Not enough disk space';

	/// en: 'Hide System Apps'
	String get hideSystemApp => 'Hide System Apps';

	/// en: 'Hide App Icons'
	String get hideAppIcon => 'Hide App Icons';

	/// en: 'Open File Directory'
	String get openDir => 'Open File Directory';

	/// en: 'UWP Network Isolation Exemptions'
	String get uwpExemption => 'UWP Network Isolation Exemptions';
}

// Path: permission
class TranslationsPermissionEn {
	TranslationsPermissionEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Get Application List'
	String get appQuery => 'Get Application List';

	/// en: 'Turn on [$p] permission'
	String request({required Object p}) => 'Turn on [${p}] permission';

	/// en: 'Please Turn on [$p] permission'
	String requestNeed({required Object p}) => 'Please Turn on [${p}] permission';
}

// Path: tun
class TranslationsTunEn {
	TranslationsTunEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Network stack'
	String get stack => 'Network stack';

	/// en: 'IPv4 Gateway Address'
	String get inet4Address => 'IPv4 Gateway Address';

	/// en: 'IPv6 Gateway Address'
	String get inet6Address => 'IPv6 Gateway Address';

	/// en: 'DNS Hijack'
	String get dnsHijack => 'DNS Hijack';

	/// en: 'Strict Route'
	String get strictRoute => 'Strict Route';

	/// en: 'ICMP Forwarding'
	String get icmpForward => 'ICMP Forwarding';

	/// en: 'Allow Apps to Bypass VPN'
	String get allowBypass => 'Allow Apps to Bypass VPN';

	/// en: 'Append HTTP Proxy to VPN'
	String get appendHttpProxy => 'Append HTTP Proxy to VPN';

	/// en: 'Domains allowed to bypass HTTP proxy'
	String get bypassHttpProxyDomain => 'Domains allowed to bypass HTTP proxy';
}

// Path: main.tray
class TranslationsMainTrayEn {
	TranslationsMainTrayEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Open'
	String get menuOpen => 'Open';

	/// en: 'Exit'
	String get menuExit => 'Exit';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'LaunchFailedScreen.invalidProcess' => 'The app failed to start [Invalid process name], please reinstall the app to a separate directory',
			'LaunchFailedScreen.invalidProfile' => 'The app failed to start [Failed to access the profile], please reinstall the app',
			'LaunchFailedScreen.invalidVersion' => 'The app failed to start [Invalid version], please reinstall the app',
			'LaunchFailedScreen.systemVersionLow' => 'The app failed to start [system version too low]',
			'LaunchFailedScreen.invalidInstallPath' => 'The installation path is invalid, please reinstall it to a valid path',
			'PerAppAndroidScreen.title' => 'Per-App Proxy',
			'PerAppAndroidScreen.whiteListMode' => 'Whitelist Mode',
			'PerAppAndroidScreen.whiteListModeTip' => 'When enabled: only the apps that have been checked are proxies; when not enabled: only the apps that are not checked are proxies',
			'UserAgreementScreen.privacyFirst' => 'Your Privacy Comes First',
			'UserAgreementScreen.agreeAndContinue' => 'Accept & Continue',
			'VersionUpdateScreen.versionReady' => ({required Object p}) => 'The new version[${p}] is ready',
			'VersionUpdateScreen.update' => 'Restart To Update',
			'VersionUpdateScreen.cancel' => 'Not Now',
			'homeScreen.traffic' => 'Traffic:',
			'homeScreen.speed' => 'Speed:',
			'homeScreen.autoSelect' => 'Auto Select',
			'homeScreen.loadBalance' => 'Load Balance',
			'homeScreen.serviceCenter' => 'Service Center',
			'homeScreen.onlineSupport' => 'Online Support',
			'homeScreen.subscriptionChannel' => 'Subscription Channel',
			'homeScreen.buyPlan' => 'Buy Plan',
			'loginScreen.login' => 'Login',
			'loginScreen.register' => 'Register Account',
			'loginScreen.forgotPassword' => 'Forgot Password',
			'loginScreen.provider' => 'Provider',
			'loginScreen.providerName' => '${_root.loginScreen.provider} Passcode',
			'loginScreen.providerNameRequired' => 'Please enter the ${_root.loginScreen.provider} passcode',
			'loginScreen.account' => 'Account',
			'loginScreen.accountRequired' => 'Please enter account',
			'loginScreen.email' => 'Email',
			'loginScreen.emailRequired' => 'Please enter email address',
			'loginScreen.password' => 'Password',
			'loginScreen.passwordRequired' => 'Please enter password',
			'loginScreen.validEmailRequired' => 'Please enter valid email address',
			'loginScreen.passwordMinLength' => ({required Object minLength}) => 'Password length at least ${minLength} characters',
			'loginScreen.unsupportedProvider' => 'Unsupported ${_root.loginScreen.provider}',
			'loginScreen.unsupportedProviderType' => 'Unsupported ${_root.loginScreen.provider} type',
			'planWidget.used' => 'Used',
			'planWidget.totalTraffic' => 'Total Traffic',
			'planWidget.expirationTime' => 'Expiration Time',
			'planWidget.remainingTime' => 'Remaining Time',
			'xboardRegisterScreen.register' => 'Register',
			'xboardRegisterScreen.email' => 'Email',
			'xboardRegisterScreen.emailVerificationCode' => 'Email Verification Code',
			'xboardRegisterScreen.send' => 'Send',
			'xboardRegisterScreen.password' => 'Password',
			'xboardRegisterScreen.confirmPassword' => 'Confirm Password',
			'xboardRegisterScreen.verificationCode' => 'Verification Code',
			'xboardRegisterScreen.invitationCode' => 'Invitation Code',
			'xboardRegisterScreen.emailSentNotice' => 'Verification code sent to your email',
			'xboardRegisterScreen.registerSuccess' => 'Registration successful',
			'xboardRegisterScreen.invalidEmail' => 'Please enter valid email address',
			'xboardRegisterScreen.passwordRequired' => 'Please enter password',
			'xboardRegisterScreen.passwordMinLength' => ({required Object minLength}) => 'Password length at least ${minLength} characters',
			'xboardRegisterScreen.confirmPasswordRequired' => 'Please enter password again',
			'xboardRegisterScreen.passwordMismatch' => 'Passwords don\'t match',
			'xboardRegisterScreen.emailCodeRequired' => 'Please enter email verification code',
			'xboardRegisterScreen.emailCodeLength' => ({required Object codeLength}) => 'Email verification code should be ${codeLength} digits',
			'xboardRegisterScreen.verificationCodeRequired' => 'Please enter verification code',
			'xboardRegisterScreen.verificationCodeLength' => 'Verification code length error',
			'xboardRegisterScreen.userAgreement' => 'User Agreement',
			'xboardRegisterScreen.pleaseCheck' => 'Please check',
			'main.tray.menuOpen' => 'Open',
			'main.tray.menuExit' => 'Exit',
			'meta.enable' => 'Enable',
			'meta.disable' => 'Disable',
			'meta.open' => 'Open',
			'meta.close' => 'Close',
			'meta.quit' => 'Quit',
			'meta.add' => 'Add',
			'meta.byDefault' => 'Default',
			'meta.more' => 'More',
			'meta.tips' => 'Info',
			'meta.copy' => 'Copy',
			'meta.save' => 'Save',
			'meta.ok' => 'Ok',
			'meta.cancel' => 'Cancel',
			'meta.faq' => 'FAQ',
			'meta.download' => 'Download',
			'meta.loading' => 'Loading...',
			'meta.days' => 'Days',
			'meta.hours' => 'Hours',
			'meta.minutes' => 'Minutes',
			'meta.seconds' => 'Seconds',
			'meta.protocol' => 'Protocol',
			'meta.search' => 'Search',
			'meta.custom' => 'Custom',
			'meta.connect' => 'Connect',
			'meta.disconnect' => 'Disconnect',
			'meta.connected' => 'Connected',
			'meta.disconnected' => 'Disconnected',
			'meta.connecting' => 'Connecting',
			'meta.connectTimeout' => 'Connect Timeout',
			'meta.timeout' => 'Timeout',
			'meta.timeoutDuration' => 'Timeout Duration',
			'meta.latency' => 'Latency',
			'meta.latencyTest' => 'Latency Checks',
			'meta.language' => 'Language',
			'meta.next' => 'Next',
			'meta.done' => 'Done',
			'meta.apply' => 'Apply',
			'meta.refresh' => 'Refresh',
			'meta.retry' => 'Retry?',
			'meta.update' => 'Update',
			'meta.none' => 'None',
			'meta.reset' => 'Reset',
			'meta.authentication' => 'Authentication',
			'meta.submit' => 'Submit',
			'meta.user' => 'User',
			'meta.account' => 'Account',
			'meta.password' => 'Password',
			'meta.required' => 'Required',
			'meta.sudoPassword' => 'sudo password (required for TUN mode)',
			'meta.other' => 'Other',
			'meta.dns' => 'DNS',
			'meta.url' => 'URL',
			'meta.urlInvalid' => 'Invalid URL',
			'meta.urlCannotEmpty' => 'Link can not be empty',
			'meta.launchAtStartup' => 'Launch at Startup',
			'meta.launchAtStartupRunAsAdmin' => 'Please restart SkiVPN as administrator',
			'meta.tunModeRunAsAdmin' => 'The TUN mode requires system administrator permissions, please restart the app as an administrator',
			'meta.requireAdminPrivilegeAtStartup' => 'Please restart the app as administrator (Administrator privileges required for TUN mode)',
			'meta.portableMode' => 'Portable Mode',
			'meta.portableModeDisableTips' => 'If you need to exit portable mode, please exit [skivpn] and manually delete the [portable] folder in the same directory as [ski.exe]',
			'meta.systemProxy' => 'System Proxy',
			'meta.autoConnectAfterLaunch' => 'Auto Connection after Launch',
			'meta.autoConnectAtBoot' => 'Auto Connection after System Startup',
			'meta.autoConnectAtBootTips' => 'System support is required; some systems may also require [auto-start] to be enabled.',
			'meta.hideAfterLaunch' => 'Hide window after startup',
			'meta.autoSetSystemProxy' => 'Auto Set System Proxy when Connected',
			'meta.bypassSystemProxy' => 'Domain names that are allowed to bypass the system proxy',
			'meta.excludeFromRecent' => 'Hide from [Recent Tasks]',
			'meta.wakeLock' => 'Wake Lock',
			'meta.hideVpn' => 'Hide VPN Icon',
			'meta.hideVpnTips' => 'Enabling IPv6 will cause this function to fail',
			'meta.hideDockIcon' => 'Hide Dock Icon',
			'meta.website' => 'Website',
			'meta.termOfUse' => 'Terms of Service',
			'meta.privacyPolicy' => 'Privacy & Policy',
			'meta.log' => 'Log',
			'meta.coreLog' => 'Core Log',
			'meta.core' => 'Core',
			'meta.help' => 'Help',
			'meta.tutorial' => 'Tutorial',
			'meta.board' => 'Board',
			'meta.boardOnline' => 'Use Online Board',
			'meta.boardOnlineUrl' => 'Online Board URL',
			'meta.boardLocalPort' => 'Local Board Port',
			'meta.disableFontScaler' => 'Disable Font scaling(Restart takes effect)',
			'meta.autoOrientation' => 'Rotate with the screen',
			'meta.restartTakesEffect' => 'Restart takes effect',
			'meta.reconnectTakesEffect' => 'Reconnect takes effect',
			'meta.runtimeProfile' => 'Runtime Profile',
			'meta.willCompleteAfterRebootInstall' => 'Please restart your device to complete the system extension installation',
			'meta.willCompleteAfterRebootUninstall' => 'Please restart your device to complete the the system extension uninstallation',
			'meta.requestNeedsUserApproval' => '1. Please [Allow] SkiVPN to install system extensions in [System Settings]-[Privacy and Security]\n2. [System Settings]-[General]-[Login Items Extensions]-[Network Extension] enable [skiServiceSE]\nreconnect after completion',
			'meta.FullDiskAccessPermissionRequired' => 'Please enable skiServiceSE permission in [System Settings]-[Privacy and Security]-[Full Disk Access] and reconnect.',
			'meta.proxy' => 'Proxy',
			'meta.theme' => 'Theme',
			'meta.tvMode' => 'TV Mode',
			'meta.autoUpdate' => 'Auto Update',
			'meta.updateChannel' => 'Auto Update Channel',
			'meta.hasNewVersion' => ({required Object p}) => 'Update Version ${p}',
			'meta.autoDownloadPkg' => 'Auto Download Update Packages',
			'meta.devOptions' => 'Developer Options',
			'meta.about' => 'About',
			'meta.name' => 'Name',
			'meta.logout' => 'Logout',
			'meta.version' => 'Version',
			'meta.notice' => 'Notice',
			'meta.sort' => 'Reorder',
			'meta.recommended' => 'Recommend',
			'meta.innerError' => ({required Object p}) => 'Inner Error:${p}',
			'meta.server' => 'Server',
			'meta.setting' => 'Settings',
			'meta.settingCore' => 'Core Settings',
			'meta.settingApp' => 'App Settings',
			'meta.deviceNoSpace' => 'Not enough disk space',
			'meta.hideSystemApp' => 'Hide System Apps',
			'meta.hideAppIcon' => 'Hide App Icons',
			'meta.openDir' => 'Open File Directory',
			'meta.uwpExemption' => 'UWP Network Isolation Exemptions',
			'permission.appQuery' => 'Get Application List',
			'permission.request' => ({required Object p}) => 'Turn on [${p}] permission',
			'permission.requestNeed' => ({required Object p}) => 'Please Turn on [${p}] permission',
			'tun.stack' => 'Network stack',
			'tun.inet4Address' => 'IPv4 Gateway Address',
			'tun.inet6Address' => 'IPv6 Gateway Address',
			'tun.dnsHijack' => 'DNS Hijack',
			'tun.strictRoute' => 'Strict Route',
			'tun.icmpForward' => 'ICMP Forwarding',
			'tun.allowBypass' => 'Allow Apps to Bypass VPN',
			'tun.appendHttpProxy' => 'Append HTTP Proxy to VPN',
			'tun.bypassHttpProxyDomain' => 'Domains allowed to bypass HTTP proxy',
			'edgeRuntimeNotInstalled' => 'The current device has not installed the Edge WebView2 runtime, so the page cannot be displayed. Please download and install the Edge WebView2 runtime (x64), restart the App and try again.',
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
