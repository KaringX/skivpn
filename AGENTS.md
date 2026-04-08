# AGENTS.md

## 用途
- 本仓库是一个名为 `skivpn` 的 Flutter 应用。
- 本文件是工作于 `/opt/ski` 的智能编码代理默认操作指南。
- 当仓库约定与通用 Flutter 建议冲突时，以仓库现有约定为准。

## 仓库结构
- 主应用入口：`lib/main.dart`。
- 大部分应用逻辑位于 `lib/app/`。
- 大部分 UI 页面位于 `lib/screens/`。
- 国际化源文件位于 `lib/i18n/*.i18n.json`。
- 生成的国际化文件位于 `lib/i18n/strings*.g.dart`。
- 当前 JSON 序列化生成文件包含 `lib/app/clash/clash_config.g.dart`。
- Flutter 平台目录已存在：`android/`、`ios/`、`linux/`、`macos/`、`windows/`。

## 本地依赖设置
- `pubspec.yaml` 对 `libclash_vpn_service` 和 `board_service` 使用了路径依赖。
- 这些路径指向同级目录：`../libclash-vpn-service/` 和 `../board-service/`。
- 如果 `flutter pub get`、`flutter analyze` 或构建一开始就失败，先确认这两个兄弟仓库是否存在。
- 除非用户明确要求，否则不要把路径依赖改成托管版本。

## Agent 规则发现结果
- 未发现仓库级 Cursor 规则目录 `.cursor/rules/`。
- 未发现 `.cursorrules` 文件。
- 未发现 Copilot 规则文件 `.github/copilot-instructions.md`。
- 如果之后新增这些文件，应将其视为更高优先级的仓库指引。

## 核心命令
- 安装依赖：`flutter pub get`
- 静态分析：`flutter analyze`
- 格式化 Dart 文件：`dart format lib test`
- 运行全部测试：`flutter test`
- 运行单个测试文件：`flutter test test/path/to/file_test.dart`
- 按名称运行单个测试用例：`flutter test test/path/to/file_test.dart --plain-name "case name"`
- 使用机器可读输出运行测试：`flutter test --machine`
- 生成 JSON 序列化代码：`dart run build_runner build --delete-conflicting-outputs`
- 重新生成国际化文件：`dart run slang`
- 重新生成启动图标：`flutter pub run flutter_launcher_icons`

## 构建命令
- 调试运行移动端或桌面端：`flutter run`
- 构建 Android APK 发布包：`flutter build apk --release`
- 构建 Android App Bundle：`flutter build appbundle --release`
- 构建 macOS 发布版本：`flutter build macos --release`
- 构建 Windows 发布版本：`flutter build windows --release`
- 构建 Linux 发布版本：`flutter build linux --release`
- 构建 iOS 发布版本：`flutter build ios --release`
- 本仓库未将 Web 配置为一等目标，不要默认假设支持 Web。

## 打包辅助脚本
- 仓库中包含用于 Android 产物重命名的 Windows 批处理脚本：
- `pkg_android.bat`
- `pkg_android_aab.bat`
- `pkg_macos.txt` 中包含一条 macOS DMG 打包说明。
- 这些只是发布辅助脚本，不能替代 `flutter build`。

## 测试现状说明
- 在本次分析时，仓库中没有 `test/` 目录，也没有 `*_test.dart` 文件。
- 仍然保留上述测试命令，供后续新增测试时使用。
- 新增测试时，优先在 `test/` 下使用标准 Flutter 单元测试或组件测试。
- 修复 bug 时，在可行范围内补充或更新最小可测试单元。

## 标准代理工作流
- 如果依赖状态不明确，先运行 `flutter pub get`。
- 进行较大范围重构前先运行 `flutter analyze`。
- 修改代码后，对触达的 Dart 文件执行 `dart format`。
- 编辑完成后重新运行 `flutter analyze`。
- 如果改动涉及生成文件或其输入源，结束前重新生成相应产物。
- 如果新增了测试，先跑最小相关测试，再视情况扩大覆盖范围。

## 生成文件
- 不要手动修改 `lib/i18n/strings*.g.dart` 下的生成国际化文件。
- 应修改源 locale JSON，例如 `lib/i18n/en.i18n.json`。
- 使用 `dart run slang` 重新生成国际化输出。
- 对于注解生成的 `*.g.dart` 序列化文件，不要手工编辑。
- 应修改带注解的 Dart 模型，然后重新运行 `dart run build_runner build --delete-conflicting-outputs`。

## Lint 与分析器基线
- 分析器配置位于 `analysis_options.yaml`。
- 项目引入了 `package:flutter_lints/flutter.yaml`。
- 当前分析器覆盖忽略了以下规则：
- `empty_catches`
- `unnecessary_overrides`
- `unused_catch_stack`
- 某些文件还使用了针对性的 `ignore_for_file`，用于兼容遗留代码或模式驱动文件。
- 不要轻易新增忽略规则；可行时优先写出符合规范的代码。

## 导入规范
- 遵循现有分组风格：先 Dart SDK 导入，再 package 导入。
- 在 package 导入中，第三方包与应用内部包有时会混用；新增导入时保持整洁、稳定即可。
- 应用内部代码优先使用 package 导入，例如 `package:skivpn/...`。
- 仓库里存在少量相对导入；没有明确理由时不要顺手统一替换。
- 删除未使用导入。
- 保留主要导入分组之间的空行。

