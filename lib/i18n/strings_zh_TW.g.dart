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
class TranslationsZhTw with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsZhTw({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.zhTw,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <zh-TW>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsZhTw _root = this; // ignore: unused_field

	@override 
	TranslationsZhTw $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsZhTw(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsLaunchFailedScreenZhTw LaunchFailedScreen = _TranslationsLaunchFailedScreenZhTw._(_root);
	@override late final _TranslationsPerAppAndroidScreenZhTw PerAppAndroidScreen = _TranslationsPerAppAndroidScreenZhTw._(_root);
	@override late final _TranslationsUserAgreementScreenZhTw UserAgreementScreen = _TranslationsUserAgreementScreenZhTw._(_root);
	@override late final _TranslationsVersionUpdateScreenZhTw VersionUpdateScreen = _TranslationsVersionUpdateScreenZhTw._(_root);
	@override late final _TranslationsMainZhTw main = _TranslationsMainZhTw._(_root);
	@override late final _TranslationsMetaZhTw meta = _TranslationsMetaZhTw._(_root);
	@override late final _TranslationsPermissionZhTw permission = _TranslationsPermissionZhTw._(_root);
	@override late final _TranslationsTunZhTw tun = _TranslationsTunZhTw._(_root);
	@override String get edgeRuntimeNotInstalled => '當前設備尚未安裝Edge WebView2運行時,無法展示頁面,請下載安裝Edge WebView2運行時(x64)後,重啟App再試';
	@override late final _TranslationsHomeScreenZhTw homeScreen = _TranslationsHomeScreenZhTw._(_root);
	@override late final _TranslationsLoginScreenZhTw loginScreen = _TranslationsLoginScreenZhTw._(_root);
	@override late final _TranslationsPlanWidgetZhTw planWidget = _TranslationsPlanWidgetZhTw._(_root);
	@override late final _TranslationsXboardRegisterScreenZhTw xboardRegisterScreen = _TranslationsXboardRegisterScreenZhTw._(_root);
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
class _TranslationsLaunchFailedScreenZhTw implements TranslationsLaunchFailedScreenEn {
	_TranslationsLaunchFailedScreenZhTw._(this._root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get invalidProcess => '應用啟動失敗[無效的進程名稱],請重新安裝應用到獨立目錄';
	@override String get invalidProfile => '應用啟動失敗[訪問設定檔失敗],請重新安裝應用';
	@override String get invalidVersion => '應用啟動失敗[無效版本],請重新安裝應用';
	@override String get systemVersionLow => '應用啟動失敗[系統版本過低]';
	@override String get invalidInstallPath => '無效的安裝路徑,請重新安裝到有效路徑';
}

// Path: PerAppAndroidScreen
class _TranslationsPerAppAndroidScreenZhTw implements TranslationsPerAppAndroidScreenEn {
	_TranslationsPerAppAndroidScreenZhTw._(this._root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => '分應用代理';
	@override String get whiteListMode => '白名單模式';
	@override String get whiteListModeTip => '啟用後:僅代理已勾選的App;未啟用:僅代理未勾選的App';
}

// Path: UserAgreementScreen
class _TranslationsUserAgreementScreenZhTw implements TranslationsUserAgreementScreenEn {
	_TranslationsUserAgreementScreenZhTw._(this._root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get privacyFirst => '您的隱私很重要';
	@override String get agreeAndContinue => '接受並繼續';
}

// Path: VersionUpdateScreen
class _TranslationsVersionUpdateScreenZhTw implements TranslationsVersionUpdateScreenEn {
	_TranslationsVersionUpdateScreenZhTw._(this._root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String versionReady({required Object p}) => '新版本[${p}]已就緒';
	@override String get update => '重啟更新';
	@override String get cancel => '暫不更新';
}

// Path: main
class _TranslationsMainZhTw implements TranslationsMainEn {
	_TranslationsMainZhTw._(this._root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsMainTrayZhTw tray = _TranslationsMainTrayZhTw._(_root);
}

// Path: meta
class _TranslationsMetaZhTw implements TranslationsMetaEn {
	_TranslationsMetaZhTw._(this._root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get enable => '啟用';
	@override String get disable => '禁用';
	@override String get open => '打開';
	@override String get close => '關閉';
	@override String get quit => '退出';
	@override String get add => '添加';
	@override String get byDefault => '預設';
	@override String get more => '更多';
	@override String get tips => '提示';
	@override String get copy => '複製';
	@override String get save => '保存';
	@override String get ok => '確定';
	@override String get cancel => '取消';
	@override String get faq => '常見問題';
	@override String get download => '下載';
	@override String get loading => '載入中...';
	@override String get days => '天';
	@override String get hours => '時';
	@override String get minutes => '分';
	@override String get seconds => '秒';
	@override String get protocol => '協議';
	@override String get search => '搜索';
	@override String get custom => '自定義';
	@override String get connect => '連接';
	@override String get disconnect => '斷開';
	@override String get connected => '已連接';
	@override String get disconnected => '未連接';
	@override String get connecting => '連接中';
	@override String get connectTimeout => '連接超時';
	@override String get timeout => '超時';
	@override String get timeoutDuration => '超時時長';
	@override String get latency => '延遲';
	@override String get latencyTest => '延遲檢測';
	@override String get language => '語言';
	@override String get next => '下一步';
	@override String get done => '完成';
	@override String get apply => '應用';
	@override String get refresh => '刷新';
	@override String get retry => '是否重試?';
	@override String get update => '更新';
	@override String get none => '無';
	@override String get reset => '重置';
	@override String get authentication => '授權';
	@override String get submit => '提交';
	@override String get user => '用戶';
	@override String get account => '賬號';
	@override String get password => '密碼';
	@override String get required => '必填';
	@override String get sudoPassword => 'sudo 密碼(TUN模式需要)';
	@override String get other => '其他';
	@override String get dns => 'DNS';
	@override String get url => 'URL';
	@override String get urlInvalid => 'URL無效';
	@override String get urlCannotEmpty => 'URL不能為空';
	@override String get launchAtStartup => '開機啟動';
	@override String get launchAtStartupRunAsAdmin => '請以管理員身份重新啟動Ski';
	@override String get tunModeRunAsAdmin => 'TUN模式需要系統管理員權限,請以管理員身份重新啟動應用';
	@override String get requireAdminPrivilegeAtStartup => '請以管理員身份重新啟動應用(TUN模式需要管理員權限)';
	@override String get portableMode => '便攜模式';
	@override String get portableModeDisableTips => '如需退出便攜模式,請退出[skivpn]後,手動刪除[ski.exe]同目錄下的[portable]文件夾即可';
	@override String get systemProxy => '系統代理';
	@override String get autoConnectAfterLaunch => '啟動後自動連接';
	@override String get autoConnectAtBoot => '系統啟動後自動連接';
	@override String get autoConnectAtBootTips => '需要系統支持,部分系統可能還需要開啟[自啟動]';
	@override String get hideAfterLaunch => '啟動後隱藏窗口';
	@override String get autoSetSystemProxy => '連接後自動設置系統代理';
	@override String get bypassSystemProxy => '允許繞過系統代理的域名';
	@override String get excludeFromRecent => '從[最近任務]中隱藏';
	@override String get wakeLock => '喚醒鎖';
	@override String get hideVpn => '隱藏VPN圖標';
	@override String get hideVpnTips => '開啟IPv6會導致此功能失效';
	@override String get hideDockIcon => '隱藏Dock圖標';
	@override String get website => '官網';
	@override String get termOfUse => '使用條款';
	@override String get privacyPolicy => '隱私政策';
	@override String get log => '日誌';
	@override String get coreLog => '核心日誌';
	@override String get core => '核心';
	@override String get help => '幫助';
	@override String get tutorial => '使用教程';
	@override String get board => '面板';
	@override String get boardOnline => '使用在線面板';
	@override String get boardOnlineUrl => '在線面板URL';
	@override String get boardLocalPort => '本地面板端口';
	@override String get disableFontScaler => '禁用字體縮放';
	@override String get autoOrientation => '跟隨屏幕旋轉';
	@override String get restartTakesEffect => '重啟生效';
	@override String get reconnectTakesEffect => '重新連接後生效';
	@override String get runtimeProfile => '運行時配置';
	@override String get willCompleteAfterRebootInstall => '請重啟設備,以便完成系統擴展安裝';
	@override String get willCompleteAfterRebootUninstall => '請重啟設備,以便完成系統擴展卸載';
	@override String get requestNeedsUserApproval => '1. 請在[系統設置]-[隱私與安全性]裏[允許] Ski安裝系統擴展\n2. :[系統設置]-[通用]-[登錄項與擴展-網絡擴展]啟用[skiServiceSE]\n完成後重新連接';
	@override String get FullDiskAccessPermissionRequired => '請在[系統設置]-[隱私與安全性]-[完全磁盤訪問權限]裏開啟skiServiceSE權限後,重新連接';
	@override String get proxy => '代理';
	@override String get theme => '主題';
	@override String get tvMode => 'TV模式';
	@override String get autoUpdate => '自動更新';
	@override String get updateChannel => '自動更新通道';
	@override String hasNewVersion({required Object p}) => '更新版本 ${p}';
	@override String get autoDownloadPkg => '自動下載更新包';
	@override String get devOptions => '開發者選項';
	@override String get about => '關於';
	@override String get name => '名稱';
	@override String get logout => '註銷';
	@override String get version => '版本';
	@override String get notice => '通知';
	@override String get sort => '排序';
	@override String get recommended => '推薦';
	@override String innerError({required Object p}) => '內部錯誤:${p}';
	@override String get server => '伺服器';
	@override String get setting => '設定';
	@override String get settingCore => '核心設定';
	@override String get settingApp => '應用設定';
	@override String get deviceNoSpace => '磁盤空間不足';
	@override String get hideSystemApp => '隱藏系統應用';
	@override String get hideAppIcon => '隱藏應用圖標';
	@override String get openDir => '打開文件目錄';
	@override String get uwpExemption => 'UWP網絡隔離豁免';
}

// Path: permission
class _TranslationsPermissionZhTw implements TranslationsPermissionEn {
	_TranslationsPermissionZhTw._(this._root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get appQuery => '獲取應用列表';
	@override String request({required Object p}) => '開啟[${p}]權限';
	@override String requestNeed({required Object p}) => '請開啟[${p}]權限';
}

// Path: tun
class _TranslationsTunZhTw implements TranslationsTunEn {
	_TranslationsTunZhTw._(this._root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get stack => '網絡棧';
	@override String get inet4Address => 'IPv4位址段';
	@override String get inet6Address => 'IPv6位址段';
	@override String get dnsHijack => 'DNS劫持';
	@override String get strictRoute => '嚴格路由';
	@override String get icmpForward => 'ICMP 轉發';
	@override String get allowBypass => '允許應用繞過VPN';
	@override String get appendHttpProxy => '附加HTTP代理到VPN';
	@override String get bypassHttpProxyDomain => '允許繞過HTTP代理的域名';
}

// Path: homeScreen
class _TranslationsHomeScreenZhTw implements TranslationsHomeScreenEn {
	_TranslationsHomeScreenZhTw._(this._root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get traffic => '流量:';
	@override String get speed => '速度:';
	@override String get autoSelect => '自動選擇';
	@override String get loadBalance => '負載均衡';
	@override String get serviceCenter => '服務中心';
	@override String get onlineSupport => '線上客服';
	@override String get subscriptionChannel => '訂閱頻道';
	@override String get buyPlan => '購買套餐';
}

// Path: loginScreen
class _TranslationsLoginScreenZhTw implements TranslationsLoginScreenEn {
	_TranslationsLoginScreenZhTw._(this._root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get login => '登錄';
	@override String get register => '註冊賬號';
	@override String get forgotPassword => '忘記密碼';
	@override String get provider => '服務商';
	@override String get providerName => '${_root.loginScreen.provider}名稱';
	@override String get providerNameRequired => '請輸入${_root.loginScreen.provider}名稱';
	@override String get account => '賬號';
	@override String get accountRequired => '請輸入賬號';
	@override String get email => '郵箱';
	@override String get emailRequired => '請輸入郵箱地址';
	@override String get password => '密碼';
	@override String get passwordRequired => '請輸入密碼';
	@override String get validEmailRequired => '請輸入有效的郵箱地址';
	@override String passwordMinLength({required Object minLength}) => '密碼長度至少${minLength}位';
	@override String get unsupportedProvider => '不支持的${_root.loginScreen.provider}';
	@override String get unsupportedProviderType => '不支持的${_root.loginScreen.provider}類型';
}

// Path: planWidget
class _TranslationsPlanWidgetZhTw implements TranslationsPlanWidgetEn {
	_TranslationsPlanWidgetZhTw._(this._root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get used => '已使用';
	@override String get totalTraffic => '總流量';
	@override String get expirationTime => '過期時間';
	@override String get remainingTime => '剩餘時間';
}

// Path: xboardRegisterScreen
class _TranslationsXboardRegisterScreenZhTw implements TranslationsXboardRegisterScreenEn {
	_TranslationsXboardRegisterScreenZhTw._(this._root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get register => '註冊';
	@override String get email => '郵箱';
	@override String get emailVerificationCode => '郵箱驗證碼';
	@override String get send => '發送';
	@override String get password => '密碼';
	@override String get confirmPassword => '確認密碼';
	@override String get verificationCode => '驗證碼';
	@override String get invitationCode => '邀請碼';
	@override String get emailSentNotice => '驗證碼已發送至您的郵箱';
	@override String get registerSuccess => '註冊成功';
	@override String get invalidEmail => '請輸入有效的郵箱地址';
	@override String get passwordRequired => '請輸入密碼';
	@override String passwordMinLength({required Object minLength}) => '密碼長度至少${minLength}位';
	@override String get confirmPasswordRequired => '請再次輸入密碼';
	@override String get passwordMismatch => '兩次輸入的密碼不一致';
	@override String get emailCodeRequired => '請輸入郵箱驗證碼';
	@override String emailCodeLength({required Object codeLength}) => '郵箱驗證碼應為${codeLength}位';
	@override String get verificationCodeRequired => '請輸入驗證碼';
	@override String get verificationCodeLength => '驗證碼長度錯誤';
	@override String get userAgreement => '使用者協議';
	@override String get pleaseCheck => '請勾選';
}

// Path: main.tray
class _TranslationsMainTrayZhTw implements TranslationsMainTrayEn {
	_TranslationsMainTrayZhTw._(this._root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get menuOpen => '打開';
	@override String get menuExit => '退出';
}

/// The flat map containing all translations for locale <zh-TW>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsZhTw {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'LaunchFailedScreen.invalidProcess' => '應用啟動失敗[無效的進程名稱],請重新安裝應用到獨立目錄',
			'LaunchFailedScreen.invalidProfile' => '應用啟動失敗[訪問設定檔失敗],請重新安裝應用',
			'LaunchFailedScreen.invalidVersion' => '應用啟動失敗[無效版本],請重新安裝應用',
			'LaunchFailedScreen.systemVersionLow' => '應用啟動失敗[系統版本過低]',
			'LaunchFailedScreen.invalidInstallPath' => '無效的安裝路徑,請重新安裝到有效路徑',
			'PerAppAndroidScreen.title' => '分應用代理',
			'PerAppAndroidScreen.whiteListMode' => '白名單模式',
			'PerAppAndroidScreen.whiteListModeTip' => '啟用後:僅代理已勾選的App;未啟用:僅代理未勾選的App',
			'UserAgreementScreen.privacyFirst' => '您的隱私很重要',
			'UserAgreementScreen.agreeAndContinue' => '接受並繼續',
			'VersionUpdateScreen.versionReady' => ({required Object p}) => '新版本[${p}]已就緒',
			'VersionUpdateScreen.update' => '重啟更新',
			'VersionUpdateScreen.cancel' => '暫不更新',
			'main.tray.menuOpen' => '打開',
			'main.tray.menuExit' => '退出',
			'meta.enable' => '啟用',
			'meta.disable' => '禁用',
			'meta.open' => '打開',
			'meta.close' => '關閉',
			'meta.quit' => '退出',
			'meta.add' => '添加',
			'meta.byDefault' => '預設',
			'meta.more' => '更多',
			'meta.tips' => '提示',
			'meta.copy' => '複製',
			'meta.save' => '保存',
			'meta.ok' => '確定',
			'meta.cancel' => '取消',
			'meta.faq' => '常見問題',
			'meta.download' => '下載',
			'meta.loading' => '載入中...',
			'meta.days' => '天',
			'meta.hours' => '時',
			'meta.minutes' => '分',
			'meta.seconds' => '秒',
			'meta.protocol' => '協議',
			'meta.search' => '搜索',
			'meta.custom' => '自定義',
			'meta.connect' => '連接',
			'meta.disconnect' => '斷開',
			'meta.connected' => '已連接',
			'meta.disconnected' => '未連接',
			'meta.connecting' => '連接中',
			'meta.connectTimeout' => '連接超時',
			'meta.timeout' => '超時',
			'meta.timeoutDuration' => '超時時長',
			'meta.latency' => '延遲',
			'meta.latencyTest' => '延遲檢測',
			'meta.language' => '語言',
			'meta.next' => '下一步',
			'meta.done' => '完成',
			'meta.apply' => '應用',
			'meta.refresh' => '刷新',
			'meta.retry' => '是否重試?',
			'meta.update' => '更新',
			'meta.none' => '無',
			'meta.reset' => '重置',
			'meta.authentication' => '授權',
			'meta.submit' => '提交',
			'meta.user' => '用戶',
			'meta.account' => '賬號',
			'meta.password' => '密碼',
			'meta.required' => '必填',
			'meta.sudoPassword' => 'sudo 密碼(TUN模式需要)',
			'meta.other' => '其他',
			'meta.dns' => 'DNS',
			'meta.url' => 'URL',
			'meta.urlInvalid' => 'URL無效',
			'meta.urlCannotEmpty' => 'URL不能為空',
			'meta.launchAtStartup' => '開機啟動',
			'meta.launchAtStartupRunAsAdmin' => '請以管理員身份重新啟動Ski',
			'meta.tunModeRunAsAdmin' => 'TUN模式需要系統管理員權限,請以管理員身份重新啟動應用',
			'meta.requireAdminPrivilegeAtStartup' => '請以管理員身份重新啟動應用(TUN模式需要管理員權限)',
			'meta.portableMode' => '便攜模式',
			'meta.portableModeDisableTips' => '如需退出便攜模式,請退出[skivpn]後,手動刪除[ski.exe]同目錄下的[portable]文件夾即可',
			'meta.systemProxy' => '系統代理',
			'meta.autoConnectAfterLaunch' => '啟動後自動連接',
			'meta.autoConnectAtBoot' => '系統啟動後自動連接',
			'meta.autoConnectAtBootTips' => '需要系統支持,部分系統可能還需要開啟[自啟動]',
			'meta.hideAfterLaunch' => '啟動後隱藏窗口',
			'meta.autoSetSystemProxy' => '連接後自動設置系統代理',
			'meta.bypassSystemProxy' => '允許繞過系統代理的域名',
			'meta.excludeFromRecent' => '從[最近任務]中隱藏',
			'meta.wakeLock' => '喚醒鎖',
			'meta.hideVpn' => '隱藏VPN圖標',
			'meta.hideVpnTips' => '開啟IPv6會導致此功能失效',
			'meta.hideDockIcon' => '隱藏Dock圖標',
			'meta.website' => '官網',
			'meta.termOfUse' => '使用條款',
			'meta.privacyPolicy' => '隱私政策',
			'meta.log' => '日誌',
			'meta.coreLog' => '核心日誌',
			'meta.core' => '核心',
			'meta.help' => '幫助',
			'meta.tutorial' => '使用教程',
			'meta.board' => '面板',
			'meta.boardOnline' => '使用在線面板',
			'meta.boardOnlineUrl' => '在線面板URL',
			'meta.boardLocalPort' => '本地面板端口',
			'meta.disableFontScaler' => '禁用字體縮放',
			'meta.autoOrientation' => '跟隨屏幕旋轉',
			'meta.restartTakesEffect' => '重啟生效',
			'meta.reconnectTakesEffect' => '重新連接後生效',
			'meta.runtimeProfile' => '運行時配置',
			'meta.willCompleteAfterRebootInstall' => '請重啟設備,以便完成系統擴展安裝',
			'meta.willCompleteAfterRebootUninstall' => '請重啟設備,以便完成系統擴展卸載',
			'meta.requestNeedsUserApproval' => '1. 請在[系統設置]-[隱私與安全性]裏[允許] Ski安裝系統擴展\n2. :[系統設置]-[通用]-[登錄項與擴展-網絡擴展]啟用[skiServiceSE]\n完成後重新連接',
			'meta.FullDiskAccessPermissionRequired' => '請在[系統設置]-[隱私與安全性]-[完全磁盤訪問權限]裏開啟skiServiceSE權限後,重新連接',
			'meta.proxy' => '代理',
			'meta.theme' => '主題',
			'meta.tvMode' => 'TV模式',
			'meta.autoUpdate' => '自動更新',
			'meta.updateChannel' => '自動更新通道',
			'meta.hasNewVersion' => ({required Object p}) => '更新版本 ${p}',
			'meta.autoDownloadPkg' => '自動下載更新包',
			'meta.devOptions' => '開發者選項',
			'meta.about' => '關於',
			'meta.name' => '名稱',
			'meta.logout' => '註銷',
			'meta.version' => '版本',
			'meta.notice' => '通知',
			'meta.sort' => '排序',
			'meta.recommended' => '推薦',
			'meta.innerError' => ({required Object p}) => '內部錯誤:${p}',
			'meta.server' => '伺服器',
			'meta.setting' => '設定',
			'meta.settingCore' => '核心設定',
			'meta.settingApp' => '應用設定',
			'meta.deviceNoSpace' => '磁盤空間不足',
			'meta.hideSystemApp' => '隱藏系統應用',
			'meta.hideAppIcon' => '隱藏應用圖標',
			'meta.openDir' => '打開文件目錄',
			'meta.uwpExemption' => 'UWP網絡隔離豁免',
			'permission.appQuery' => '獲取應用列表',
			'permission.request' => ({required Object p}) => '開啟[${p}]權限',
			'permission.requestNeed' => ({required Object p}) => '請開啟[${p}]權限',
			'tun.stack' => '網絡棧',
			'tun.inet4Address' => 'IPv4位址段',
			'tun.inet6Address' => 'IPv6位址段',
			'tun.dnsHijack' => 'DNS劫持',
			'tun.strictRoute' => '嚴格路由',
			'tun.icmpForward' => 'ICMP 轉發',
			'tun.allowBypass' => '允許應用繞過VPN',
			'tun.appendHttpProxy' => '附加HTTP代理到VPN',
			'tun.bypassHttpProxyDomain' => '允許繞過HTTP代理的域名',
			'edgeRuntimeNotInstalled' => '當前設備尚未安裝Edge WebView2運行時,無法展示頁面,請下載安裝Edge WebView2運行時(x64)後,重啟App再試',
			'homeScreen.traffic' => '流量:',
			'homeScreen.speed' => '速度:',
			'homeScreen.autoSelect' => '自動選擇',
			'homeScreen.loadBalance' => '負載均衡',
			'homeScreen.serviceCenter' => '服務中心',
			'homeScreen.onlineSupport' => '線上客服',
			'homeScreen.subscriptionChannel' => '訂閱頻道',
			'homeScreen.buyPlan' => '購買套餐',
			'loginScreen.login' => '登錄',
			'loginScreen.register' => '註冊賬號',
			'loginScreen.forgotPassword' => '忘記密碼',
			'loginScreen.provider' => '服務商',
			'loginScreen.providerName' => '${_root.loginScreen.provider}名稱',
			'loginScreen.providerNameRequired' => '請輸入${_root.loginScreen.provider}名稱',
			'loginScreen.account' => '賬號',
			'loginScreen.accountRequired' => '請輸入賬號',
			'loginScreen.email' => '郵箱',
			'loginScreen.emailRequired' => '請輸入郵箱地址',
			'loginScreen.password' => '密碼',
			'loginScreen.passwordRequired' => '請輸入密碼',
			'loginScreen.validEmailRequired' => '請輸入有效的郵箱地址',
			'loginScreen.passwordMinLength' => ({required Object minLength}) => '密碼長度至少${minLength}位',
			'loginScreen.unsupportedProvider' => '不支持的${_root.loginScreen.provider}',
			'loginScreen.unsupportedProviderType' => '不支持的${_root.loginScreen.provider}類型',
			'planWidget.used' => '已使用',
			'planWidget.totalTraffic' => '總流量',
			'planWidget.expirationTime' => '過期時間',
			'planWidget.remainingTime' => '剩餘時間',
			'xboardRegisterScreen.register' => '註冊',
			'xboardRegisterScreen.email' => '郵箱',
			'xboardRegisterScreen.emailVerificationCode' => '郵箱驗證碼',
			'xboardRegisterScreen.send' => '發送',
			'xboardRegisterScreen.password' => '密碼',
			'xboardRegisterScreen.confirmPassword' => '確認密碼',
			'xboardRegisterScreen.verificationCode' => '驗證碼',
			'xboardRegisterScreen.invitationCode' => '邀請碼',
			'xboardRegisterScreen.emailSentNotice' => '驗證碼已發送至您的郵箱',
			'xboardRegisterScreen.registerSuccess' => '註冊成功',
			'xboardRegisterScreen.invalidEmail' => '請輸入有效的郵箱地址',
			'xboardRegisterScreen.passwordRequired' => '請輸入密碼',
			'xboardRegisterScreen.passwordMinLength' => ({required Object minLength}) => '密碼長度至少${minLength}位',
			'xboardRegisterScreen.confirmPasswordRequired' => '請再次輸入密碼',
			'xboardRegisterScreen.passwordMismatch' => '兩次輸入的密碼不一致',
			'xboardRegisterScreen.emailCodeRequired' => '請輸入郵箱驗證碼',
			'xboardRegisterScreen.emailCodeLength' => ({required Object codeLength}) => '郵箱驗證碼應為${codeLength}位',
			'xboardRegisterScreen.verificationCodeRequired' => '請輸入驗證碼',
			'xboardRegisterScreen.verificationCodeLength' => '驗證碼長度錯誤',
			'xboardRegisterScreen.userAgreement' => '使用者協議',
			'xboardRegisterScreen.pleaseCheck' => '請勾選',
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
