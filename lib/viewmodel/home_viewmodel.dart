// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/common_utils.dart';
import 'package:to_do_app/core/utils/extensions/extensions.dart';
import 'package:to_do_app/core/utils/service_locator.dart';
import 'package:to_do_app/repository/auth_repo.dart';
import 'package:to_do_app/view/home_screen.dart';

class HomeViewModel extends ChangeNotifier {
  final AuthRepo _repo = locator<AuthRepo>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool passwordVisibility = true;
  bool confirmPasswordVisibility = true;

  void togglePasswordVisibility() {
    passwordVisibility = !passwordVisibility;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    confirmPasswordVisibility = !confirmPasswordVisibility;
    notifyListeners();
  }

  Future<void> createUserWithEmailAndPassword(BuildContext context) async {
    final response = await _repo.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim());

    response.fold((error) {
      showSnackBar(
        context,
        message: error,
      );
    }, (credentials) {
      // go to home screen
      context.to(screen: const HomeScreen());
    });
  }
}
