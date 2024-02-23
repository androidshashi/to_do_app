import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/core/utils/extensions/extensions.dart';
import 'package:to_do_app/core/utils/shared_pref_utils.dart';
import 'package:to_do_app/view/home_screen.dart';
import 'package:to_do_app/view/signup_scrren.dart';
import 'package:to_do_app/viewmodel/sighup_viewmodel.dart';
import 'package:to_do_app/viewmodel/home_viewmodel.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then((value) async {
      if (await SharedPrefUtils.isLoggedIn()) {
        if (context.mounted) {
          context.offAll(
              screen: ChangeNotifierProvider(
            create: (_) => HomeViewModel(),
            child: const HomeScreen(),
          ));
        }
      } else {
        if (context.mounted) {
          context.offAll(
              screen: ChangeNotifierProvider(
            create: (_) => SignupViewModel(),
            child: const SignupScreen(),
          ));
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(
        Icons.edit_note_sharp,
        size: 100.w,
      ),
    );
  }
}
