import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension RoutingExtension on BuildContext {

  void to({required Widget screen}) {
    Navigator.push(
        this,
        MaterialPageRoute(
          builder: (context) => screen,
        ));
  }

  void back() {
    Navigator.pop(this);
  }

  void offAll({required Widget screen}) {
    Navigator.pushAndRemoveUntil(
        this,
        MaterialPageRoute(
          builder: (context) => screen,
        ),
        (Route<dynamic> route) => false);
  }
}

extension CommonExt on BuildContext{
  /// Get color scheme
  ColorScheme get appColor => Theme.of(this).colorScheme;

  /// Get current height of the screen
  double get height => MediaQuery.of(this).size.height;

  /// Get current height of the screen
  double get width => MediaQuery.of(this).size.width;

  Decoration getContainerDecoration(
      {required Color backgroundColor, Color? borderColor}) {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
              color: borderColor ?? appColor.primary,
              blurRadius: 8,
              offset: const Offset(2, 2)),
        ]);
  }

}


