import 'package:flutter/material.dart';
import 'package:myportfolioapp/core/app_resources/app_fonts.dart';
import 'package:myportfolioapp/core/themes/app_colors.dart';

const textTheme = TextTheme(
  labelSmall: TextStyle(
    fontSize: 8,
    fontFamily: AppFonts.inter,
    fontWeight: FontWeight.w400,
  ),
  labelMedium: TextStyle(
    fontSize: 9,
    fontFamily: AppFonts.inter,
    fontWeight: FontWeight.w400,
  ),
  labelLarge: TextStyle(
    fontSize: 10,
    fontFamily: AppFonts.inter,
    fontWeight: FontWeight.w400,
  ),

  bodySmall: TextStyle(
    fontSize: 10.5,
    fontFamily: AppFonts.inter,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: AppColors.textSecondary,
  ),
  bodyMedium: TextStyle(
    fontSize: 12,
    fontFamily: AppFonts.inter,
    fontWeight: FontWeight.w400,
    height: 1.5,
  ),
  bodyLarge: TextStyle(
    fontSize: 13,
    fontFamily: AppFonts.inter,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: AppColors.textPrimary,
  ),

  titleSmall: TextStyle(
    fontSize: 13,
    fontFamily: AppFonts.roboto,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  ),
  titleMedium: TextStyle(
    fontSize: 14,
    fontFamily: AppFonts.roboto,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  ),
  titleLarge: TextStyle(
    fontSize: 15,
    fontFamily: AppFonts.roboto,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  ),

  headlineSmall: TextStyle(
    fontSize: 14,
    fontFamily: AppFonts.roboto,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  ),
  headlineMedium: TextStyle(
    fontSize: 15,
    fontFamily: AppFonts.roboto,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  ),
  headlineLarge: TextStyle(
    fontSize: 16,
    fontFamily: AppFonts.roboto,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  ),

  displaySmall: TextStyle(
    fontSize: 22,
    fontFamily: AppFonts.roboto,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  ),
  displayMedium: TextStyle(
    fontSize: 28,
    fontFamily: AppFonts.roboto,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  ),

  displayLarge: TextStyle(
    fontSize: 34,
    fontFamily: AppFonts.roboto,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  ),
);
