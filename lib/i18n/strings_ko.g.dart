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
class TranslationsKo with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsKo({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ko,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ko>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsKo _root = this; // ignore: unused_field

	@override 
	TranslationsKo $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsKo(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsLaunchFailedScreenKo LaunchFailedScreen = _TranslationsLaunchFailedScreenKo._(_root);
	@override late final _TranslationsPerAppAndroidScreenKo PerAppAndroidScreen = _TranslationsPerAppAndroidScreenKo._(_root);
	@override late final _TranslationsUserAgreementScreenKo UserAgreementScreen = _TranslationsUserAgreementScreenKo._(_root);
	@override late final _TranslationsVersionUpdateScreenKo VersionUpdateScreen = _TranslationsVersionUpdateScreenKo._(_root);
	@override late final _TranslationsMainKo main = _TranslationsMainKo._(_root);
	@override late final _TranslationsMetaKo meta = _TranslationsMetaKo._(_root);
	@override late final _TranslationsPermissionKo permission = _TranslationsPermissionKo._(_root);
	@override late final _TranslationsTunKo tun = _TranslationsTunKo._(_root);
	@override String get edgeRuntimeNotInstalled => '현재 장치에 Edge WebView2 런타임이 설치되어 있지 않아 페이지를 표시할 수 없습니다. Edge WebView2 런타임(x64)을 다운로드하여 설치하고 앱을 다시 시작한 후 다시 시도하십시오。';
	@override late final _TranslationsHomeScreenKo homeScreen = _TranslationsHomeScreenKo._(_root);
	@override late final _TranslationsLoginScreenKo loginScreen = _TranslationsLoginScreenKo._(_root);
	@override late final _TranslationsPlanWidgetKo planWidget = _TranslationsPlanWidgetKo._(_root);
	@override late final _TranslationsXboardRegisterScreenKo xboardRegisterScreen = _TranslationsXboardRegisterScreenKo._(_root);
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
class _TranslationsLaunchFailedScreenKo implements TranslationsLaunchFailedScreenEn {
	_TranslationsLaunchFailedScreenKo._(this._root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get invalidProcess => '앱 시작 실패 [유효하지 않은 프로세스 이름], 앱을 별도의 디렉토리에 다시 설치하십시오';
	@override String get invalidProfile => '앱 시작 실패 [프로필 액세스 실패], 앱을 다시 설치하십시오';
	@override String get invalidVersion => '앱 시작 실패 [유효하지 않은 버전], 앱을 다시 설치하십시오';
	@override String get systemVersionLow => '앱 시작 실패 [시스템 버전이 너무 낮음]';
	@override String get invalidInstallPath => '설치 경로가 유효하지 않습니다. 유효한 경로에 다시 설치하십시오';
}

// Path: PerAppAndroidScreen
class _TranslationsPerAppAndroidScreenKo implements TranslationsPerAppAndroidScreenEn {
	_TranslationsPerAppAndroidScreenKo._(this._root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '앱별 프록시';
	@override String get whiteListMode => '화이트리스트 모드';
	@override String get whiteListModeTip => '활성화 시: 체크된 앱만 프록시됩니다. 비활성화 시: 체크되지 않은 앱만 프록시됩니다';
}

// Path: UserAgreementScreen
class _TranslationsUserAgreementScreenKo implements TranslationsUserAgreementScreenEn {
	_TranslationsUserAgreementScreenKo._(this._root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get privacyFirst => '개인 정보 보호 우선';
	@override String get agreeAndContinue => '동의 및 계속';
}

// Path: VersionUpdateScreen
class _TranslationsVersionUpdateScreenKo implements TranslationsVersionUpdateScreenEn {
	_TranslationsVersionUpdateScreenKo._(this._root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String versionReady({required Object p}) => '새 버전 [${p}]이 준비되었습니다';
	@override String get update => '업데이트를 위해 재시작';
	@override String get cancel => '나중에';
}

// Path: main
class _TranslationsMainKo implements TranslationsMainEn {
	_TranslationsMainKo._(this._root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsMainTrayKo tray = _TranslationsMainTrayKo._(_root);
}

// Path: meta
class _TranslationsMetaKo implements TranslationsMetaEn {
	_TranslationsMetaKo._(this._root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get enable => '활성화';
	@override String get disable => '비활성화';
	@override String get open => '열기';
	@override String get close => '닫기';
	@override String get quit => '종료';
	@override String get add => '추가';
	@override String get byDefault => '기본값';
	@override String get more => '더 보기';
	@override String get tips => '정보';
	@override String get copy => '복사';
	@override String get save => '저장';
	@override String get ok => '확인';
	@override String get cancel => '취소';
	@override String get faq => '자주 묻는 질문';
	@override String get download => '다운로드';
	@override String get loading => '로드 중...';
	@override String get days => '일';
	@override String get hours => '시간';
	@override String get minutes => '분';
	@override String get seconds => '초';
	@override String get protocol => '프로토콜';
	@override String get search => '검색';
	@override String get custom => '사용자 정의';
	@override String get connect => '연결';
	@override String get disconnect => '연결 해제';
	@override String get connected => '연결됨';
	@override String get disconnected => '연결 해제됨';
	@override String get connecting => '연결 중';
	@override String get connectTimeout => '연결 시간 초과';
	@override String get timeout => '시간 초과';
	@override String get timeoutDuration => '시간 초과 기간';
	@override String get latency => '지연 시간';
	@override String get latencyTest => '지연 시간 확인';
	@override String get language => '언어';
	@override String get next => '다음';
	@override String get done => '완료';
	@override String get apply => '적용';
	@override String get refresh => '새로고침';
	@override String get retry => '다시 시도하시겠습니까?';
	@override String get update => '업데이트';
	@override String get none => '없음';
	@override String get reset => '초기화';
	@override String get authentication => '인증';
	@override String get submit => '제출';
	@override String get user => '사용자';
	@override String get account => '계정';
	@override String get password => '비밀번호';
	@override String get required => '필수';
	@override String get sudoPassword => 'sudo 비밀번호 (TUN 모드에 필요)';
	@override String get other => '기타';
	@override String get dns => 'DNS';
	@override String get url => 'URL';
	@override String get urlInvalid => '유효하지 않은 URL';
	@override String get urlCannotEmpty => '링크는 비워둘 수 없습니다';
	@override String get launchAtStartup => '시작 시 실행';
	@override String get launchAtStartupRunAsAdmin => 'Ski를 관리자 권한으로 다시 시작하십시오';
	@override String get tunModeRunAsAdmin => 'TUN 모드는 시스템 관리자 권한이 필요합니다. 앱을 관리자 권한으로 다시 시작하십시오';
	@override String get requireAdminPrivilegeAtStartup => '관리자로 앱을 다시 시작하십시오(TUN 모드에 관리자 권한이 필요함)';
	@override String get portableMode => '포터블 모드';
	@override String get portableModeDisableTips => '포터블 모드를 종료해야 하는 경우 [skivpn]를 종료하고 [ski.exe]와 동일한 디렉토리에 있는 [portable] 폴더를 수동으로 삭제하십시오';
	@override String get systemProxy => '시스템 프록시';
	@override String get autoConnectAfterLaunch => '실행 후 자동 연결';
	@override String get autoConnectAtBoot => '시스템 시작 후 자동 연결';
	@override String get autoConnectAtBootTips => '시스템 지원이 필요합니다. 일부 시스템에서는 [자동 시작]을 활성화해야 할 수도 있습니다.';
	@override String get hideAfterLaunch => '실행 후 창 숨기기';
	@override String get autoSetSystemProxy => '연결 시 시스템 프록시 자동 설정';
	@override String get bypassSystemProxy => '시스템 프록시를 우회하도록 허용된 도메인 이름';
	@override String get excludeFromRecent => '[최근 작업]에서 숨기기';
	@override String get wakeLock => '절전 모드 방지';
	@override String get hideVpn => 'VPN 아이콘 숨기기';
	@override String get hideVpnTips => 'IPv6를 활성화하면 이 기능이 작동하지 않습니다';
	@override String get hideDockIcon => 'Dock 아이콘 숨기기';
	@override String get website => '웹사이트';
	@override String get termOfUse => '서비스 약관';
	@override String get privacyPolicy => '개인정보 보호정책';
	@override String get log => '로그';
	@override String get coreLog => '코어 로그';
	@override String get core => '코어';
	@override String get help => '도움말';
	@override String get tutorial => '튜토리얼';
	@override String get board => '보드';
	@override String get boardOnline => '온라인 보드 사용';
	@override String get boardOnlineUrl => '온라인 보드 URL';
	@override String get boardLocalPort => '로컬 보드 포트';
	@override String get disableFontScaler => '글꼴 크기 조정 비활성화 (재시작 후 적용)';
	@override String get autoOrientation => '화면 방향에 따라 회전';
	@override String get restartTakesEffect => '재시작 후 적용';
	@override String get reconnectTakesEffect => '다시 연결 후 적용';
	@override String get runtimeProfile => '런타임 프로필';
	@override String get willCompleteAfterRebootInstall => '시스템 확장 설치를 완료하려면 장치를 재시작하십시오';
	@override String get willCompleteAfterRebootUninstall => '시스템 확장 제거를 완료하려면 장치를 재시작하십시오';
	@override String get requestNeedsUserApproval => '1. [시스템 설정]-[개인정보 보호 및 보안]에서 Ski의 시스템 확장 설치를 [허용]하십시오\n2. [시스템 설정]-[일반]-[로그인 항목 및 확장 프로그램]-[네트워크 확장 프로그램]에서 [skiServiceSE]를 활성화하십시오\n완료 후 다시 연결하십시오';
	@override String get FullDiskAccessPermissionRequired => '[시스템 설정]-[개인정보 보호 및 보안]-[전체 디스크 액세스]에서 skiServiceSE 권한을 활성화하고 다시 연결하십시오.';
	@override String get proxy => '프록시';
	@override String get theme => '테마';
	@override String get tvMode => 'TV 모드';
	@override String get autoUpdate => '자동 업데이트';
	@override String get updateChannel => '자동 업데이트 채널';
	@override String hasNewVersion({required Object p}) => '버전 ${p}로 업데이트';
	@override String get autoDownloadPkg => '업데이트 패키지 자동 다운로드';
	@override String get devOptions => '개발자 옵션';
	@override String get about => '정보';
	@override String get name => '이름';
	@override String get logout => '로그아웃';
	@override String get version => '버전';
	@override String get notice => '공지사항';
	@override String get sort => '정렬';
	@override String get recommended => '추천';
	@override String innerError({required Object p}) => '내부 오류: ${p}';
	@override String get server => '서버';
	@override String get setting => '설정';
	@override String get settingCore => '코어 설정';
	@override String get settingApp => '앱 설정';
	@override String get deviceNoSpace => '디스크 공간 부족';
	@override String get hideSystemApp => '시스템 앱 숨기기';
	@override String get hideAppIcon => '앱 아이콘 숨기기';
	@override String get openDir => '파일 디렉토리 열기';
	@override String get uwpExemption => 'UWP 네트워크 격리 면제';
}

// Path: permission
class _TranslationsPermissionKo implements TranslationsPermissionEn {
	_TranslationsPermissionKo._(this._root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get appQuery => '애플리케이션 목록 가져오기';
	@override String request({required Object p}) => '[${p}] 권한 켜기';
	@override String requestNeed({required Object p}) => '[${p}] 권한을 켜주십시오';
}

// Path: tun
class _TranslationsTunKo implements TranslationsTunEn {
	_TranslationsTunKo._(this._root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get stack => '네트워크 스택';
	@override String get inet4Address => 'IPv4 주소 범위';
	@override String get inet6Address => 'IPv6 주소 범위';
	@override String get dnsHijack => 'DNS 하이제킹';
	@override String get strictRoute => '엄격한 경로';
	@override String get icmpForward => 'ICMP 전달';
	@override String get allowBypass => '앱이 VPN을 우회하도록 허용';
	@override String get appendHttpProxy => 'VPN에 HTTP 프록시 추가';
	@override String get bypassHttpProxyDomain => 'HTTP 프록시를 우회하도록 허용된 도메인';
}

// Path: homeScreen
class _TranslationsHomeScreenKo implements TranslationsHomeScreenEn {
	_TranslationsHomeScreenKo._(this._root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get traffic => '트래픽:';
	@override String get speed => '속도:';
	@override String get autoSelect => '자동 선택';
	@override String get loadBalance => '로드 밸런스';
	@override String get serviceCenter => '서비스 센터';
	@override String get onlineSupport => '온라인 지원';
	@override String get subscriptionChannel => '구독 채널';
	@override String get buyPlan => '요금제 구매';
}

// Path: loginScreen
class _TranslationsLoginScreenKo implements TranslationsLoginScreenEn {
	_TranslationsLoginScreenKo._(this._root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get login => '로그인';
	@override String get register => '계정 가입';
	@override String get forgotPassword => '비밀번호 찾기';
	@override String get provider => '서비스 제공자';
	@override String get providerName => '${_root.loginScreen.provider} 이름';
	@override String get providerNameRequired => '${_root.loginScreen.provider} 이름을 입력하세요';
	@override String get account => '계정';
	@override String get accountRequired => '계정을 입력하세요';
	@override String get email => '이메일';
	@override String get emailRequired => '이메일 주소를 입력하세요';
	@override String get password => '비밀번호';
	@override String get passwordRequired => '비밀번호를 입력하세요';
	@override String get validEmailRequired => '유효한 이메일 주소를 입력하세요';
	@override String passwordMinLength({required Object minLength}) => '비밀번호 길이는 최소 ${minLength}자 이상이어야 합니다';
	@override String get unsupportedProvider => '지원되지 않는 ${_root.loginScreen.provider}';
	@override String get unsupportedProviderType => '지원되지 않는 ${_root.loginScreen.provider} 유형';
}

// Path: planWidget
class _TranslationsPlanWidgetKo implements TranslationsPlanWidgetEn {
	_TranslationsPlanWidgetKo._(this._root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get used => '사용됨';
	@override String get totalTraffic => '총 트래픽';
	@override String get expirationTime => '만료 시간';
	@override String get remainingTime => '남은 시간';
}

// Path: xboardRegisterScreen
class _TranslationsXboardRegisterScreenKo implements TranslationsXboardRegisterScreenEn {
	_TranslationsXboardRegisterScreenKo._(this._root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get register => '가입';
	@override String get email => '이메일';
	@override String get emailVerificationCode => '이메일 인증 코드';
	@override String get send => '전송';
	@override String get password => '비밀번호';
	@override String get confirmPassword => '비밀번호 확인';
	@override String get verificationCode => '인증 코드';
	@override String get invitationCode => '초대 코드';
	@override String get emailSentNotice => '인증 코드가 이메일로 전송되었습니다';
	@override String get registerSuccess => '가입에 성공했습니다';
	@override String get invalidEmail => '유효한 이메일 주소를 입력하세요';
	@override String get passwordRequired => '비밀번호를 입력하세요';
	@override String passwordMinLength({required Object minLength}) => '비밀번호 길이는 최소 ${minLength}자 이상이어야 합니다';
	@override String get confirmPasswordRequired => '비밀번호를 다시 입력하세요';
	@override String get passwordMismatch => '두 번 입력한 비밀번호가 일치하지 않습니다';
	@override String get emailCodeRequired => '이메일 인증 코드를 입력하세요';
	@override String emailCodeLength({required Object codeLength}) => '이메일 인증 코드는 ${codeLength}자이어야 합니다';
	@override String get verificationCodeRequired => '인증 코드를 입력하세요';
	@override String get verificationCodeLength => '인증 코드 길이 오류';
	@override String get userAgreement => '이용 약관';
	@override String get pleaseCheck => '체크해 주세요';
}

// Path: main.tray
class _TranslationsMainTrayKo implements TranslationsMainTrayEn {
	_TranslationsMainTrayKo._(this._root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get menuOpen => '열기';
	@override String get menuExit => '종료';
}

/// The flat map containing all translations for locale <ko>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsKo {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'LaunchFailedScreen.invalidProcess' => '앱 시작 실패 [유효하지 않은 프로세스 이름], 앱을 별도의 디렉토리에 다시 설치하십시오',
			'LaunchFailedScreen.invalidProfile' => '앱 시작 실패 [프로필 액세스 실패], 앱을 다시 설치하십시오',
			'LaunchFailedScreen.invalidVersion' => '앱 시작 실패 [유효하지 않은 버전], 앱을 다시 설치하십시오',
			'LaunchFailedScreen.systemVersionLow' => '앱 시작 실패 [시스템 버전이 너무 낮음]',
			'LaunchFailedScreen.invalidInstallPath' => '설치 경로가 유효하지 않습니다. 유효한 경로에 다시 설치하십시오',
			'PerAppAndroidScreen.title' => '앱별 프록시',
			'PerAppAndroidScreen.whiteListMode' => '화이트리스트 모드',
			'PerAppAndroidScreen.whiteListModeTip' => '활성화 시: 체크된 앱만 프록시됩니다. 비활성화 시: 체크되지 않은 앱만 프록시됩니다',
			'UserAgreementScreen.privacyFirst' => '개인 정보 보호 우선',
			'UserAgreementScreen.agreeAndContinue' => '동의 및 계속',
			'VersionUpdateScreen.versionReady' => ({required Object p}) => '새 버전 [${p}]이 준비되었습니다',
			'VersionUpdateScreen.update' => '업데이트를 위해 재시작',
			'VersionUpdateScreen.cancel' => '나중에',
			'main.tray.menuOpen' => '열기',
			'main.tray.menuExit' => '종료',
			'meta.enable' => '활성화',
			'meta.disable' => '비활성화',
			'meta.open' => '열기',
			'meta.close' => '닫기',
			'meta.quit' => '종료',
			'meta.add' => '추가',
			'meta.byDefault' => '기본값',
			'meta.more' => '더 보기',
			'meta.tips' => '정보',
			'meta.copy' => '복사',
			'meta.save' => '저장',
			'meta.ok' => '확인',
			'meta.cancel' => '취소',
			'meta.faq' => '자주 묻는 질문',
			'meta.download' => '다운로드',
			'meta.loading' => '로드 중...',
			'meta.days' => '일',
			'meta.hours' => '시간',
			'meta.minutes' => '분',
			'meta.seconds' => '초',
			'meta.protocol' => '프로토콜',
			'meta.search' => '검색',
			'meta.custom' => '사용자 정의',
			'meta.connect' => '연결',
			'meta.disconnect' => '연결 해제',
			'meta.connected' => '연결됨',
			'meta.disconnected' => '연결 해제됨',
			'meta.connecting' => '연결 중',
			'meta.connectTimeout' => '연결 시간 초과',
			'meta.timeout' => '시간 초과',
			'meta.timeoutDuration' => '시간 초과 기간',
			'meta.latency' => '지연 시간',
			'meta.latencyTest' => '지연 시간 확인',
			'meta.language' => '언어',
			'meta.next' => '다음',
			'meta.done' => '완료',
			'meta.apply' => '적용',
			'meta.refresh' => '새로고침',
			'meta.retry' => '다시 시도하시겠습니까?',
			'meta.update' => '업데이트',
			'meta.none' => '없음',
			'meta.reset' => '초기화',
			'meta.authentication' => '인증',
			'meta.submit' => '제출',
			'meta.user' => '사용자',
			'meta.account' => '계정',
			'meta.password' => '비밀번호',
			'meta.required' => '필수',
			'meta.sudoPassword' => 'sudo 비밀번호 (TUN 모드에 필요)',
			'meta.other' => '기타',
			'meta.dns' => 'DNS',
			'meta.url' => 'URL',
			'meta.urlInvalid' => '유효하지 않은 URL',
			'meta.urlCannotEmpty' => '링크는 비워둘 수 없습니다',
			'meta.launchAtStartup' => '시작 시 실행',
			'meta.launchAtStartupRunAsAdmin' => 'Ski를 관리자 권한으로 다시 시작하십시오',
			'meta.tunModeRunAsAdmin' => 'TUN 모드는 시스템 관리자 권한이 필요합니다. 앱을 관리자 권한으로 다시 시작하십시오',
			'meta.requireAdminPrivilegeAtStartup' => '관리자로 앱을 다시 시작하십시오(TUN 모드에 관리자 권한이 필요함)',
			'meta.portableMode' => '포터블 모드',
			'meta.portableModeDisableTips' => '포터블 모드를 종료해야 하는 경우 [skivpn]를 종료하고 [ski.exe]와 동일한 디렉토리에 있는 [portable] 폴더를 수동으로 삭제하십시오',
			'meta.systemProxy' => '시스템 프록시',
			'meta.autoConnectAfterLaunch' => '실행 후 자동 연결',
			'meta.autoConnectAtBoot' => '시스템 시작 후 자동 연결',
			'meta.autoConnectAtBootTips' => '시스템 지원이 필요합니다. 일부 시스템에서는 [자동 시작]을 활성화해야 할 수도 있습니다.',
			'meta.hideAfterLaunch' => '실행 후 창 숨기기',
			'meta.autoSetSystemProxy' => '연결 시 시스템 프록시 자동 설정',
			'meta.bypassSystemProxy' => '시스템 프록시를 우회하도록 허용된 도메인 이름',
			'meta.excludeFromRecent' => '[최근 작업]에서 숨기기',
			'meta.wakeLock' => '절전 모드 방지',
			'meta.hideVpn' => 'VPN 아이콘 숨기기',
			'meta.hideVpnTips' => 'IPv6를 활성화하면 이 기능이 작동하지 않습니다',
			'meta.hideDockIcon' => 'Dock 아이콘 숨기기',
			'meta.website' => '웹사이트',
			'meta.termOfUse' => '서비스 약관',
			'meta.privacyPolicy' => '개인정보 보호정책',
			'meta.log' => '로그',
			'meta.coreLog' => '코어 로그',
			'meta.core' => '코어',
			'meta.help' => '도움말',
			'meta.tutorial' => '튜토리얼',
			'meta.board' => '보드',
			'meta.boardOnline' => '온라인 보드 사용',
			'meta.boardOnlineUrl' => '온라인 보드 URL',
			'meta.boardLocalPort' => '로컬 보드 포트',
			'meta.disableFontScaler' => '글꼴 크기 조정 비활성화 (재시작 후 적용)',
			'meta.autoOrientation' => '화면 방향에 따라 회전',
			'meta.restartTakesEffect' => '재시작 후 적용',
			'meta.reconnectTakesEffect' => '다시 연결 후 적용',
			'meta.runtimeProfile' => '런타임 프로필',
			'meta.willCompleteAfterRebootInstall' => '시스템 확장 설치를 완료하려면 장치를 재시작하십시오',
			'meta.willCompleteAfterRebootUninstall' => '시스템 확장 제거를 완료하려면 장치를 재시작하십시오',
			'meta.requestNeedsUserApproval' => '1. [시스템 설정]-[개인정보 보호 및 보안]에서 Ski의 시스템 확장 설치를 [허용]하십시오\n2. [시스템 설정]-[일반]-[로그인 항목 및 확장 프로그램]-[네트워크 확장 프로그램]에서 [skiServiceSE]를 활성화하십시오\n완료 후 다시 연결하십시오',
			'meta.FullDiskAccessPermissionRequired' => '[시스템 설정]-[개인정보 보호 및 보안]-[전체 디스크 액세스]에서 skiServiceSE 권한을 활성화하고 다시 연결하십시오.',
			'meta.proxy' => '프록시',
			'meta.theme' => '테마',
			'meta.tvMode' => 'TV 모드',
			'meta.autoUpdate' => '자동 업데이트',
			'meta.updateChannel' => '자동 업데이트 채널',
			'meta.hasNewVersion' => ({required Object p}) => '버전 ${p}로 업데이트',
			'meta.autoDownloadPkg' => '업데이트 패키지 자동 다운로드',
			'meta.devOptions' => '개발자 옵션',
			'meta.about' => '정보',
			'meta.name' => '이름',
			'meta.logout' => '로그아웃',
			'meta.version' => '버전',
			'meta.notice' => '공지사항',
			'meta.sort' => '정렬',
			'meta.recommended' => '추천',
			'meta.innerError' => ({required Object p}) => '내부 오류: ${p}',
			'meta.server' => '서버',
			'meta.setting' => '설정',
			'meta.settingCore' => '코어 설정',
			'meta.settingApp' => '앱 설정',
			'meta.deviceNoSpace' => '디스크 공간 부족',
			'meta.hideSystemApp' => '시스템 앱 숨기기',
			'meta.hideAppIcon' => '앱 아이콘 숨기기',
			'meta.openDir' => '파일 디렉토리 열기',
			'meta.uwpExemption' => 'UWP 네트워크 격리 면제',
			'permission.appQuery' => '애플리케이션 목록 가져오기',
			'permission.request' => ({required Object p}) => '[${p}] 권한 켜기',
			'permission.requestNeed' => ({required Object p}) => '[${p}] 권한을 켜주십시오',
			'tun.stack' => '네트워크 스택',
			'tun.inet4Address' => 'IPv4 주소 범위',
			'tun.inet6Address' => 'IPv6 주소 범위',
			'tun.dnsHijack' => 'DNS 하이제킹',
			'tun.strictRoute' => '엄격한 경로',
			'tun.icmpForward' => 'ICMP 전달',
			'tun.allowBypass' => '앱이 VPN을 우회하도록 허용',
			'tun.appendHttpProxy' => 'VPN에 HTTP 프록시 추가',
			'tun.bypassHttpProxyDomain' => 'HTTP 프록시를 우회하도록 허용된 도메인',
			'edgeRuntimeNotInstalled' => '현재 장치에 Edge WebView2 런타임이 설치되어 있지 않아 페이지를 표시할 수 없습니다. Edge WebView2 런타임(x64)을 다운로드하여 설치하고 앱을 다시 시작한 후 다시 시도하십시오。',
			'homeScreen.traffic' => '트래픽:',
			'homeScreen.speed' => '속도:',
			'homeScreen.autoSelect' => '자동 선택',
			'homeScreen.loadBalance' => '로드 밸런스',
			'homeScreen.serviceCenter' => '서비스 센터',
			'homeScreen.onlineSupport' => '온라인 지원',
			'homeScreen.subscriptionChannel' => '구독 채널',
			'homeScreen.buyPlan' => '요금제 구매',
			'loginScreen.login' => '로그인',
			'loginScreen.register' => '계정 가입',
			'loginScreen.forgotPassword' => '비밀번호 찾기',
			'loginScreen.provider' => '서비스 제공자',
			'loginScreen.providerName' => '${_root.loginScreen.provider} 이름',
			'loginScreen.providerNameRequired' => '${_root.loginScreen.provider} 이름을 입력하세요',
			'loginScreen.account' => '계정',
			'loginScreen.accountRequired' => '계정을 입력하세요',
			'loginScreen.email' => '이메일',
			'loginScreen.emailRequired' => '이메일 주소를 입력하세요',
			'loginScreen.password' => '비밀번호',
			'loginScreen.passwordRequired' => '비밀번호를 입력하세요',
			'loginScreen.validEmailRequired' => '유효한 이메일 주소를 입력하세요',
			'loginScreen.passwordMinLength' => ({required Object minLength}) => '비밀번호 길이는 최소 ${minLength}자 이상이어야 합니다',
			'loginScreen.unsupportedProvider' => '지원되지 않는 ${_root.loginScreen.provider}',
			'loginScreen.unsupportedProviderType' => '지원되지 않는 ${_root.loginScreen.provider} 유형',
			'planWidget.used' => '사용됨',
			'planWidget.totalTraffic' => '총 트래픽',
			'planWidget.expirationTime' => '만료 시간',
			'planWidget.remainingTime' => '남은 시간',
			'xboardRegisterScreen.register' => '가입',
			'xboardRegisterScreen.email' => '이메일',
			'xboardRegisterScreen.emailVerificationCode' => '이메일 인증 코드',
			'xboardRegisterScreen.send' => '전송',
			'xboardRegisterScreen.password' => '비밀번호',
			'xboardRegisterScreen.confirmPassword' => '비밀번호 확인',
			'xboardRegisterScreen.verificationCode' => '인증 코드',
			'xboardRegisterScreen.invitationCode' => '초대 코드',
			'xboardRegisterScreen.emailSentNotice' => '인증 코드가 이메일로 전송되었습니다',
			'xboardRegisterScreen.registerSuccess' => '가입에 성공했습니다',
			'xboardRegisterScreen.invalidEmail' => '유효한 이메일 주소를 입력하세요',
			'xboardRegisterScreen.passwordRequired' => '비밀번호를 입력하세요',
			'xboardRegisterScreen.passwordMinLength' => ({required Object minLength}) => '비밀번호 길이는 최소 ${minLength}자 이상이어야 합니다',
			'xboardRegisterScreen.confirmPasswordRequired' => '비밀번호를 다시 입력하세요',
			'xboardRegisterScreen.passwordMismatch' => '두 번 입력한 비밀번호가 일치하지 않습니다',
			'xboardRegisterScreen.emailCodeRequired' => '이메일 인증 코드를 입력하세요',
			'xboardRegisterScreen.emailCodeLength' => ({required Object codeLength}) => '이메일 인증 코드는 ${codeLength}자이어야 합니다',
			'xboardRegisterScreen.verificationCodeRequired' => '인증 코드를 입력하세요',
			'xboardRegisterScreen.verificationCodeLength' => '인증 코드 길이 오류',
			'xboardRegisterScreen.userAgreement' => '이용 약관',
			'xboardRegisterScreen.pleaseCheck' => '체크해 주세요',
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
