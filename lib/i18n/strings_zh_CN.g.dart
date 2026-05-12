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
class TranslationsZhCn with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsZhCn({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.zhCn,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <zh-CN>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsZhCn _root = this; // ignore: unused_field

	@override 
	TranslationsZhCn $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsZhCn(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsLaunchFailedScreenZhCn LaunchFailedScreen = _TranslationsLaunchFailedScreenZhCn._(_root);
	@override late final _TranslationsPerAppAndroidScreenZhCn PerAppAndroidScreen = _TranslationsPerAppAndroidScreenZhCn._(_root);
	@override late final _TranslationsUserAgreementScreenZhCn UserAgreementScreen = _TranslationsUserAgreementScreenZhCn._(_root);
	@override late final _TranslationsVersionUpdateScreenZhCn VersionUpdateScreen = _TranslationsVersionUpdateScreenZhCn._(_root);
	@override late final _TranslationsHomeScreenZhCn homeScreen = _TranslationsHomeScreenZhCn._(_root);
	@override late final _TranslationsLoginScreenZhCn loginScreen = _TranslationsLoginScreenZhCn._(_root);
	@override late final _TranslationsPlanWidgetZhCn planWidget = _TranslationsPlanWidgetZhCn._(_root);
	@override late final _TranslationsXboardRegisterScreenZhCn xboardRegisterScreen = _TranslationsXboardRegisterScreenZhCn._(_root);
	@override late final _TranslationsMainZhCn main = _TranslationsMainZhCn._(_root);
	@override late final _TranslationsMetaZhCn meta = _TranslationsMetaZhCn._(_root);
	@override late final _TranslationsPermissionZhCn permission = _TranslationsPermissionZhCn._(_root);
	@override late final _TranslationsTunZhCn tun = _TranslationsTunZhCn._(_root);
	@override String get edgeRuntimeNotInstalled => '当前设备尚未安装Edge WebView2运行时,无法展示页面,请下载安装Edge WebView2运行时(x64)后,重启App再试';
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
class _TranslationsLaunchFailedScreenZhCn implements TranslationsLaunchFailedScreenEn {
	_TranslationsLaunchFailedScreenZhCn._(this._root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get invalidProcess => '应用启动失败[无效的进程名称],请重新安装应用到独立目录';
	@override String get invalidProfile => '应用启动失败[访问配置文件失败],请重新安装应用';
	@override String get invalidVersion => '应用启动失败[无效版本],请重新安装应用';
	@override String get systemVersionLow => '应用启动失败[系统版本过低]';
	@override String get invalidInstallPath => '无效的安装路径,请重新安装到有效路径';
}

// Path: PerAppAndroidScreen
class _TranslationsPerAppAndroidScreenZhCn implements TranslationsPerAppAndroidScreenEn {
	_TranslationsPerAppAndroidScreenZhCn._(this._root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '分应用代理';
	@override String get whiteListMode => '白名单模式';
	@override String get whiteListModeTip => '启用后:仅代理已勾选的App;未启用:仅代理未勾选的App';
}

// Path: UserAgreementScreen
class _TranslationsUserAgreementScreenZhCn implements TranslationsUserAgreementScreenEn {
	_TranslationsUserAgreementScreenZhCn._(this._root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get privacyFirst => '您的隐私很重要';
	@override String get agreeAndContinue => '接受并继续';
}

// Path: VersionUpdateScreen
class _TranslationsVersionUpdateScreenZhCn implements TranslationsVersionUpdateScreenEn {
	_TranslationsVersionUpdateScreenZhCn._(this._root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String versionReady({required Object p}) => '新版本[${p}]已就绪';
	@override String get update => '重启更新';
	@override String get cancel => '暂不更新';
}

// Path: homeScreen
class _TranslationsHomeScreenZhCn implements TranslationsHomeScreenEn {
	_TranslationsHomeScreenZhCn._(this._root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get traffic => '流量:';
	@override String get speed => '速度:';
	@override String get autoSelect => '自动选择';
	@override String get loadBalance => '负载均衡';
	@override String get serviceCenter => '服务中心';
	@override String get onlineSupport => '在线客服';
	@override String get subscriptionChannel => '订阅频道';
	@override String get buyPlan => '购买套餐';
}

// Path: loginScreen
class _TranslationsLoginScreenZhCn implements TranslationsLoginScreenEn {
	_TranslationsLoginScreenZhCn._(this._root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get login => '登录';
	@override String get register => '注册账号';
	@override String get forgotPassword => '忘记密码';
	@override String get provider => '服务商(机场)';
	@override String get providerName => '${_root.loginScreen.provider}名称';
	@override String get providerNameRequired => '请输入${_root.loginScreen.provider}名称';
	@override String get account => '账号';
	@override String get accountRequired => '请输入账号';
	@override String get email => '邮箱';
	@override String get emailRequired => '请输入邮箱地址';
	@override String get password => '密码';
	@override String get passwordRequired => '请输入密码';
	@override String get validEmailRequired => '请输入有效的邮箱地址';
	@override String passwordMinLength({required Object minLength}) => '密码长度至少${minLength}位';
	@override String get unsupportedProvider => '不支持的${_root.loginScreen.provider}';
	@override String get unsupportedProviderType => '不支持的${_root.loginScreen.provider}类型';
}

// Path: planWidget
class _TranslationsPlanWidgetZhCn implements TranslationsPlanWidgetEn {
	_TranslationsPlanWidgetZhCn._(this._root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get used => '已使用';
	@override String get totalTraffic => '总流量';
	@override String get expirationTime => '过期时间';
	@override String get remainingTime => '剩余时间';
}

// Path: xboardRegisterScreen
class _TranslationsXboardRegisterScreenZhCn implements TranslationsXboardRegisterScreenEn {
	_TranslationsXboardRegisterScreenZhCn._(this._root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get register => '注册';
	@override String get email => '邮箱';
	@override String get emailVerificationCode => '邮箱验证码';
	@override String get send => '发送';
	@override String get password => '密码';
	@override String get confirmPassword => '确认密码';
	@override String get verificationCode => '验证码';
	@override String get invitationCode => '邀请码';
	@override String get emailSentNotice => '验证码已发送至您的邮箱';
	@override String get registerSuccess => '注册成功';
	@override String get invalidEmail => '请输入有效的邮箱地址';
	@override String get passwordRequired => '请输入密码';
	@override String passwordMinLength({required Object minLength}) => '密码长度至少${minLength}位';
	@override String get confirmPasswordRequired => '请再次输入密码';
	@override String get passwordMismatch => '两次输入的密码不一致';
	@override String get emailCodeRequired => '请输入邮箱验证码';
	@override String emailCodeLength({required Object codeLength}) => '邮箱验证码应为${codeLength}位';
	@override String get verificationCodeRequired => '请输入验证码';
	@override String get verificationCodeLength => '验证码长度错误';
	@override String get userAgreement => '用户协议';
	@override String get pleaseCheck => '请勾选';
}

// Path: main
class _TranslationsMainZhCn implements TranslationsMainEn {
	_TranslationsMainZhCn._(this._root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsMainTrayZhCn tray = _TranslationsMainTrayZhCn._(_root);
}

// Path: meta
class _TranslationsMetaZhCn implements TranslationsMetaEn {
	_TranslationsMetaZhCn._(this._root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get enable => '启用';
	@override String get disable => '禁用';
	@override String get open => '打开';
	@override String get close => '关闭';
	@override String get quit => '退出';
	@override String get add => '添加';
	@override String get byDefault => '默认';
	@override String get more => '更多';
	@override String get tips => '提示';
	@override String get copy => '拷贝';
	@override String get save => '保存';
	@override String get ok => '确定';
	@override String get cancel => '取消';
	@override String get faq => '常见问题';
	@override String get download => '下载';
	@override String get loading => '加载中...';
	@override String get days => '天';
	@override String get hours => '时';
	@override String get minutes => '分';
	@override String get seconds => '秒';
	@override String get protocol => '协议';
	@override String get search => '搜索';
	@override String get custom => '自定义';
	@override String get connect => '连接';
	@override String get disconnect => '断开';
	@override String get connected => '已连接';
	@override String get disconnected => '未连接';
	@override String get connecting => '连接中';
	@override String get connectTimeout => '连接超时';
	@override String get timeout => '超时';
	@override String get timeoutDuration => '超时时长';
	@override String get latency => '延迟';
	@override String get latencyTest => '延迟检测';
	@override String get language => '语言';
	@override String get next => '下一步';
	@override String get done => '完成';
	@override String get apply => '应用';
	@override String get refresh => '刷新';
	@override String get retry => '是否重试?';
	@override String get update => '更新';
	@override String get none => '无';
	@override String get reset => '重置';
	@override String get authentication => '授权';
	@override String get submit => '提交';
	@override String get user => '用户';
	@override String get account => '账号';
	@override String get password => '密码';
	@override String get required => '必填';
	@override String get sudoPassword => 'sudo 密码(TUN模式需要)';
	@override String get other => '其他';
	@override String get dns => 'DNS';
	@override String get url => 'URL';
	@override String get urlInvalid => 'URL无效';
	@override String get urlCannotEmpty => 'URL不能为空';
	@override String get launchAtStartup => '开机启动';
	@override String get launchAtStartupRunAsAdmin => '请以管理员身份重新启动Ski';
	@override String get tunModeRunAsAdmin => 'TUN模式需要系统管理员权限,请以管理员身份重新启动应用';
	@override String get requireAdminPrivilegeAtStartup => '请以管理员身份重启启动应用(TUN模式需要管理员权限)';
	@override String get portableMode => '便携模式';
	@override String get portableModeDisableTips => '如需退出便携模式,请退出[skivpn]后,手动删除[ski.exe]同目录下的[portable]文件夹即可';
	@override String get systemProxy => '系统代理';
	@override String get autoConnectAfterLaunch => '启动后自动连接';
	@override String get autoConnectAtBoot => '系统启动后自动连接';
	@override String get autoConnectAtBootTips => '需要系统支持,部分系统可能还需要开启[自启动]';
	@override String get hideAfterLaunch => '启动后隐藏窗口';
	@override String get autoSetSystemProxy => '连接后自动设置系统代理';
	@override String get bypassSystemProxy => '允许绕过系统代理的域名';
	@override String get excludeFromRecent => '从[最近任务]中隐藏';
	@override String get wakeLock => '唤醒锁';
	@override String get hideVpn => '隐藏VPN图标';
	@override String get hideVpnTips => '开启IPv6会导致此功能失效';
	@override String get hideDockIcon => '隐藏Dock图标';
	@override String get website => '官网';
	@override String get termOfUse => '使用条款';
	@override String get privacyPolicy => '隐私政策';
	@override String get log => '日志';
	@override String get coreLog => '核心日志';
	@override String get core => '核心';
	@override String get help => '帮助';
	@override String get tutorial => '使用教程';
	@override String get board => '面板';
	@override String get boardOnline => '使用在线面板';
	@override String get boardOnlineUrl => '在线面板URL';
	@override String get boardLocalPort => '本地面板端口';
	@override String get disableFontScaler => '禁用字体缩放';
	@override String get autoOrientation => '跟随屏幕旋转';
	@override String get restartTakesEffect => '重启生效';
	@override String get reconnectTakesEffect => '重新连接后生效';
	@override String get runtimeProfile => '运行时配置';
	@override String get willCompleteAfterRebootInstall => '请重启设备,以便完成系统扩展安装';
	@override String get willCompleteAfterRebootUninstall => '请重启设备,以便完成系统扩展卸载';
	@override String get requestNeedsUserApproval => '1. 请在[系统设置]-[隐私与安全性]里[允许] Ski安装系统扩展\n2. :[系统设置]-[通用]-[登录项与扩展-网络扩展]启用[skiServiceSE]\n完成后重新连接';
	@override String get FullDiskAccessPermissionRequired => '请在[系统设置]-[隐私与安全性]-[完全磁盘访问权限]里开启skiServiceSE权限后,重新连接';
	@override String get proxy => '代理';
	@override String get theme => '主题';
	@override String get tvMode => 'TV模式';
	@override String get autoUpdate => '自动更新';
	@override String get updateChannel => '自动更新通道';
	@override String hasNewVersion({required Object p}) => '更新版本 ${p}';
	@override String get autoDownloadPkg => '自动下载更新包';
	@override String get devOptions => '开发者选项';
	@override String get about => '关于';
	@override String get name => '名称';
	@override String get logout => '注销';
	@override String get version => '版本';
	@override String get notice => '通知';
	@override String get sort => '排序';
	@override String get recommended => '推荐';
	@override String innerError({required Object p}) => '内部错误:${p}';
	@override String get server => '服务器';
	@override String get setting => '设置';
	@override String get settingCore => '核心设置';
	@override String get settingApp => '应用设置';
	@override String get deviceNoSpace => '磁盘空间不足';
	@override String get hideSystemApp => '隐藏系统应用';
	@override String get hideAppIcon => '隐藏应用图标';
	@override String get openDir => '打开文件目录';
	@override String get uwpExemption => 'UWP网络隔离豁免';
}

// Path: permission
class _TranslationsPermissionZhCn implements TranslationsPermissionEn {
	_TranslationsPermissionZhCn._(this._root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get appQuery => '获取应用列表';
	@override String request({required Object p}) => '开启[${p}]权限';
	@override String requestNeed({required Object p}) => '请开启[${p}]权限';
}

// Path: tun
class _TranslationsTunZhCn implements TranslationsTunEn {
	_TranslationsTunZhCn._(this._root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get stack => '网络栈';
	@override String get inet4Address => 'IPv4地址段';
	@override String get inet6Address => 'IPv6地址段';
	@override String get dnsHijack => 'DNS劫持';
	@override String get strictRoute => '严格路由';
	@override String get icmpForward => 'ICMP 转发';
	@override String get allowBypass => '允许应用绕过VPN';
	@override String get appendHttpProxy => '附加HTTP代理到VPN';
	@override String get bypassHttpProxyDomain => '允许绕过HTTP代理的域名';
}

// Path: main.tray
class _TranslationsMainTrayZhCn implements TranslationsMainTrayEn {
	_TranslationsMainTrayZhCn._(this._root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get menuOpen => '打开';
	@override String get menuExit => '退出';
}

/// The flat map containing all translations for locale <zh-CN>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsZhCn {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'LaunchFailedScreen.invalidProcess' => '应用启动失败[无效的进程名称],请重新安装应用到独立目录',
			'LaunchFailedScreen.invalidProfile' => '应用启动失败[访问配置文件失败],请重新安装应用',
			'LaunchFailedScreen.invalidVersion' => '应用启动失败[无效版本],请重新安装应用',
			'LaunchFailedScreen.systemVersionLow' => '应用启动失败[系统版本过低]',
			'LaunchFailedScreen.invalidInstallPath' => '无效的安装路径,请重新安装到有效路径',
			'PerAppAndroidScreen.title' => '分应用代理',
			'PerAppAndroidScreen.whiteListMode' => '白名单模式',
			'PerAppAndroidScreen.whiteListModeTip' => '启用后:仅代理已勾选的App;未启用:仅代理未勾选的App',
			'UserAgreementScreen.privacyFirst' => '您的隐私很重要',
			'UserAgreementScreen.agreeAndContinue' => '接受并继续',
			'VersionUpdateScreen.versionReady' => ({required Object p}) => '新版本[${p}]已就绪',
			'VersionUpdateScreen.update' => '重启更新',
			'VersionUpdateScreen.cancel' => '暂不更新',
			'homeScreen.traffic' => '流量:',
			'homeScreen.speed' => '速度:',
			'homeScreen.autoSelect' => '自动选择',
			'homeScreen.loadBalance' => '负载均衡',
			'homeScreen.serviceCenter' => '服务中心',
			'homeScreen.onlineSupport' => '在线客服',
			'homeScreen.subscriptionChannel' => '订阅频道',
			'homeScreen.buyPlan' => '购买套餐',
			'loginScreen.login' => '登录',
			'loginScreen.register' => '注册账号',
			'loginScreen.forgotPassword' => '忘记密码',
			'loginScreen.provider' => '服务商(机场)',
			'loginScreen.providerName' => '${_root.loginScreen.provider}名称',
			'loginScreen.providerNameRequired' => '请输入${_root.loginScreen.provider}名称',
			'loginScreen.account' => '账号',
			'loginScreen.accountRequired' => '请输入账号',
			'loginScreen.email' => '邮箱',
			'loginScreen.emailRequired' => '请输入邮箱地址',
			'loginScreen.password' => '密码',
			'loginScreen.passwordRequired' => '请输入密码',
			'loginScreen.validEmailRequired' => '请输入有效的邮箱地址',
			'loginScreen.passwordMinLength' => ({required Object minLength}) => '密码长度至少${minLength}位',
			'loginScreen.unsupportedProvider' => '不支持的${_root.loginScreen.provider}',
			'loginScreen.unsupportedProviderType' => '不支持的${_root.loginScreen.provider}类型',
			'planWidget.used' => '已使用',
			'planWidget.totalTraffic' => '总流量',
			'planWidget.expirationTime' => '过期时间',
			'planWidget.remainingTime' => '剩余时间',
			'xboardRegisterScreen.register' => '注册',
			'xboardRegisterScreen.email' => '邮箱',
			'xboardRegisterScreen.emailVerificationCode' => '邮箱验证码',
			'xboardRegisterScreen.send' => '发送',
			'xboardRegisterScreen.password' => '密码',
			'xboardRegisterScreen.confirmPassword' => '确认密码',
			'xboardRegisterScreen.verificationCode' => '验证码',
			'xboardRegisterScreen.invitationCode' => '邀请码',
			'xboardRegisterScreen.emailSentNotice' => '验证码已发送至您的邮箱',
			'xboardRegisterScreen.registerSuccess' => '注册成功',
			'xboardRegisterScreen.invalidEmail' => '请输入有效的邮箱地址',
			'xboardRegisterScreen.passwordRequired' => '请输入密码',
			'xboardRegisterScreen.passwordMinLength' => ({required Object minLength}) => '密码长度至少${minLength}位',
			'xboardRegisterScreen.confirmPasswordRequired' => '请再次输入密码',
			'xboardRegisterScreen.passwordMismatch' => '两次输入的密码不一致',
			'xboardRegisterScreen.emailCodeRequired' => '请输入邮箱验证码',
			'xboardRegisterScreen.emailCodeLength' => ({required Object codeLength}) => '邮箱验证码应为${codeLength}位',
			'xboardRegisterScreen.verificationCodeRequired' => '请输入验证码',
			'xboardRegisterScreen.verificationCodeLength' => '验证码长度错误',
			'xboardRegisterScreen.userAgreement' => '用户协议',
			'xboardRegisterScreen.pleaseCheck' => '请勾选',
			'main.tray.menuOpen' => '打开',
			'main.tray.menuExit' => '退出',
			'meta.enable' => '启用',
			'meta.disable' => '禁用',
			'meta.open' => '打开',
			'meta.close' => '关闭',
			'meta.quit' => '退出',
			'meta.add' => '添加',
			'meta.byDefault' => '默认',
			'meta.more' => '更多',
			'meta.tips' => '提示',
			'meta.copy' => '拷贝',
			'meta.save' => '保存',
			'meta.ok' => '确定',
			'meta.cancel' => '取消',
			'meta.faq' => '常见问题',
			'meta.download' => '下载',
			'meta.loading' => '加载中...',
			'meta.days' => '天',
			'meta.hours' => '时',
			'meta.minutes' => '分',
			'meta.seconds' => '秒',
			'meta.protocol' => '协议',
			'meta.search' => '搜索',
			'meta.custom' => '自定义',
			'meta.connect' => '连接',
			'meta.disconnect' => '断开',
			'meta.connected' => '已连接',
			'meta.disconnected' => '未连接',
			'meta.connecting' => '连接中',
			'meta.connectTimeout' => '连接超时',
			'meta.timeout' => '超时',
			'meta.timeoutDuration' => '超时时长',
			'meta.latency' => '延迟',
			'meta.latencyTest' => '延迟检测',
			'meta.language' => '语言',
			'meta.next' => '下一步',
			'meta.done' => '完成',
			'meta.apply' => '应用',
			'meta.refresh' => '刷新',
			'meta.retry' => '是否重试?',
			'meta.update' => '更新',
			'meta.none' => '无',
			'meta.reset' => '重置',
			'meta.authentication' => '授权',
			'meta.submit' => '提交',
			'meta.user' => '用户',
			'meta.account' => '账号',
			'meta.password' => '密码',
			'meta.required' => '必填',
			'meta.sudoPassword' => 'sudo 密码(TUN模式需要)',
			'meta.other' => '其他',
			'meta.dns' => 'DNS',
			'meta.url' => 'URL',
			'meta.urlInvalid' => 'URL无效',
			'meta.urlCannotEmpty' => 'URL不能为空',
			'meta.launchAtStartup' => '开机启动',
			'meta.launchAtStartupRunAsAdmin' => '请以管理员身份重新启动Ski',
			'meta.tunModeRunAsAdmin' => 'TUN模式需要系统管理员权限,请以管理员身份重新启动应用',
			'meta.requireAdminPrivilegeAtStartup' => '请以管理员身份重启启动应用(TUN模式需要管理员权限)',
			'meta.portableMode' => '便携模式',
			'meta.portableModeDisableTips' => '如需退出便携模式,请退出[skivpn]后,手动删除[ski.exe]同目录下的[portable]文件夹即可',
			'meta.systemProxy' => '系统代理',
			'meta.autoConnectAfterLaunch' => '启动后自动连接',
			'meta.autoConnectAtBoot' => '系统启动后自动连接',
			'meta.autoConnectAtBootTips' => '需要系统支持,部分系统可能还需要开启[自启动]',
			'meta.hideAfterLaunch' => '启动后隐藏窗口',
			'meta.autoSetSystemProxy' => '连接后自动设置系统代理',
			'meta.bypassSystemProxy' => '允许绕过系统代理的域名',
			'meta.excludeFromRecent' => '从[最近任务]中隐藏',
			'meta.wakeLock' => '唤醒锁',
			'meta.hideVpn' => '隐藏VPN图标',
			'meta.hideVpnTips' => '开启IPv6会导致此功能失效',
			'meta.hideDockIcon' => '隐藏Dock图标',
			'meta.website' => '官网',
			'meta.termOfUse' => '使用条款',
			'meta.privacyPolicy' => '隐私政策',
			'meta.log' => '日志',
			'meta.coreLog' => '核心日志',
			'meta.core' => '核心',
			'meta.help' => '帮助',
			'meta.tutorial' => '使用教程',
			'meta.board' => '面板',
			'meta.boardOnline' => '使用在线面板',
			'meta.boardOnlineUrl' => '在线面板URL',
			'meta.boardLocalPort' => '本地面板端口',
			'meta.disableFontScaler' => '禁用字体缩放',
			'meta.autoOrientation' => '跟随屏幕旋转',
			'meta.restartTakesEffect' => '重启生效',
			'meta.reconnectTakesEffect' => '重新连接后生效',
			'meta.runtimeProfile' => '运行时配置',
			'meta.willCompleteAfterRebootInstall' => '请重启设备,以便完成系统扩展安装',
			'meta.willCompleteAfterRebootUninstall' => '请重启设备,以便完成系统扩展卸载',
			'meta.requestNeedsUserApproval' => '1. 请在[系统设置]-[隐私与安全性]里[允许] Ski安装系统扩展\n2. :[系统设置]-[通用]-[登录项与扩展-网络扩展]启用[skiServiceSE]\n完成后重新连接',
			'meta.FullDiskAccessPermissionRequired' => '请在[系统设置]-[隐私与安全性]-[完全磁盘访问权限]里开启skiServiceSE权限后,重新连接',
			'meta.proxy' => '代理',
			'meta.theme' => '主题',
			'meta.tvMode' => 'TV模式',
			'meta.autoUpdate' => '自动更新',
			'meta.updateChannel' => '自动更新通道',
			'meta.hasNewVersion' => ({required Object p}) => '更新版本 ${p}',
			'meta.autoDownloadPkg' => '自动下载更新包',
			'meta.devOptions' => '开发者选项',
			'meta.about' => '关于',
			'meta.name' => '名称',
			'meta.logout' => '注销',
			'meta.version' => '版本',
			'meta.notice' => '通知',
			'meta.sort' => '排序',
			'meta.recommended' => '推荐',
			'meta.innerError' => ({required Object p}) => '内部错误:${p}',
			'meta.server' => '服务器',
			'meta.setting' => '设置',
			'meta.settingCore' => '核心设置',
			'meta.settingApp' => '应用设置',
			'meta.deviceNoSpace' => '磁盘空间不足',
			'meta.hideSystemApp' => '隐藏系统应用',
			'meta.hideAppIcon' => '隐藏应用图标',
			'meta.openDir' => '打开文件目录',
			'meta.uwpExemption' => 'UWP网络隔离豁免',
			'permission.appQuery' => '获取应用列表',
			'permission.request' => ({required Object p}) => '开启[${p}]权限',
			'permission.requestNeed' => ({required Object p}) => '请开启[${p}]权限',
			'tun.stack' => '网络栈',
			'tun.inet4Address' => 'IPv4地址段',
			'tun.inet6Address' => 'IPv6地址段',
			'tun.dnsHijack' => 'DNS劫持',
			'tun.strictRoute' => '严格路由',
			'tun.icmpForward' => 'ICMP 转发',
			'tun.allowBypass' => '允许应用绕过VPN',
			'tun.appendHttpProxy' => '附加HTTP代理到VPN',
			'tun.bypassHttpProxyDomain' => '允许绕过HTTP代理的域名',
			'edgeRuntimeNotInstalled' => '当前设备尚未安装Edge WebView2运行时,无法展示页面,请下载安装Edge WebView2运行时(x64)后,重启App再试',
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
