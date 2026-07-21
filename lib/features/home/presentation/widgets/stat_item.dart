import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.accentGreen,
                height: 1.1,
              ),
            ),
            SizedBox(height: 1.h),
            Text(
              label,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
