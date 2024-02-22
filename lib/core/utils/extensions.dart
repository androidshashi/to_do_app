import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  void to({required Widget screen}) {
    Navigator.push(
        this,
        MaterialPageRoute(
          builder: (context) => screen,
        ));
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
