import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/core/utils/extensions/color_extensions.dart';
import 'package:to_do_app/core/utils/extensions/extensions.dart';

extension ThemeExt on BuildContext {

  /// Theme extensions
  TextStyle get titleStyle => GoogleFonts.poppins(
      color: appColor.blackColor, fontSize: 16.sp, fontWeight: FontWeight.bold);

  TextStyle get subTitleStyle => GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    color: appColor.blackColor,
    fontSize: 12.sp,
  );

  TextStyle get headingTextStyle => GoogleFonts.poppins(
    fontSize: 20.sp,
    color: appColor.blackColor,
    fontWeight: FontWeight.w500,
  );

  TextStyle get mainHeadingTextStyle => GoogleFonts.poppins(
    fontSize: 35.sp,
    color: appColor.blackColor,
    fontWeight: FontWeight.w500,
  );
}
