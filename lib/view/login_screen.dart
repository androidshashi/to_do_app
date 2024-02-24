import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/core/utils/extensions/extensions.dart';
import 'package:to_do_app/core/utils/extensions/theme_extensions.dart';
import 'package:to_do_app/view/common_widgets/custom_button.dart';
import 'package:to_do_app/view/signup_scrren.dart';
import 'package:to_do_app/viewmodel/login_viewmodel.dart';
import 'package:to_do_app/viewmodel/sighup_viewmodel.dart';

import '../core/constants/app_strings.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(50.w),
        child: Consumer<LoginViewModel>(
          builder: (context, viewModel, child) {
            return Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(AppStrings.login, style: context.mainHeadingTextStyle,),
                  Gap(30.h),
                  TextFormField(
                    controller: viewModel.emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.h),

                  TextFormField(
                    controller: viewModel.passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.h),
                  CustomButton(
                    onTap: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        viewModel.signInWithEmailAndPassword(context);
                      }
                    },
                    buttonText: AppStrings.login,
                  ),
                  SizedBox(height: 5.h),
                  TextButton(
                    onPressed: () {
                      context.to(screen: ChangeNotifierProvider(
                        create: (BuildContext context) => SignupViewModel(),
                        child: const SignupScreen(),
                      ));
                    },
                    child: const Text(AppStrings.signup),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
