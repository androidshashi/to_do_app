import 'package:flutter/material.dart';

/// All the colors used in the app
class _AppColor {
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color orange = Color(0xFFFF8906);
  static const Color orangeDark = Color(0xFF572F02);
  static const Color purple = Color(0xFF380835);
  static const Color darkColor = Color(0xFF0F0E17);
  static const Color purpleDark = Color(0xFF150213);
}

class AppTheme {
  static ThemeData light(BuildContext context) {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      useMaterial3: true,
      colorScheme: const ColorScheme.light(
        primary: _AppColor.orange,
        onPrimary: _AppColor.white,
        secondary: _AppColor.purple,
        onSecondary: _AppColor.white,
        background: _AppColor.white,
        onBackground: _AppColor.black,
        outline: _AppColor.black,
        outlineVariant: Colors.black12,
      ),
    );
  }

  static ThemeData dark(BuildContext context) {
    //return light(context).copyWith(brightness: Brightness.dark);
    return ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      cardTheme: const CardTheme(color: Colors.white30),
      scaffoldBackgroundColor: Colors.white10,
      colorScheme: const ColorScheme.dark(
        primary: _AppColor.orangeDark,
        onPrimary: _AppColor.white,
        primaryContainer: _AppColor.darkColor,
        onPrimaryContainer: _AppColor.darkColor,
        secondary: _AppColor.purpleDark,
        onSecondary: _AppColor.white,
        secondaryContainer: Colors.white10,
        onSecondaryContainer: _AppColor.white,
        background: _AppColor.black,
        onBackground: _AppColor.white,
        outline: Colors.white12,
        outlineVariant: Colors.white12,
      ),
    );
  }
}

