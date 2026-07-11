import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/app_resources/app_colors.dart';
import '../../../../core/utils/responsive.dart';

/// Small "icon + text" row used for tech stack / location / date lines.
class MetaInfoRow extends StatelessWidget {
  const MetaInfoRow({super.key, required this.iconAsset, required this.text});

  final String iconAsset;
  final String text;

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: isDesktop ? 2.h : 0.h),
            child: SvgPicture.asset(
              iconAsset,
              width: isDesktop ? 20.w : 14.w,
              height: isDesktop ? 20.h : 14.h,
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 13.sp,
                color: AppColors.textSecondary,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