## 格式化规范
- 使用 `dart format`，不要手动对齐代码。
- 尾随逗号较常见，能改善格式时应保留。
- 多行构造函数调用、组件树和长参数列表应保持展开形式。
- 除非现有文件或翻译内容需要 Unicode，否则保持文件为 ASCII。
- 避免装饰性注释和横幅式注释块。

## 命名约定
- 文件名使用 `snake_case.dart`。
- 类、枚举、typedef、扩展使用 `PascalCase`。
- 方法、局部变量、参数、字段使用 `lowerCamelCase`。
- 私有成员使用前导下划线。
- 静态常量常用 `kName` 风格，例如 `kMenuConnect`。
- 某些领域模型会通过 `@JsonKey(name: ...)` 保留非 Dart 风格字段名。
- 外部协议名和序列化键名必须精确保留。

## 类型使用
- 对字段、公开 API 和不明显的局部变量优先使用显式类型。
- 当初始化表达式已能清楚体现类型时，可以使用 `var`。
- `late` 常用于生命周期中稍后初始化的状态对象；如果可用 nullable 或 final，更优先考虑它们。
- 不返回数据的异步方法使用 `Future<void>`。
- 本代码库大量使用可空类型；空值处理要写得明确。
- 除非互操作确有需要，否则避免引入 `dynamic`。

## 状态管理模式
- 可见的主要状态管理库是 `provider`。
- `lib/app/modules/` 下的全局管理器广泛采用静态服务单例模式。
- UI 状态通常位于 `State<T>` 中，并配套 `_init()`、`_onStateResumed()` 之类的辅助方法。
- 修改局部功能时，应匹配当前区域的架构，不要强行引入新模式。

## 错误处理
- 该代码库经常在集成边界捕获异常。
- 对服务层/工具层 API，优先返回 `ReturnResult<T>` 或 `ReturnResultError`，而不是沿调用栈直接抛出。
- 对重要运行失败，使用 `Log.i(...)` 或 `Log.w(...)` 记录。
- 仓库中确实存在静默捕获；但新增代码只有在失败确实可忽略时才应吞掉异常。
- 需要面向用户的错误时，应通过对话框、SnackBar 或返回错误对象进行暴露。
- 当周边 API 支持且有助于诊断时，保留 stack trace。

## 异步与生命周期
- 不要把异步启动逻辑放进 `build()`。
- 在组件中，于 `initState()` 初始化订阅/监听，并在 `dispose()` 中清理。
- `await` 之后使用 `BuildContext` 要谨慎；虽然现有部分文件压制了该 lint，但新代码应优先加 mounted 检查。
- 较长的异步流程应拆分为辅助方法，避免深层嵌套回调。
- 只有在确实需要首帧后立即行为时，才沿用现有的 `Future.delayed(..., () async { ... })` 模式。

## UI 与 Flutter 约定
- 优先复用现有辅助类和页面工具，例如 `DialogUtils`、`GroupHelper`、`WebviewHelper`。
- 导航方式应与现有代码保持一致：优先使用 `Navigator.push(...)`，并在可用时配合 route settings 辅助方法。
- 所有面向用户的可见文本应来自 `Translations.of(context)`，不要硬编码。
- 主题相关改动优先沿用 `lib/screens/themes.dart` 与 `theme_data_*.dart` 中的基础设施。
- 新增设置项 UI 时，遵循仓库现有的 group/item helper 模式。

## 国际化规则
- 任何新的用户可见字符串都应加入 locale JSON 源文件。
- locale key 命名应与当前嵌套结构保持一致。
- 修改 locale JSON 后，运行 `dart run slang`。
- 不要直接编辑生成的翻译类。
- 如果只更新了单一语言，请说明其余语言尚未同步，而不是擅自补翻。

## 数据与序列化约定
- `clash_config.dart` 中的模型强依赖 schema，并且有意保留线协议命名。
- 使用 `@JsonSerializable(explicitToJson: true)` 与 `@JsonKey(name: ...)` 时，应与邻近模型保持一致。
- 协议枚举和序列化字符串名称必须保持稳定。
- 不要仅因代码风格就重构这些模型；线协议兼容性比样式更重要。

## 避免事项
- 不要顺手格式化无关文件。
- 没有迁移理由时，不要重命名公开 JSON 字段、翻译 key 或协议常量。
- 除非生成工具不可用且用户明确要求，否则不要直接修改生成文件。
- 不要为局部改动引入另一套状态管理框架。
- 不要把 package 导入批量替换成相对导入作为纯清理操作。

## 结束前建议检查
- `dart format <touched files>`
- `flutter analyze`
- `flutter test` 或最小相关的 `flutter test <file>`
- 若修改了国际化输入，运行 `dart run slang`
- 若修改了带注解模型，运行 `dart run build_runner build --delete-conflicting-outputs`

## 给后续代理的说明
- 该仓库顶层文档很少，因此理解意图主要依赖源码检查。
- 优先做小而一致的改动，使其贴合周边代码，而不是做理想化重写。
- 当仓库约定不完全一致时，以最近邻的文件或子系统风格为准。
