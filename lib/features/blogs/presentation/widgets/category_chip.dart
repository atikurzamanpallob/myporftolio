import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolioapp/core/themes/app_colors.dart';
import 'package:myportfolioapp/core/themes/responsive_text_theme.dart';

class CategoryChip extends StatelessWidget {
  const CategoryChip({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: AppColors.primaryBlue.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(
          color: AppColors.primaryBlue.withValues(alpha: 0.45),
          width: 0.8,
        ),
      ),
      child: Text(
        label,
        style: context.fontStyle.labelMedium?.copyWith(
          fontWeight: FontWeight.w600,
          color: AppColors.primaryBlue,
        ),
      ),
    );
  }
}
