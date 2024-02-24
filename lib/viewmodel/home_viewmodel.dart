// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/core/utils/common_utils.dart';
import 'package:to_do_app/core/utils/extensions/extensions.dart';
import 'package:to_do_app/core/utils/service_locator.dart';
import 'package:to_do_app/core/utils/shared_pref_utils.dart';
import 'package:to_do_app/repository/auth_repo.dart';
import 'package:to_do_app/view/home_screen.dart';
import 'package:to_do_app/view/login_screen.dart';
import 'package:to_do_app/viewmodel/login_viewmodel.dart';

class HomeViewModel extends ChangeNotifier {
  final AuthRepo _repo = locator<AuthRepo>();

  Future<void> logout(BuildContext context) async {
    context.loaderOverlay.show();
    final response = await _repo.logout();

    response.fold((error) {
      showSnackBar(
        context,
        message: error,
      );
    }, (credentials) async {
      // go to home screen
      context.loaderOverlay.hide();
      context.to(screen: ChangeNotifierProvider(
        create: (BuildContext context) => LoginViewModel(),
        child: const LoginScreen(),
      ));
    });
  }
}
