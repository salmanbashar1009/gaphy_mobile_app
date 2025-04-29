import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaphy_mobile_app/core/constant/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextTheme{
  static TextTheme get lightTextTheme => TextTheme(
    headlineLarge: TextStyle(
        fontSize: 32.sp,
        fontWeight: FontWeight.w600,
        color:  AppColors.primaryColor
    ),
    titleLarge: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.primaryColor
    ),
    titleSmall: GoogleFonts.inter(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.primaryColor
    ),
    bodyLarge: GoogleFonts.inter(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color:  AppColors.primaryColor
    ),

    bodyMedium: GoogleFonts.inter(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.primaryColor
    ),
    bodySmall: GoogleFonts.inter(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.primaryColor
    ),
  );
}