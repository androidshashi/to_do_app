import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/service_locator.dart';
import 'package:to_do_app/firebase_options.dart';
import 'package:to_do_app/view/my_application.dart';

Future<void> main() async {
  // Widgets initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Setup locator
  setupLocator();

  // Start app
  runApp(const MyApplication());
}
