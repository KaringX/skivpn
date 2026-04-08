import 'package:skivpn/screens/theme_define.dart';
import 'package:flutter/material.dart';

class ThemeDataDark {
  static const Color mainColor = Color(0xFF303030);
  static const Color mainBgColor = Color(0xff121212);
  static ThemeData theme(BuildContext context) {
    final ColorScheme scheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFF293CA0),
      brightness: Brightness.dark,
      surface: mainBgColor,
    );
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      platform: TargetPlatform.iOS,
      scaffoldBackgroundColor: scheme.surface,
      cardTheme: CardThemeData(color: mainColor),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: mainBgColor.withValues(alpha: 0.5),
        filled: true,
        labelStyle: TextStyle(color: Colors.grey),
        floatingLabelStyle: TextStyle(color: ThemeDefine.kColorBlue),
        helperStyle: TextStyle(color: Colors.grey),
        hintStyle: TextStyle(color: Colors.grey),
        errorStyle: TextStyle(color: Colors.red),
        isDense: true,
        contentPadding: EdgeInsets.all(8),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(14)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(14)),
        ),
      ),
      listTileTheme: ListTileThemeData(dense: true),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith((
            Set<WidgetState> states,
          ) {
            if (states.contains(WidgetState.focused)) {
              return ThemeDefine.kColorBlue;
            }
            if (states.contains(WidgetState.selected)) {
              return ThemeDefine.kColorBlue;
            }
            return ThemeDefine.kColorBlue;
          }),
          foregroundColor: WidgetStateProperty.resolveWith((
            Set<WidgetState> states,
          ) {
            return Colors.black;
          }),
          shape: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
            return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            );
          }),
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
          return mainColor;
        }),
        checkColor: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
          return ThemeDefine.kColorGreenBright;
        }),
        overlayColor: WidgetStateProperty.resolveWith((
          Set<WidgetState> states,
        ) {
          return Colors.grey;
        }),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(strokeWidth: 2),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: Colors.black,
        contentTextStyle: TextStyle(color: Colors.white),
      ),
    );
  }
}
