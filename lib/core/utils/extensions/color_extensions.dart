import 'package:flutter/material.dart';

/// Color scheme extensions
extension ColorExt on ColorScheme {
  Color get blackColor =>
      brightness == Brightness.light ? Colors.black87 : Colors.white38;

  Color get greyColor400 =>
      brightness == Brightness.light ? Colors.grey.shade400 : Colors.white30;

  Color get greyColor200 =>
      brightness == Brightness.light ? Colors.grey.shade200 : Colors.white12;

  Color get lightBlackColor =>
      brightness == Brightness.light ? Colors.black26 : Colors.white30;

  Color get whiteColor =>
      brightness == Brightness.light ? Colors.white : Colors.black;

  Color get backgroundColor =>
      brightness == Brightness.dark ? const Color(0xFF0F0E17) : Colors.white;

  Color get transparent => Colors.transparent;

}