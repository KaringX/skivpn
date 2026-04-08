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
class TranslationsRu with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsRu({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ru,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ru>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsRu _root = this; // ignore: unused_field

	@override 
	TranslationsRu $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsRu(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsLaunchFailedScreenRu LaunchFailedScreen = _TranslationsLaunchFailedScreenRu._(_root);
	@override late final _TranslationsPerAppAndroidScreenRu PerAppAndroidScreen = _TranslationsPerAppAndroidScreenRu._(_root);
	@override late final _TranslationsUserAgreementScreenRu UserAgreementScreen = _TranslationsUserAgreementScreenRu._(_root);
	@override late final _TranslationsVersionUpdateScreenRu VersionUpdateScreen = _TranslationsVersionUpdateScreenRu._(_root);
	@override late final _TranslationsMainRu main = _TranslationsMainRu._(_root);
	@override late final _TranslationsMetaRu meta = _TranslationsMetaRu._(_root);
	@override late final _TranslationsPermissionRu permission = _TranslationsPermissionRu._(_root);
	@override late final _TranslationsTunRu tun = _TranslationsTunRu._(_root);
	@override String get edgeRuntimeNotInstalled => 'Среда выполнения Edge WebView2 не установлена ​​на текущем устройстве, и страница не может быть отображена. Загрузите и установите среду выполнения Edge WebView2 (x64), перезапустите приложение и повторите попытку.';
	@override late final _TranslationsHomeScreenRu homeScreen = _TranslationsHomeScreenRu._(_root);
	@override late final _TranslationsLoginScreenRu loginScreen = _TranslationsLoginScreenRu._(_root);
	@override late final _TranslationsPlanWidgetRu planWidget = _TranslationsPlanWidgetRu._(_root);
	@override late final _TranslationsXboardRegisterScreenRu xboardRegisterScreen = _TranslationsXboardRegisterScreenRu._(_root);
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
class _TranslationsLaunchFailedScreenRu implements TranslationsLaunchFailedScreenEn {
	_TranslationsLaunchFailedScreenRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get invalidProcess => 'Не удалось запустить приложение [Неверное имя процесса], переустановите приложение в отдельную папку';
	@override String get invalidProfile => 'Не удалось запустить приложение [Не удалось получить доступ к профилю], переустановите приложение';
	@override String get invalidVersion => 'Не удалось запустить приложение [Неверная версия], переустановите приложение';
	@override String get systemVersionLow => 'Не удалось запустить приложение [Слишком низкая версия системы]';
	@override String get invalidInstallPath => 'Путь установки недействителен, переустановите его по допустимому пути';
}

// Path: PerAppAndroidScreen
class _TranslationsPerAppAndroidScreenRu implements TranslationsPerAppAndroidScreenEn {
	_TranslationsPerAppAndroidScreenRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Проксируемые приложения';
	@override String get whiteListMode => 'Режим белого списка';
	@override String get whiteListModeTip => 'Если включено: перенаправляются через прокси-сервер только те приложения, которые были отмечены. Если выключено: перенаправляются через прокси-сервер только те приложения, которые не были отмечены.';
}

// Path: UserAgreementScreen
class _TranslationsUserAgreementScreenRu implements TranslationsUserAgreementScreenEn {
	_TranslationsUserAgreementScreenRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get privacyFirst => 'Ваша конфиденциальность превыше всего';
	@override String get agreeAndContinue => 'Принять и продолжить';
}

// Path: VersionUpdateScreen
class _TranslationsVersionUpdateScreenRu implements TranslationsVersionUpdateScreenEn {
	_TranslationsVersionUpdateScreenRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String versionReady({required Object p}) => 'Новая версия [${p}] доступна';
	@override String get update => 'Перезапустить';
	@override String get cancel => 'Не сейчас';
}

// Path: main
class _TranslationsMainRu implements TranslationsMainEn {
	_TranslationsMainRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsMainTrayRu tray = _TranslationsMainTrayRu._(_root);
}

// Path: meta
class _TranslationsMetaRu implements TranslationsMetaEn {
	_TranslationsMetaRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get enable => 'Включить';
	@override String get disable => 'Запретить';
	@override String get open => 'Открыть';
	@override String get close => 'Закрыть';
	@override String get quit => 'Выйти';
	@override String get add => 'Добавить';
	@override String get byDefault => 'по умолчанию';
	@override String get more => 'Больше';
	@override String get tips => 'Инфо';
	@override String get copy => 'Скопировать';
	@override String get save => 'сохранять';
	@override String get ok => 'Ок';
	@override String get cancel => 'Закрыть';
	@override String get faq => 'Часто задаваемые вопросы (FAQ)';
	@override String get download => 'Скачать';
	@override String get loading => 'Загрузка...';
	@override String get days => 'дни';
	@override String get hours => 'часы';
	@override String get minutes => 'минуты';
	@override String get seconds => 'Второй';
	@override String get protocol => 'Протокол';
	@override String get search => 'Поиск';
	@override String get custom => 'Настроить самостоятельно';
	@override String get connect => 'Соединить';
	@override String get disconnect => 'Отключить';
	@override String get connected => 'Подключено';
	@override String get disconnected => 'Отключено';
	@override String get connecting => 'Подключение';
	@override String get connectTimeout => 'Таймаут при соединении';
	@override String get timeout => 'Тайм-аут';
	@override String get timeoutDuration => 'Длительность тайм-аута';
	@override String get latency => 'Задерживать';
	@override String get latencyTest => 'Обнаружение задержки';
	@override String get language => 'Язык';
	@override String get next => 'Дальше';
	@override String get done => 'Готово';
	@override String get apply => 'Применить';
	@override String get refresh => 'Обновить';
	@override String get retry => 'Хотите попробовать еще раз?';
	@override String get update => 'Обновить';
	@override String get none => 'Ничего не делать';
	@override String get reset => 'Перезагрузить';
	@override String get authentication => 'Авторизация';
	@override String get submit => 'Отправить';
	@override String get user => 'Пользователь';
	@override String get account => 'Аккаунт';
	@override String get password => 'Пароль';
	@override String get required => 'Необходимо';
	@override String get sudoPassword => 'Пароль sudo (требуется для режима TUN)';
	@override String get other => 'Другой';
	@override String get dns => 'DNS';
	@override String get url => 'URL';
	@override String get urlInvalid => 'Неверный URL';
	@override String get urlCannotEmpty => 'Ссылка не может быть пустой';
	@override String get launchAtStartup => 'Запуск при включении';
	@override String get launchAtStartupRunAsAdmin => 'Пожалуйста, перезапустите SkiVPN от имени администратора.';
	@override String get tunModeRunAsAdmin => 'Для режима TUN требуются права администратора. Перезапустите приложение от имени администратора';
	@override String get requireAdminPrivilegeAtStartup => 'Перезапустите приложение от имени администратора (Для режима TUN требуются права администратора)';
	@override String get portableMode => 'Портативный режим';
	@override String get portableModeDisableTips => 'Если вам нужно выйти из портативного режима, выйдите из [skivpn] и вручную удалите папку [portable] в том же каталоге, что и [ski.exe]';
	@override String get systemProxy => 'Системный прокси';
	@override String get autoConnectAfterLaunch => 'Автоматическое подключение после запуска';
	@override String get autoConnectAtBoot => 'Автоматическое подключение после запуска системы';
	@override String get autoConnectAtBootTips => 'Требуется поддержка системы; некоторые системы также могут потребовать включения [автозапуска].';
	@override String get hideAfterLaunch => 'Скрыть окно после запуска';
	@override String get autoSetSystemProxy => 'Установить системный прокси после подключения';
	@override String get bypassSystemProxy => 'Доменные имена, которым разрешено обходить системный прокси-сервер';
	@override String get excludeFromRecent => 'Скрыть из недавних задач';
	@override String get wakeLock => 'Блокировка пробуждения';
	@override String get hideVpn => 'Скрыть значок VPN';
	@override String get hideVpnTips => 'Включение IPv6 приведет к сбою этой функции.';
	@override String get hideDockIcon => 'Скрыть значок дока';
	@override String get website => 'Веб-сайт';
	@override String get termOfUse => 'Условия использования';
	@override String get privacyPolicy => 'Политика конфиденциальности';
	@override String get log => 'Журнал';
	@override String get coreLog => 'Журнал ядра';
	@override String get core => 'Ядро';
	@override String get help => 'Помощь';
	@override String get tutorial => 'Руководство';
	@override String get board => 'Панель';
	@override String get boardOnline => 'Использование онлайн-панели';
	@override String get boardOnlineUrl => 'URL-адрес онлайн-панели';
	@override String get boardLocalPort => 'Порт локальной панели';
	@override String get disableFontScaler => 'Отключить масштабирование шрифта';
	@override String get autoOrientation => 'Следовать за поворотом экрана';
	@override String get restartTakesEffect => 'Требуется перезапуск';
	@override String get reconnectTakesEffect => 'Изменения вступят в силу после повторного подключения.';
	@override String get runtimeProfile => 'Конфигурация времени выполнения';
	@override String get willCompleteAfterRebootInstall => 'Пожалуйста, перезагрузите устройство, чтобы завершить установку расширения системы.';
	@override String get willCompleteAfterRebootUninstall => 'Пожалуйста, перезагрузите устройство, чтобы завершить удаление системного расширения.';
	@override String get requestNeedsUserApproval => '1. Пожалуйста, [разрешите] SkiVPN устанавливать системные расширения в [Системные настройки] - [Конфиденциальность и безопасность]. 2. : [Системные настройки] - [Основные] - [Элементы входа и расширения - Сетевые расширения] Включите [skiServiceSE]. После завершения подключитесь снова.';
	@override String get FullDiskAccessPermissionRequired => 'Включите разрешение skiServiceSE в [Системные настройки]-[Конфиденциальность и безопасность]-[Полный доступ к диску] и переподключитесь.';
	@override String get proxy => 'Прокси';
	@override String get theme => 'Тема';
	@override String get tvMode => 'Режим ТВ';
	@override String get autoUpdate => 'Автоматические обновления';
	@override String get updateChannel => 'Канал автоматического обновления';
	@override String hasNewVersion({required Object p}) => 'Обновить версию ${p}';
	@override String get autoDownloadPkg => 'Автоматически загружать пакеты обновлений';
	@override String get devOptions => 'Параметры разработчика';
	@override String get about => 'О приложении';
	@override String get name => 'Название';
	@override String get logout => 'Выйти';
	@override String get version => 'Версия';
	@override String get notice => 'Уведомления';
	@override String get sort => 'Отсортировать';
	@override String get recommended => 'Рекомендуемые';
	@override String innerError({required Object p}) => 'Внутренняя ошибка:${p}';
	@override String get server => 'Сервер';
	@override String get setting => 'Настройки';
	@override String get settingCore => 'Настройки ядра';
	@override String get settingApp => 'Настройки приложения';
	@override String get deviceNoSpace => 'Недостаточно места на диске';
	@override String get hideSystemApp => 'Скрыть системные приложения';
	@override String get hideAppIcon => 'Скрыть значок приложения';
	@override String get openDir => 'Открыть каталог файлов';
	@override String get uwpExemption => 'Исключение из изоляции сети UWP';
}

// Path: permission
class _TranslationsPermissionRu implements TranslationsPermissionEn {
	_TranslationsPermissionRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get appQuery => 'Получить список приложений';
	@override String request({required Object p}) => 'Включить разрешения [${p}]';
	@override String requestNeed({required Object p}) => 'Пожалуйста, включите разрешение [${p}]';
}

// Path: tun
class _TranslationsTunRu implements TranslationsTunEn {
	_TranslationsTunRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get stack => 'Сетевой стек';
	@override String get inet4Address => 'Диапазон IPv4-адресов';
	@override String get inet6Address => 'Диапазон IPv6-адресов';
	@override String get dnsHijack => 'Перехват DNS';
	@override String get strictRoute => 'Строгая маршрутизация';
	@override String get icmpForward => 'Пересылка ICMP';
	@override String get allowBypass => 'Разрешить приложениям обходить VPN';
	@override String get appendHttpProxy => 'Подключите HTTP-прокси к VPN';
	@override String get bypassHttpProxyDomain => 'Домены, которым разрешено обходить HTTP-прокси';
}

// Path: homeScreen
class _TranslationsHomeScreenRu implements TranslationsHomeScreenEn {
	_TranslationsHomeScreenRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get traffic => 'Трафик:';
	@override String get speed => 'Скорость:';
	@override String get autoSelect => 'Автовыбор';
	@override String get loadBalance => 'Балансировка нагрузки';
	@override String get serviceCenter => 'Сервисный центр';
	@override String get onlineSupport => 'Онлайн поддержка';
	@override String get subscriptionChannel => 'Канал подписки';
	@override String get buyPlan => 'Купить план';
}

// Path: loginScreen
class _TranslationsLoginScreenRu implements TranslationsLoginScreenEn {
	_TranslationsLoginScreenRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get login => 'Вход';
	@override String get register => 'Зарегистрировать аккаунт';
	@override String get forgotPassword => 'Забыли пароль';
	@override String get provider => 'Провайдер';
	@override String get providerName => 'Название ${_root.loginScreen.provider}';
	@override String get providerNameRequired => 'Пожалуйста, введите название ${_root.loginScreen.provider}';
	@override String get account => 'Аккаунт';
	@override String get accountRequired => 'Пожалуйста, введите аккаунт';
	@override String get email => 'Электронная почта';
	@override String get emailRequired => 'Пожалуйста, введите адрес электронной почты';
	@override String get password => 'Пароль';
	@override String get passwordRequired => 'Пожалуйста, введите пароль';
	@override String get validEmailRequired => 'Пожалуйста, введите действительный адрес электронной почты';
	@override String passwordMinLength({required Object minLength}) => 'Длина пароля должна быть не менее ${minLength} символов';
	@override String get unsupportedProvider => 'Неподдерживаемый ${_root.loginScreen.provider}';
	@override String get unsupportedProviderType => 'Неподдерживаемый тип ${_root.loginScreen.provider}';
}

// Path: planWidget
class _TranslationsPlanWidgetRu implements TranslationsPlanWidgetEn {
	_TranslationsPlanWidgetRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get used => 'Использованный';
	@override String get totalTraffic => 'Общий трафик';
	@override String get expirationTime => 'Время истечения';
	@override String get remainingTime => 'Оставшееся время';
}

// Path: xboardRegisterScreen
class _TranslationsXboardRegisterScreenRu implements TranslationsXboardRegisterScreenEn {
	_TranslationsXboardRegisterScreenRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get register => 'Регистрация';
	@override String get email => 'Электронная почта';
	@override String get emailVerificationCode => 'Код подтверждения электронной почты';
	@override String get send => 'Отправить';
	@override String get password => 'Пароль';
	@override String get confirmPassword => 'Подтвердить пароль';
	@override String get verificationCode => 'Код подтверждения';
	@override String get invitationCode => 'Код приглашения';
	@override String get emailSentNotice => 'Код подтверждения отправлен на вашу электронную почту';
	@override String get registerSuccess => 'Регистрация успешна';
	@override String get invalidEmail => 'Пожалуйста, введите действительный адрес электронной почты';
	@override String get passwordRequired => 'Пожалуйста, введите пароль';
	@override String passwordMinLength({required Object minLength}) => 'Длина пароля должна быть не менее ${minLength} символов';
	@override String get confirmPasswordRequired => 'Пожалуйста, введите пароль еще раз';
	@override String get passwordMismatch => 'Введенные пароли не совпадают';
	@override String get emailCodeRequired => 'Пожалуйста, введите код подтверждения электронной почты';
	@override String emailCodeLength({required Object codeLength}) => 'Код подтверждения электронной почты должен быть ${codeLength} цифрами';
	@override String get verificationCodeRequired => 'Пожалуйста, введите код подтверждения';
	@override String get verificationCodeLength => 'Ошибка длины кода подтверждения';
	@override String get userAgreement => 'Пользовательское соглашение';
	@override String get pleaseCheck => 'Пожалуйста, отметьте';
}

// Path: main.tray
class _TranslationsMainTrayRu implements TranslationsMainTrayEn {
	_TranslationsMainTrayRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get menuOpen => 'Открыть';
	@override String get menuExit => 'Выйти';
}

/// The flat map containing all translations for locale <ru>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsRu {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'LaunchFailedScreen.invalidProcess' => 'Не удалось запустить приложение [Неверное имя процесса], переустановите приложение в отдельную папку',
			'LaunchFailedScreen.invalidProfile' => 'Не удалось запустить приложение [Не удалось получить доступ к профилю], переустановите приложение',
			'LaunchFailedScreen.invalidVersion' => 'Не удалось запустить приложение [Неверная версия], переустановите приложение',
			'LaunchFailedScreen.systemVersionLow' => 'Не удалось запустить приложение [Слишком низкая версия системы]',
			'LaunchFailedScreen.invalidInstallPath' => 'Путь установки недействителен, переустановите его по допустимому пути',
			'PerAppAndroidScreen.title' => 'Проксируемые приложения',
			'PerAppAndroidScreen.whiteListMode' => 'Режим белого списка',
			'PerAppAndroidScreen.whiteListModeTip' => 'Если включено: перенаправляются через прокси-сервер только те приложения, которые были отмечены. Если выключено: перенаправляются через прокси-сервер только те приложения, которые не были отмечены.',
			'UserAgreementScreen.privacyFirst' => 'Ваша конфиденциальность превыше всего',
			'UserAgreementScreen.agreeAndContinue' => 'Принять и продолжить',
			'VersionUpdateScreen.versionReady' => ({required Object p}) => 'Новая версия [${p}] доступна',
			'VersionUpdateScreen.update' => 'Перезапустить',
			'VersionUpdateScreen.cancel' => 'Не сейчас',
			'main.tray.menuOpen' => 'Открыть',
			'main.tray.menuExit' => 'Выйти',
			'meta.enable' => 'Включить',
			'meta.disable' => 'Запретить',
			'meta.open' => 'Открыть',
			'meta.close' => 'Закрыть',
			'meta.quit' => 'Выйти',
			'meta.add' => 'Добавить',
			'meta.byDefault' => 'по умолчанию',
			'meta.more' => 'Больше',
			'meta.tips' => 'Инфо',
			'meta.copy' => 'Скопировать',
			'meta.save' => 'сохранять',
			'meta.ok' => 'Ок',
			'meta.cancel' => 'Закрыть',
			'meta.faq' => 'Часто задаваемые вопросы (FAQ)',
			'meta.download' => 'Скачать',
			'meta.loading' => 'Загрузка...',
			'meta.days' => 'дни',
			'meta.hours' => 'часы',
			'meta.minutes' => 'минуты',
			'meta.seconds' => 'Второй',
			'meta.protocol' => 'Протокол',
			'meta.search' => 'Поиск',
			'meta.custom' => 'Настроить самостоятельно',
			'meta.connect' => 'Соединить',
			'meta.disconnect' => 'Отключить',
			'meta.connected' => 'Подключено',
			'meta.disconnected' => 'Отключено',
			'meta.connecting' => 'Подключение',
			'meta.connectTimeout' => 'Таймаут при соединении',
			'meta.timeout' => 'Тайм-аут',
			'meta.timeoutDuration' => 'Длительность тайм-аута',
			'meta.latency' => 'Задерживать',
			'meta.latencyTest' => 'Обнаружение задержки',
			'meta.language' => 'Язык',
			'meta.next' => 'Дальше',
			'meta.done' => 'Готово',
			'meta.apply' => 'Применить',
			'meta.refresh' => 'Обновить',
			'meta.retry' => 'Хотите попробовать еще раз?',
			'meta.update' => 'Обновить',
			'meta.none' => 'Ничего не делать',
			'meta.reset' => 'Перезагрузить',
			'meta.authentication' => 'Авторизация',
			'meta.submit' => 'Отправить',
			'meta.user' => 'Пользователь',
			'meta.account' => 'Аккаунт',
			'meta.password' => 'Пароль',
			'meta.required' => 'Необходимо',
			'meta.sudoPassword' => 'Пароль sudo (требуется для режима TUN)',
			'meta.other' => 'Другой',
			'meta.dns' => 'DNS',
			'meta.url' => 'URL',
			'meta.urlInvalid' => 'Неверный URL',
			'meta.urlCannotEmpty' => 'Ссылка не может быть пустой',
			'meta.launchAtStartup' => 'Запуск при включении',
			'meta.launchAtStartupRunAsAdmin' => 'Пожалуйста, перезапустите SkiVPN от имени администратора.',
			'meta.tunModeRunAsAdmin' => 'Для режима TUN требуются права администратора. Перезапустите приложение от имени администратора',
			'meta.requireAdminPrivilegeAtStartup' => 'Перезапустите приложение от имени администратора (Для режима TUN требуются права администратора)',
			'meta.portableMode' => 'Портативный режим',
			'meta.portableModeDisableTips' => 'Если вам нужно выйти из портативного режима, выйдите из [skivpn] и вручную удалите папку [portable] в том же каталоге, что и [ski.exe]',
			'meta.systemProxy' => 'Системный прокси',
			'meta.autoConnectAfterLaunch' => 'Автоматическое подключение после запуска',
			'meta.autoConnectAtBoot' => 'Автоматическое подключение после запуска системы',
			'meta.autoConnectAtBootTips' => 'Требуется поддержка системы; некоторые системы также могут потребовать включения [автозапуска].',
			'meta.hideAfterLaunch' => 'Скрыть окно после запуска',
			'meta.autoSetSystemProxy' => 'Установить системный прокси после подключения',
			'meta.bypassSystemProxy' => 'Доменные имена, которым разрешено обходить системный прокси-сервер',
			'meta.excludeFromRecent' => 'Скрыть из недавних задач',
			'meta.wakeLock' => 'Блокировка пробуждения',
			'meta.hideVpn' => 'Скрыть значок VPN',
			'meta.hideVpnTips' => 'Включение IPv6 приведет к сбою этой функции.',
			'meta.hideDockIcon' => 'Скрыть значок дока',
			'meta.website' => 'Веб-сайт',
			'meta.termOfUse' => 'Условия использования',
			'meta.privacyPolicy' => 'Политика конфиденциальности',
			'meta.log' => 'Журнал',
			'meta.coreLog' => 'Журнал ядра',
			'meta.core' => 'Ядро',
			'meta.help' => 'Помощь',
			'meta.tutorial' => 'Руководство',
			'meta.board' => 'Панель',
			'meta.boardOnline' => 'Использование онлайн-панели',
			'meta.boardOnlineUrl' => 'URL-адрес онлайн-панели',
			'meta.boardLocalPort' => 'Порт локальной панели',
			'meta.disableFontScaler' => 'Отключить масштабирование шрифта',
			'meta.autoOrientation' => 'Следовать за поворотом экрана',
			'meta.restartTakesEffect' => 'Требуется перезапуск',
			'meta.reconnectTakesEffect' => 'Изменения вступят в силу после повторного подключения.',
			'meta.runtimeProfile' => 'Конфигурация времени выполнения',
			'meta.willCompleteAfterRebootInstall' => 'Пожалуйста, перезагрузите устройство, чтобы завершить установку расширения системы.',
			'meta.willCompleteAfterRebootUninstall' => 'Пожалуйста, перезагрузите устройство, чтобы завершить удаление системного расширения.',
			'meta.requestNeedsUserApproval' => '1. Пожалуйста, [разрешите] SkiVPN устанавливать системные расширения в [Системные настройки] - [Конфиденциальность и безопасность]. 2. : [Системные настройки] - [Основные] - [Элементы входа и расширения - Сетевые расширения] Включите [skiServiceSE]. После завершения подключитесь снова.',
			'meta.FullDiskAccessPermissionRequired' => 'Включите разрешение skiServiceSE в [Системные настройки]-[Конфиденциальность и безопасность]-[Полный доступ к диску] и переподключитесь.',
			'meta.proxy' => 'Прокси',
			'meta.theme' => 'Тема',
			'meta.tvMode' => 'Режим ТВ',
			'meta.autoUpdate' => 'Автоматические обновления',
			'meta.updateChannel' => 'Канал автоматического обновления',
			'meta.hasNewVersion' => ({required Object p}) => 'Обновить версию ${p}',
			'meta.autoDownloadPkg' => 'Автоматически загружать пакеты обновлений',
			'meta.devOptions' => 'Параметры разработчика',
			'meta.about' => 'О приложении',
			'meta.name' => 'Название',
			'meta.logout' => 'Выйти',
			'meta.version' => 'Версия',
			'meta.notice' => 'Уведомления',
			'meta.sort' => 'Отсортировать',
			'meta.recommended' => 'Рекомендуемые',
			'meta.innerError' => ({required Object p}) => 'Внутренняя ошибка:${p}',
			'meta.server' => 'Сервер',
			'meta.setting' => 'Настройки',
			'meta.settingCore' => 'Настройки ядра',
			'meta.settingApp' => 'Настройки приложения',
			'meta.deviceNoSpace' => 'Недостаточно места на диске',
			'meta.hideSystemApp' => 'Скрыть системные приложения',
			'meta.hideAppIcon' => 'Скрыть значок приложения',
			'meta.openDir' => 'Открыть каталог файлов',
			'meta.uwpExemption' => 'Исключение из изоляции сети UWP',
			'permission.appQuery' => 'Получить список приложений',
			'permission.request' => ({required Object p}) => 'Включить разрешения [${p}]',
			'permission.requestNeed' => ({required Object p}) => 'Пожалуйста, включите разрешение [${p}]',
			'tun.stack' => 'Сетевой стек',
			'tun.inet4Address' => 'Диапазон IPv4-адресов',
			'tun.inet6Address' => 'Диапазон IPv6-адресов',
			'tun.dnsHijack' => 'Перехват DNS',
			'tun.strictRoute' => 'Строгая маршрутизация',
			'tun.icmpForward' => 'Пересылка ICMP',
			'tun.allowBypass' => 'Разрешить приложениям обходить VPN',
			'tun.appendHttpProxy' => 'Подключите HTTP-прокси к VPN',
			'tun.bypassHttpProxyDomain' => 'Домены, которым разрешено обходить HTTP-прокси',
			'edgeRuntimeNotInstalled' => 'Среда выполнения Edge WebView2 не установлена ​​на текущем устройстве, и страница не может быть отображена. Загрузите и установите среду выполнения Edge WebView2 (x64), перезапустите приложение и повторите попытку.',
			'homeScreen.traffic' => 'Трафик:',
			'homeScreen.speed' => 'Скорость:',
			'homeScreen.autoSelect' => 'Автовыбор',
			'homeScreen.loadBalance' => 'Балансировка нагрузки',
			'homeScreen.serviceCenter' => 'Сервисный центр',
			'homeScreen.onlineSupport' => 'Онлайн поддержка',
			'homeScreen.subscriptionChannel' => 'Канал подписки',
			'homeScreen.buyPlan' => 'Купить план',
			'loginScreen.login' => 'Вход',
			'loginScreen.register' => 'Зарегистрировать аккаунт',
			'loginScreen.forgotPassword' => 'Забыли пароль',
			'loginScreen.provider' => 'Провайдер',
			'loginScreen.providerName' => 'Название ${_root.loginScreen.provider}',
			'loginScreen.providerNameRequired' => 'Пожалуйста, введите название ${_root.loginScreen.provider}',
			'loginScreen.account' => 'Аккаунт',
			'loginScreen.accountRequired' => 'Пожалуйста, введите аккаунт',
			'loginScreen.email' => 'Электронная почта',
			'loginScreen.emailRequired' => 'Пожалуйста, введите адрес электронной почты',
			'loginScreen.password' => 'Пароль',
			'loginScreen.passwordRequired' => 'Пожалуйста, введите пароль',
			'loginScreen.validEmailRequired' => 'Пожалуйста, введите действительный адрес электронной почты',
			'loginScreen.passwordMinLength' => ({required Object minLength}) => 'Длина пароля должна быть не менее ${minLength} символов',
			'loginScreen.unsupportedProvider' => 'Неподдерживаемый ${_root.loginScreen.provider}',
			'loginScreen.unsupportedProviderType' => 'Неподдерживаемый тип ${_root.loginScreen.provider}',
			'planWidget.used' => 'Использованный',
			'planWidget.totalTraffic' => 'Общий трафик',
			'planWidget.expirationTime' => 'Время истечения',
			'planWidget.remainingTime' => 'Оставшееся время',
			'xboardRegisterScreen.register' => 'Регистрация',
			'xboardRegisterScreen.email' => 'Электронная почта',
			'xboardRegisterScreen.emailVerificationCode' => 'Код подтверждения электронной почты',
			'xboardRegisterScreen.send' => 'Отправить',
			'xboardRegisterScreen.password' => 'Пароль',
			'xboardRegisterScreen.confirmPassword' => 'Подтвердить пароль',
			'xboardRegisterScreen.verificationCode' => 'Код подтверждения',
			'xboardRegisterScreen.invitationCode' => 'Код приглашения',
			'xboardRegisterScreen.emailSentNotice' => 'Код подтверждения отправлен на вашу электронную почту',
			'xboardRegisterScreen.registerSuccess' => 'Регистрация успешна',
			'xboardRegisterScreen.invalidEmail' => 'Пожалуйста, введите действительный адрес электронной почты',
			'xboardRegisterScreen.passwordRequired' => 'Пожалуйста, введите пароль',
			'xboardRegisterScreen.passwordMinLength' => ({required Object minLength}) => 'Длина пароля должна быть не менее ${minLength} символов',
			'xboardRegisterScreen.confirmPasswordRequired' => 'Пожалуйста, введите пароль еще раз',
			'xboardRegisterScreen.passwordMismatch' => 'Введенные пароли не совпадают',
			'xboardRegisterScreen.emailCodeRequired' => 'Пожалуйста, введите код подтверждения электронной почты',
			'xboardRegisterScreen.emailCodeLength' => ({required Object codeLength}) => 'Код подтверждения электронной почты должен быть ${codeLength} цифрами',
			'xboardRegisterScreen.verificationCodeRequired' => 'Пожалуйста, введите код подтверждения',
			'xboardRegisterScreen.verificationCodeLength' => 'Ошибка длины кода подтверждения',
			'xboardRegisterScreen.userAgreement' => 'Пользовательское соглашение',
			'xboardRegisterScreen.pleaseCheck' => 'Пожалуйста, отметьте',
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
