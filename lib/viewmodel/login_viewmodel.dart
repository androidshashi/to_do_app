// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/core/utils/common_utils.dart';
import 'package:to_do_app/core/utils/extensions/extensions.dart';
import 'package:to_do_app/core/utils/service_locator.dart';
import 'package:to_do_app/repository/auth_repo.dart';
import 'package:to_do_app/view/home_screen.dart';
import 'package:to_do_app/viewmodel/home_viewmodel.dart';

class LoginViewModel extends ChangeNotifier {
  final AuthRepo _repo = locator<AuthRepo>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool passwordVisibility = true;

  void togglePasswordVisibility() {
    passwordVisibility = !passwordVisibility;
    notifyListeners();
  }

  Future<void> signInWithEmailAndPassword(BuildContext context) async {
    context.loaderOverlay.show();
    final response = await _repo.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim());
    context.loaderOverlay.hide();
    response.fold((error) {
      showSnackBar(
        context,
        message: error,
      );
    }, (credentials) {
      // go to home screen
      context.to(screen: ChangeNotifierProvider(
        create: (BuildContext context) => HomeViewModel(),
        child: const HomeScreen(),
      ));
    });
  }
}
