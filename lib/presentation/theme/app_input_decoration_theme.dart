import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constant/app_colors.dart';

class AppInputDecorationTheme{
  static InputDecorationTheme  lightInputDecorationTheme = InputDecorationTheme(
    hintStyle: TextStyle(
       color: AppColors.mediumGrey,
       fontSize: 16.sp,
       fontFamily: "Inter",
       fontWeight: FontWeight.w400
  ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(color: AppColors.ligtGrey),
  ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(color: AppColors.ligtGrey),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(color: AppColors.red),
    ),
  );
}