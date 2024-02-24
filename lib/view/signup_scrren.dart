import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/core/constants/app_strings.dart';
import 'package:to_do_app/core/utils/extensions/extensions.dart';
import 'package:to_do_app/core/utils/extensions/theme_extensions.dart';
import 'package:to_do_app/view/common_widgets/custom_button.dart';
import 'package:to_do_app/view/login_screen.dart';
import 'package:to_do_app/viewmodel/login_viewmodel.dart';
import 'package:to_do_app/viewmodel/sighup_viewmodel.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(50.w),
        child: Consumer<SignupViewModel>(
          builder: (context, viewModel, child) {
            return Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    AppStrings.signup,
                    style: context.mainHeadingTextStyle,
                  ),
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
                    obscureText: viewModel.passwordVisibility,
                    decoration: InputDecoration(
                        labelText: 'Password',
                        border: const OutlineInputBorder(),
                        suffixIcon: InkWell(
                          onTap: () => viewModel.togglePasswordVisibility(),
                          child: Icon(viewModel.passwordVisibility
                              ? Icons.visibility
                              : Icons.visibility_off),
                        )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.h),
                  TextFormField(
                    controller: viewModel.confirmPasswordController,
                    obscureText: viewModel.confirmPasswordVisibility,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: const OutlineInputBorder(),
                      suffixIcon: InkWell(
                        onTap: () =>
                            viewModel.toggleConfirmPasswordVisibility(),
                        child: Icon(viewModel.confirmPasswordVisibility
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter confirm password';
                      }

                      if (value != viewModel.passwordController.text.trim()) {
                        return 'Please enter confirm password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.h),
                  CustomButton(
                    onTap: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        viewModel.createUserWithEmailAndPassword(context);
                      }
                    },
                    buttonText: AppStrings.signup,
                  ),
                  SizedBox(height: 5.h),
                  TextButton(
                    onPressed: () {
                      context.to(
                          screen: ChangeNotifierProvider(
                        create: (BuildContext context) => LoginViewModel(),
                        child: const LoginScreen(),
                      ));
                    },
                    child: Text(AppStrings.login),
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
