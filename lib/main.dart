import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/service_locator.dart';
import 'package:to_do_app/view/my_application.dart';

void main() {
  // Widgets initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Setup locator
  setupLocator();

  // Start app
  runApp( const MyApplication());
}
