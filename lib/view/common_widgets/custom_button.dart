import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/core/utils/extensions/extensions.dart';
import 'package:to_do_app/core/utils/extensions/theme_extensions.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, required this.buttonText, required this.onTap});

  final String buttonText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
         width: double.infinity,
          padding: EdgeInsets.all(16.w),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: context.appColor.primary,
              borderRadius: BorderRadius.circular(8.r)),
          child: Text(buttonText, style: context.titleStyle.copyWith(color: context.appColor.onPrimary),)),
    );
  }
}
