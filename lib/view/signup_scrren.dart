import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/core/constants/app_strings.dart';
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
    final viewModel = context.read<SignupViewModel>();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                controller: viewModel.emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value==null || value.isEmpty) {
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
                  if (value==null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.h),
              TextFormField(
                controller: viewModel.confirmPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value==null || value.isEmpty) {
                    return 'Please enter confirm password';
                  }

                  if (value!= viewModel.passwordController.text.trim()) {
                    return 'Please enter confirm password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.h),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate()??false) {

                  }
                },
                child: const Text(AppStrings.signup),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
