import 'package:flutter/material.dart';
import 'package:gaphy_mobile_app/presentation/theme/app_input_decoration_theme.dart';
import 'package:gaphy_mobile_app/presentation/theme/text_theme.dart';
import '../../core/constant/app_colors.dart';

class AppTheme {
  static ThemeData get light => ThemeData(
      primaryColor: AppColors.primaryColor,
      colorScheme: ColorScheme(brightness: Brightness.light, primary: AppColors.primaryColor, onPrimary: AppColors.secondaryColor, secondary: AppColors.secondaryColor,onSecondary:  AppColors.primaryColor, error: AppColors.red, onError: AppColors.white, surface: AppColors.white, onSurface: AppColors.black),
      scaffoldBackgroundColor: const Color(0xFFFFFFFF),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      // fontFamily: GoogleFonts.gabarito().fontFamily,
    textTheme: AppTextTheme.lightTextTheme,
    inputDecorationTheme: AppInputDecorationTheme.lightInputDecorationTheme
  );
}
