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
class TranslationsJa with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsJa({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ja,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ja>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsJa _root = this; // ignore: unused_field

	@override 
	TranslationsJa $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsJa(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsLaunchFailedScreenJa LaunchFailedScreen = _TranslationsLaunchFailedScreenJa._(_root);
	@override late final _TranslationsPerAppAndroidScreenJa PerAppAndroidScreen = _TranslationsPerAppAndroidScreenJa._(_root);
	@override late final _TranslationsUserAgreementScreenJa UserAgreementScreen = _TranslationsUserAgreementScreenJa._(_root);
	@override late final _TranslationsVersionUpdateScreenJa VersionUpdateScreen = _TranslationsVersionUpdateScreenJa._(_root);
	@override late final _TranslationsMainJa main = _TranslationsMainJa._(_root);
	@override late final _TranslationsMetaJa meta = _TranslationsMetaJa._(_root);
	@override late final _TranslationsPermissionJa permission = _TranslationsPermissionJa._(_root);
	@override late final _TranslationsTunJa tun = _TranslationsTunJa._(_root);
	@override String get edgeRuntimeNotInstalled => '現在のデバイスには Edge WebView2 ランタイムがインストールされていないため、ページを表示できません。Edge WebView2 ランタイム (x64) をダウンロードしてインストールし、アプリを再起動してからもう一度お試しください。';
	@override late final _TranslationsHomeScreenJa homeScreen = _TranslationsHomeScreenJa._(_root);
	@override late final _TranslationsLoginScreenJa loginScreen = _TranslationsLoginScreenJa._(_root);
	@override late final _TranslationsPlanWidgetJa planWidget = _TranslationsPlanWidgetJa._(_root);
	@override late final _TranslationsXboardRegisterScreenJa xboardRegisterScreen = _TranslationsXboardRegisterScreenJa._(_root);
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
class _TranslationsLaunchFailedScreenJa implements TranslationsLaunchFailedScreenEn {
	_TranslationsLaunchFailedScreenJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get invalidProcess => 'アプリの起動に失敗しました [無効なプロセス名]。アプリを別のディレクトリに再インストールしてください';
	@override String get invalidProfile => 'アプリの起動に失敗しました [プロファイルへのアクセスに失敗]。アプリを再インストールしてください';
	@override String get invalidVersion => 'アプリの起動に失敗しました [無効なバージョン]。アプリを再インストールしてください';
	@override String get systemVersionLow => 'アプリの起動に失敗しました [システムバージョンが低すぎます]';
	@override String get invalidInstallPath => 'インストールパスが無効です。有効なパスに再インストールしてください';
}

// Path: PerAppAndroidScreen
class _TranslationsPerAppAndroidScreenJa implements TranslationsPerAppAndroidScreenEn {
	_TranslationsPerAppAndroidScreenJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get title => 'アプリごとのプロキシ';
	@override String get whiteListMode => 'ホワイトリストモード';
	@override String get whiteListModeTip => '有効な場合：チェックされたアプリのみがプロキシされます。無効な場合：チェックされていないアプリのみがプロキシされます';
}

// Path: UserAgreementScreen
class _TranslationsUserAgreementScreenJa implements TranslationsUserAgreementScreenEn {
	_TranslationsUserAgreementScreenJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get privacyFirst => 'プライバシーを第一に';
	@override String get agreeAndContinue => '同意して続行';
}

// Path: VersionUpdateScreen
class _TranslationsVersionUpdateScreenJa implements TranslationsVersionUpdateScreenEn {
	_TranslationsVersionUpdateScreenJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String versionReady({required Object p}) => '新しいバージョン [${p}] の準備ができました';
	@override String get update => '再起動して更新';
	@override String get cancel => '今はしない';
}

// Path: main
class _TranslationsMainJa implements TranslationsMainEn {
	_TranslationsMainJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsMainTrayJa tray = _TranslationsMainTrayJa._(_root);
}

// Path: meta
class _TranslationsMetaJa implements TranslationsMetaEn {
	_TranslationsMetaJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get enable => '有効';
	@override String get disable => '無効';
	@override String get open => '開く';
	@override String get close => '閉じる';
	@override String get quit => '終了';
	@override String get add => '追加';
	@override String get byDefault => 'デフォルト';
	@override String get more => '詳細';
	@override String get tips => '情報';
	@override String get copy => 'コピー';
	@override String get save => '保存';
	@override String get ok => 'OK';
	@override String get cancel => 'キャンセル';
	@override String get faq => 'よくある質問';
	@override String get download => 'ダウンロード';
	@override String get loading => '読み込み中...';
	@override String get days => '日';
	@override String get hours => '時間';
	@override String get minutes => '分';
	@override String get seconds => '秒';
	@override String get protocol => 'プロトコル';
	@override String get search => '検索';
	@override String get custom => 'カスタム';
	@override String get connect => '接続';
	@override String get disconnect => '切断';
	@override String get connected => '接続済み';
	@override String get disconnected => '切断済み';
	@override String get connecting => '接続中';
	@override String get connectTimeout => '接続タイムアウト';
	@override String get timeout => 'タイムアウト';
	@override String get timeoutDuration => 'タイムアウト時間';
	@override String get latency => '遅延';
	@override String get latencyTest => '遅延チェック';
	@override String get language => '言語';
	@override String get next => '次へ';
	@override String get done => '完了';
	@override String get apply => '適用';
	@override String get refresh => '更新';
	@override String get retry => '再試行しますか？';
	@override String get update => '更新';
	@override String get none => 'なし';
	@override String get reset => 'リセット';
	@override String get authentication => '認証';
	@override String get submit => '送信';
	@override String get user => 'ユーザー';
	@override String get account => 'アカウント';
	@override String get password => 'パスワード';
	@override String get required => '必須';
	@override String get sudoPassword => 'sudo パスワード (TUNモードで必要)';
	@override String get other => 'その他';
	@override String get dns => 'DNS';
	@override String get url => 'URL';
	@override String get urlInvalid => '無効なURL';
	@override String get urlCannotEmpty => 'リンクを空にすることはできません';
	@override String get launchAtStartup => 'スタートアップ時に起動';
	@override String get launchAtStartupRunAsAdmin => 'Skiを管理者として再起動してください';
	@override String get tunModeRunAsAdmin => 'TUNモードにはシステム管理者権限が必要です。アプリを管理者として再起動してください';
	@override String get requireAdminPrivilegeAtStartup => '管理者としてアプリを再起動してください(TUNモードには管理者権限が必要です)';
	@override String get portableMode => 'ポータブルモード';
	@override String get portableModeDisableTips => 'ポータブルモードを終了する必要がある場合は、[skivpn]を終了し、[ski.exe]と同じディレクトリにある[portable]フォルダを手動で削除してください';
	@override String get systemProxy => 'システムプロキシ';
	@override String get autoConnectAfterLaunch => '起動後に自動接続';
	@override String get autoConnectAtBoot => 'システム起動後に自動接続';
	@override String get autoConnectAtBootTips => 'システムのサポートが必要です。一部のシステムでは[自動起動]を有効にする必要がある場合があります。';
	@override String get hideAfterLaunch => '起動後にウィンドウを隠す';
	@override String get autoSetSystemProxy => '接続時にシステムプロキシを自動設定';
	@override String get bypassSystemProxy => 'システムプロキシをバイパスすることを許可するドメイン名';
	@override String get excludeFromRecent => '[最近のタスク]から隠す';
	@override String get wakeLock => 'スリープ防止';
	@override String get hideVpn => 'VPNアイコンを隠す';
	@override String get hideVpnTips => 'IPv6を有効にすると、この機能は失敗します';
	@override String get hideDockIcon => 'Dockアイコンを隠す';
	@override String get website => 'ウェブサイト';
	@override String get termOfUse => '利用規約';
	@override String get privacyPolicy => 'プライバシーポリシー';
	@override String get log => 'ログ';
	@override String get coreLog => 'コアログ';
	@override String get core => 'コア';
	@override String get help => 'ヘルプ';
	@override String get tutorial => 'チュートリアル';
	@override String get board => 'ボード';
	@override String get boardOnline => 'オンラインボードを使用';
	@override String get boardOnlineUrl => 'オンラインボードURL';
	@override String get boardLocalPort => 'ローカルボードポート';
	@override String get disableFontScaler => 'フォントスケーリングを無効にする（再起動後に有効）';
	@override String get autoOrientation => '画面に合わせて回転';
	@override String get restartTakesEffect => '再起動後に有効';
	@override String get reconnectTakesEffect => '再接続後に有効';
	@override String get runtimeProfile => '実行時プロファイル';
	@override String get willCompleteAfterRebootInstall => 'システム拡張機能のインストールを完了するには、デバイスを再起動してください';
	@override String get willCompleteAfterRebootUninstall => 'システム拡張機能のアンインストールを完了するには、デバイスを再起動してください';
	@override String get requestNeedsUserApproval => '1. [システム設定]-[プライバシーとセキュリティ]でSkiによるシステム拡張機能のインストールを[許可]してください\n2. [システム設定]-[一般]-[ログイン項目と拡張機能]-[ネットワーク拡張機能]で[skiServiceSE]を有効にしてください\n完了後に再接続してください';
	@override String get FullDiskAccessPermissionRequired => '[システム設定]-[プライバシーとセキュリティ]-[フルディスクアクセス]でskiServiceSEの権限を有効にし、再接続してください。';
	@override String get proxy => 'プロキシ';
	@override String get theme => 'テーマ';
	@override String get tvMode => 'TVモード';
	@override String get autoUpdate => '自動更新';
	@override String get updateChannel => '自動更新チャンネル';
	@override String hasNewVersion({required Object p}) => 'バージョン ${p} に更新';
	@override String get autoDownloadPkg => '更新パッケージを自動ダウンロード';
	@override String get devOptions => '開発者オプション';
	@override String get about => 'このアプリについて';
	@override String get name => '名前';
	@override String get logout => 'ログアウト';
	@override String get version => 'バージョン';
	@override String get notice => 'お知らせ';
	@override String get sort => '並べ替え';
	@override String get recommended => 'おすすめ';
	@override String innerError({required Object p}) => '内部エラー: ${p}';
	@override String get server => 'サーバー';
	@override String get setting => '設定';
	@override String get settingCore => 'コア設定';
	@override String get settingApp => 'アプリ設定';
	@override String get deviceNoSpace => 'ディスク容量不足';
	@override String get hideSystemApp => 'システムアプリを隠す';
	@override String get hideAppIcon => 'アプリアイコンを隠す';
	@override String get openDir => 'ファイルディレクトリを開く';
	@override String get uwpExemption => 'UWPネットワーク分離免除';
}

// Path: permission
class _TranslationsPermissionJa implements TranslationsPermissionEn {
	_TranslationsPermissionJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get appQuery => 'アプリケーションリストを取得';
	@override String request({required Object p}) => '[${p}] 権限をオンにする';
	@override String requestNeed({required Object p}) => '[${p}] 権限をオンにしてください';
}

// Path: tun
class _TranslationsTunJa implements TranslationsTunEn {
	_TranslationsTunJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get stack => 'ネットワークスタック';
	@override String get inet4Address => 'IPv4アドレス範囲';
	@override String get inet6Address => 'IPv6アドレス範囲';
	@override String get dnsHijack => 'DNSハイジャック';
	@override String get strictRoute => '厳格なルート';
	@override String get icmpForward => 'ICMP転送';
	@override String get allowBypass => 'アプリがVPNをバイパスすることを許可する';
	@override String get appendHttpProxy => 'VPNにHTTPプロキシを追加する';
	@override String get bypassHttpProxyDomain => 'HTTPプロキシをバイパスすることを許可するドメイン';
}

// Path: homeScreen
class _TranslationsHomeScreenJa implements TranslationsHomeScreenEn {
	_TranslationsHomeScreenJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get traffic => 'トラフィック:';
	@override String get speed => '速度:';
	@override String get autoSelect => '自動選択';
	@override String get loadBalance => '負荷分散';
	@override String get serviceCenter => 'サービスセンター';
	@override String get onlineSupport => 'オンラインサポート';
	@override String get subscriptionChannel => 'サブスクリプションチャンネル';
	@override String get buyPlan => 'プランを購入';
}

// Path: loginScreen
class _TranslationsLoginScreenJa implements TranslationsLoginScreenEn {
	_TranslationsLoginScreenJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get login => 'ログイン';
	@override String get register => 'アカウント登録';
	@override String get forgotPassword => 'パスワードを忘れた';
	@override String get provider => 'プロバイダー';
	@override String get providerName => '${_root.loginScreen.provider}名';
	@override String get providerNameRequired => '${_root.loginScreen.provider}名を入力してください';
	@override String get account => 'アカウント';
	@override String get accountRequired => 'アカウントを入力してください';
	@override String get email => 'メール';
	@override String get emailRequired => 'メールアドレスを入力してください';
	@override String get password => 'パスワード';
	@override String get passwordRequired => 'パスワードを入力してください';
	@override String get validEmailRequired => '有効なメールアドレスを入力してください';
	@override String passwordMinLength({required Object minLength}) => 'パスワード長は最低${minLength}文字以上である必要があります';
	@override String get unsupportedProvider => 'サポートされていない${_root.loginScreen.provider}';
	@override String get unsupportedProviderType => 'サポートされていない${_root.loginScreen.provider}タイプ';
}

// Path: planWidget
class _TranslationsPlanWidgetJa implements TranslationsPlanWidgetEn {
	_TranslationsPlanWidgetJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get used => '使用済み';
	@override String get totalTraffic => '総トラフィック';
	@override String get expirationTime => '有効期限';
	@override String get remainingTime => '残り時間';
}

// Path: xboardRegisterScreen
class _TranslationsXboardRegisterScreenJa implements TranslationsXboardRegisterScreenEn {
	_TranslationsXboardRegisterScreenJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get register => '登録';
	@override String get email => 'メール';
	@override String get emailVerificationCode => 'メール認証コード';
	@override String get send => '送信';
	@override String get password => 'パスワード';
	@override String get confirmPassword => 'パスワードを確認する';
	@override String get verificationCode => '認証コード';
	@override String get invitationCode => '招待コード';
	@override String get emailSentNotice => '認証コードをメールで送信しました';
	@override String get registerSuccess => '登録に成功しました';
	@override String get invalidEmail => '有効なメールアドレスを入力してください';
	@override String get passwordRequired => 'パスワードを入力してください';
	@override String passwordMinLength({required Object minLength}) => 'パスワード長は最低${minLength}文字以上である必要があります';
	@override String get confirmPasswordRequired => 'パスワードをもう一度入力してください';
	@override String get passwordMismatch => '2回入力したパスワードが一致しません';
	@override String get emailCodeRequired => 'メール認証コードを入力してください';
	@override String emailCodeLength({required Object codeLength}) => 'メール認診コードは${codeLength}桁である必要があります';
	@override String get verificationCodeRequired => '認証コードを入力してください';
	@override String get verificationCodeLength => '認証コードの長さが不正です';
	@override String get userAgreement => '利用規約';
	@override String get pleaseCheck => 'チェックしてください';
}

// Path: main.tray
class _TranslationsMainTrayJa implements TranslationsMainTrayEn {
	_TranslationsMainTrayJa._(this._root);

	final TranslationsJa _root; // ignore: unused_field

	// Translations
	@override String get menuOpen => '開く';
	@override String get menuExit => '終了';
}

/// The flat map containing all translations for locale <ja>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsJa {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'LaunchFailedScreen.invalidProcess' => 'アプリの起動に失敗しました [無効なプロセス名]。アプリを別のディレクトリに再インストールしてください',
			'LaunchFailedScreen.invalidProfile' => 'アプリの起動に失敗しました [プロファイルへのアクセスに失敗]。アプリを再インストールしてください',
			'LaunchFailedScreen.invalidVersion' => 'アプリの起動に失敗しました [無効なバージョン]。アプリを再インストールしてください',
			'LaunchFailedScreen.systemVersionLow' => 'アプリの起動に失敗しました [システムバージョンが低すぎます]',
			'LaunchFailedScreen.invalidInstallPath' => 'インストールパスが無効です。有効なパスに再インストールしてください',
			'PerAppAndroidScreen.title' => 'アプリごとのプロキシ',
			'PerAppAndroidScreen.whiteListMode' => 'ホワイトリストモード',
			'PerAppAndroidScreen.whiteListModeTip' => '有効な場合：チェックされたアプリのみがプロキシされます。無効な場合：チェックされていないアプリのみがプロキシされます',
			'UserAgreementScreen.privacyFirst' => 'プライバシーを第一に',
			'UserAgreementScreen.agreeAndContinue' => '同意して続行',
			'VersionUpdateScreen.versionReady' => ({required Object p}) => '新しいバージョン [${p}] の準備ができました',
			'VersionUpdateScreen.update' => '再起動して更新',
			'VersionUpdateScreen.cancel' => '今はしない',
			'main.tray.menuOpen' => '開く',
			'main.tray.menuExit' => '終了',
			'meta.enable' => '有効',
			'meta.disable' => '無効',
			'meta.open' => '開く',
			'meta.close' => '閉じる',
			'meta.quit' => '終了',
			'meta.add' => '追加',
			'meta.byDefault' => 'デフォルト',
			'meta.more' => '詳細',
			'meta.tips' => '情報',
			'meta.copy' => 'コピー',
			'meta.save' => '保存',
			'meta.ok' => 'OK',
			'meta.cancel' => 'キャンセル',
			'meta.faq' => 'よくある質問',
			'meta.download' => 'ダウンロード',
			'meta.loading' => '読み込み中...',
			'meta.days' => '日',
			'meta.hours' => '時間',
			'meta.minutes' => '分',
			'meta.seconds' => '秒',
			'meta.protocol' => 'プロトコル',
			'meta.search' => '検索',
			'meta.custom' => 'カスタム',
			'meta.connect' => '接続',
			'meta.disconnect' => '切断',
			'meta.connected' => '接続済み',
			'meta.disconnected' => '切断済み',
			'meta.connecting' => '接続中',
			'meta.connectTimeout' => '接続タイムアウト',
			'meta.timeout' => 'タイムアウト',
			'meta.timeoutDuration' => 'タイムアウト時間',
			'meta.latency' => '遅延',
			'meta.latencyTest' => '遅延チェック',
			'meta.language' => '言語',
			'meta.next' => '次へ',
			'meta.done' => '完了',
			'meta.apply' => '適用',
			'meta.refresh' => '更新',
			'meta.retry' => '再試行しますか？',
			'meta.update' => '更新',
			'meta.none' => 'なし',
			'meta.reset' => 'リセット',
			'meta.authentication' => '認証',
			'meta.submit' => '送信',
			'meta.user' => 'ユーザー',
			'meta.account' => 'アカウント',
			'meta.password' => 'パスワード',
			'meta.required' => '必須',
			'meta.sudoPassword' => 'sudo パスワード (TUNモードで必要)',
			'meta.other' => 'その他',
			'meta.dns' => 'DNS',
			'meta.url' => 'URL',
			'meta.urlInvalid' => '無効なURL',
			'meta.urlCannotEmpty' => 'リンクを空にすることはできません',
			'meta.launchAtStartup' => 'スタートアップ時に起動',
			'meta.launchAtStartupRunAsAdmin' => 'Skiを管理者として再起動してください',
			'meta.tunModeRunAsAdmin' => 'TUNモードにはシステム管理者権限が必要です。アプリを管理者として再起動してください',
			'meta.requireAdminPrivilegeAtStartup' => '管理者としてアプリを再起動してください(TUNモードには管理者権限が必要です)',
			'meta.portableMode' => 'ポータブルモード',
			'meta.portableModeDisableTips' => 'ポータブルモードを終了する必要がある場合は、[skivpn]を終了し、[ski.exe]と同じディレクトリにある[portable]フォルダを手動で削除してください',
			'meta.systemProxy' => 'システムプロキシ',
			'meta.autoConnectAfterLaunch' => '起動後に自動接続',
			'meta.autoConnectAtBoot' => 'システム起動後に自動接続',
			'meta.autoConnectAtBootTips' => 'システムのサポートが必要です。一部のシステムでは[自動起動]を有効にする必要がある場合があります。',
			'meta.hideAfterLaunch' => '起動後にウィンドウを隠す',
			'meta.autoSetSystemProxy' => '接続時にシステムプロキシを自動設定',
			'meta.bypassSystemProxy' => 'システムプロキシをバイパスすることを許可するドメイン名',
			'meta.excludeFromRecent' => '[最近のタスク]から隠す',
			'meta.wakeLock' => 'スリープ防止',
			'meta.hideVpn' => 'VPNアイコンを隠す',
			'meta.hideVpnTips' => 'IPv6を有効にすると、この機能は失敗します',
			'meta.hideDockIcon' => 'Dockアイコンを隠す',
			'meta.website' => 'ウェブサイト',
			'meta.termOfUse' => '利用規約',
			'meta.privacyPolicy' => 'プライバシーポリシー',
			'meta.log' => 'ログ',
			'meta.coreLog' => 'コアログ',
			'meta.core' => 'コア',
			'meta.help' => 'ヘルプ',
			'meta.tutorial' => 'チュートリアル',
			'meta.board' => 'ボード',
			'meta.boardOnline' => 'オンラインボードを使用',
			'meta.boardOnlineUrl' => 'オンラインボードURL',
			'meta.boardLocalPort' => 'ローカルボードポート',
			'meta.disableFontScaler' => 'フォントスケーリングを無効にする（再起動後に有効）',
			'meta.autoOrientation' => '画面に合わせて回転',
			'meta.restartTakesEffect' => '再起動後に有効',
			'meta.reconnectTakesEffect' => '再接続後に有効',
			'meta.runtimeProfile' => '実行時プロファイル',
			'meta.willCompleteAfterRebootInstall' => 'システム拡張機能のインストールを完了するには、デバイスを再起動してください',
			'meta.willCompleteAfterRebootUninstall' => 'システム拡張機能のアンインストールを完了するには、デバイスを再起動してください',
			'meta.requestNeedsUserApproval' => '1. [システム設定]-[プライバシーとセキュリティ]でSkiによるシステム拡張機能のインストールを[許可]してください\n2. [システム設定]-[一般]-[ログイン項目と拡張機能]-[ネットワーク拡張機能]で[skiServiceSE]を有効にしてください\n完了後に再接続してください',
			'meta.FullDiskAccessPermissionRequired' => '[システム設定]-[プライバシーとセキュリティ]-[フルディスクアクセス]でskiServiceSEの権限を有効にし、再接続してください。',
			'meta.proxy' => 'プロキシ',
			'meta.theme' => 'テーマ',
			'meta.tvMode' => 'TVモード',
			'meta.autoUpdate' => '自動更新',
			'meta.updateChannel' => '自動更新チャンネル',
			'meta.hasNewVersion' => ({required Object p}) => 'バージョン ${p} に更新',
			'meta.autoDownloadPkg' => '更新パッケージを自動ダウンロード',
			'meta.devOptions' => '開発者オプション',
			'meta.about' => 'このアプリについて',
			'meta.name' => '名前',
			'meta.logout' => 'ログアウト',
			'meta.version' => 'バージョン',
			'meta.notice' => 'お知らせ',
			'meta.sort' => '並べ替え',
			'meta.recommended' => 'おすすめ',
			'meta.innerError' => ({required Object p}) => '内部エラー: ${p}',
			'meta.server' => 'サーバー',
			'meta.setting' => '設定',
			'meta.settingCore' => 'コア設定',
			'meta.settingApp' => 'アプリ設定',
			'meta.deviceNoSpace' => 'ディスク容量不足',
			'meta.hideSystemApp' => 'システムアプリを隠す',
			'meta.hideAppIcon' => 'アプリアイコンを隠す',
			'meta.openDir' => 'ファイルディレクトリを開く',
			'meta.uwpExemption' => 'UWPネットワーク分離免除',
			'permission.appQuery' => 'アプリケーションリストを取得',
			'permission.request' => ({required Object p}) => '[${p}] 権限をオンにする',
			'permission.requestNeed' => ({required Object p}) => '[${p}] 権限をオンにしてください',
			'tun.stack' => 'ネットワークスタック',
			'tun.inet4Address' => 'IPv4アドレス範囲',
			'tun.inet6Address' => 'IPv6アドレス範囲',
			'tun.dnsHijack' => 'DNSハイジャック',
			'tun.strictRoute' => '厳格なルート',
			'tun.icmpForward' => 'ICMP転送',
			'tun.allowBypass' => 'アプリがVPNをバイパスすることを許可する',
			'tun.appendHttpProxy' => 'VPNにHTTPプロキシを追加する',
			'tun.bypassHttpProxyDomain' => 'HTTPプロキシをバイパスすることを許可するドメイン',
			'edgeRuntimeNotInstalled' => '現在のデバイスには Edge WebView2 ランタイムがインストールされていないため、ページを表示できません。Edge WebView2 ランタイム (x64) をダウンロードしてインストールし、アプリを再起動してからもう一度お試しください。',
			'homeScreen.traffic' => 'トラフィック:',
			'homeScreen.speed' => '速度:',
			'homeScreen.autoSelect' => '自動選択',
			'homeScreen.loadBalance' => '負荷分散',
			'homeScreen.serviceCenter' => 'サービスセンター',
			'homeScreen.onlineSupport' => 'オンラインサポート',
			'homeScreen.subscriptionChannel' => 'サブスクリプションチャンネル',
			'homeScreen.buyPlan' => 'プランを購入',
			'loginScreen.login' => 'ログイン',
			'loginScreen.register' => 'アカウント登録',
			'loginScreen.forgotPassword' => 'パスワードを忘れた',
			'loginScreen.provider' => 'プロバイダー',
			'loginScreen.providerName' => '${_root.loginScreen.provider}名',
			'loginScreen.providerNameRequired' => '${_root.loginScreen.provider}名を入力してください',
			'loginScreen.account' => 'アカウント',
			'loginScreen.accountRequired' => 'アカウントを入力してください',
			'loginScreen.email' => 'メール',
			'loginScreen.emailRequired' => 'メールアドレスを入力してください',
			'loginScreen.password' => 'パスワード',
			'loginScreen.passwordRequired' => 'パスワードを入力してください',
			'loginScreen.validEmailRequired' => '有効なメールアドレスを入力してください',
			'loginScreen.passwordMinLength' => ({required Object minLength}) => 'パスワード長は最低${minLength}文字以上である必要があります',
			'loginScreen.unsupportedProvider' => 'サポートされていない${_root.loginScreen.provider}',
			'loginScreen.unsupportedProviderType' => 'サポートされていない${_root.loginScreen.provider}タイプ',
			'planWidget.used' => '使用済み',
			'planWidget.totalTraffic' => '総トラフィック',
			'planWidget.expirationTime' => '有効期限',
			'planWidget.remainingTime' => '残り時間',
			'xboardRegisterScreen.register' => '登録',
			'xboardRegisterScreen.email' => 'メール',
			'xboardRegisterScreen.emailVerificationCode' => 'メール認証コード',
			'xboardRegisterScreen.send' => '送信',
			'xboardRegisterScreen.password' => 'パスワード',
			'xboardRegisterScreen.confirmPassword' => 'パスワードを確認する',
			'xboardRegisterScreen.verificationCode' => '認証コード',
			'xboardRegisterScreen.invitationCode' => '招待コード',
			'xboardRegisterScreen.emailSentNotice' => '認証コードをメールで送信しました',
			'xboardRegisterScreen.registerSuccess' => '登録に成功しました',
			'xboardRegisterScreen.invalidEmail' => '有効なメールアドレスを入力してください',
			'xboardRegisterScreen.passwordRequired' => 'パスワードを入力してください',
			'xboardRegisterScreen.passwordMinLength' => ({required Object minLength}) => 'パスワード長は最低${minLength}文字以上である必要があります',
			'xboardRegisterScreen.confirmPasswordRequired' => 'パスワードをもう一度入力してください',
			'xboardRegisterScreen.passwordMismatch' => '2回入力したパスワードが一致しません',
			'xboardRegisterScreen.emailCodeRequired' => 'メール認証コードを入力してください',
			'xboardRegisterScreen.emailCodeLength' => ({required Object codeLength}) => 'メール認診コードは${codeLength}桁である必要があります',
			'xboardRegisterScreen.verificationCodeRequired' => '認証コードを入力してください',
			'xboardRegisterScreen.verificationCodeLength' => '認証コードの長さが不正です',
			'xboardRegisterScreen.userAgreement' => '利用規約',
			'xboardRegisterScreen.pleaseCheck' => 'チェックしてください',
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
