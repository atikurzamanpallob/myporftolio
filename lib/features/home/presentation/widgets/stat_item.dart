import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myportfolioapp/core/themes/responsive_text_theme.dart';

import '../../../../core/themes/app_colors.dart';

/// One row inside the "About" card: icon in a circle + big number + label.
class StatItem extends StatelessWidget {
  const StatItem({
    super.key,
    required this.iconAsset,
    required this.value,
    required this.label,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });

  final String iconAsset;
  final String value;
  final String label;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 56.r,
          height: 56.r,
          padding: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
            color: AppColors.iconCircleFill,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.iconCircleBorder, width: 1.2),
          ),
          child: SvgPicture.asset(iconAsset),
        ),
        SizedBox(width: 16.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              value,
              style: context.fontStyle.titleLarge?.copyWith(
                height: 1.1,
                color: AppColors.green,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 1.h),
            Text(
              label,
              style: context.fontStyle.bodyMedium?.copyWith(
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
