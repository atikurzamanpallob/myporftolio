import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolioapp/core/app_resources/app_fonts.dart';
import 'package:myportfolioapp/core/themes/app_colors.dart';
import 'package:myportfolioapp/core/themes/responsive_text_theme.dart';

class SidebarHeading extends StatelessWidget {
  const SidebarHeading({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 3.w,
          height: 16.h,
          margin: EdgeInsets.only(right: 8.w),
          decoration: BoxDecoration(
            color: AppColors.primaryBlue,
            borderRadius: BorderRadius.circular(2.r),
          ),
        ),
        Text(
          title,
          style: context.fontStyle.bodySmall?.copyWith(
            color: AppColors.textPrimary,
            fontFamily: AppFonts.roboto,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
