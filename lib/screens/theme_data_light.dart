import 'package:skivpn/screens/theme_define.dart';
import 'package:flutter/material.dart';

class ThemeDataLight {
  static const Color mainColor = Colors.white;
  static const Color mainBgColor = Color(0xFFF0F0F0);
  static ThemeData theme(BuildContext context) {
    final ColorScheme scheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFF293CA0),
      brightness: Brightness.light,
      surface: mainBgColor,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      platform: TargetPlatform.iOS,
      scaffoldBackgroundColor: scheme.surface,
      cardTheme: const CardThemeData(color: Colors.white),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.white,
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: const Color(0xFFF6F7FB),
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
            return Colors.white;
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
          return Colors.white;
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
        backgroundColor: Colors.white,
        contentTextStyle: TextStyle(color: Colors.black),
      ),
    );
  }
}
