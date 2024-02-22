import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Shows a snackbar
void showSnackBar(
    {required BuildContext context,
      required String content,
      required bool success}) {
  if (!context.mounted) return;
  final snackBar = SnackBar(
    content: Text(
      content,
      style: const TextStyle(color: Colors.white),
    ),
    backgroundColor: success ? Colors.green : Colors.red,
    duration: const Duration(seconds: 2),
  );

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

/// Hides soft keyboard
void hideKeyBoard() {
  FocusManager.instance.primaryFocus?.unfocus();
}
