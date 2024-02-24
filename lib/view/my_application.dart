import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:to_do_app/core/constants/app_strings.dart';
import 'package:to_do_app/core/theme/app_theme.dart';
import 'package:to_do_app/core/utils/extensions/color_extensions.dart';
import 'package:to_do_app/core/utils/extensions/extensions.dart';
import 'package:to_do_app/view/signup_scrren.dart';
import 'package:to_do_app/view/splash_screen.dart';

/// This is the main widget from where the app will start
class MyApplication extends StatelessWidget {
  const MyApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return ScreenUtilInit(
          designSize: Size(constraints.maxWidth, constraints.maxHeight),
          splitScreenMode: true,
          builder: (context, child) => GlobalLoaderOverlay(
            overlayColor: context.appColor.blackColor.withOpacity(0.5),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              useInheritedMediaQuery: true,
              themeMode: ThemeMode.light,
              title: AppStrings.appName,
              theme: AppTheme.light(context),
              darkTheme: AppTheme.dark(context),
              home: child,
            ),
          ),
          child: const SplashScreen(),
        );
      },
    );
  }
}
