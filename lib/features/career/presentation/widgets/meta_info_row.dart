import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myportfolioapp/core/themes/responsive_text_theme.dart';

import '../../../../core/themes/app_colors.dart';
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
              width: isDesktop ? 22.w : 15.w,
              height: isDesktop ? 22.h : 15.h,
              colorFilter: ColorFilter.mode(
                AppColors.primaryBlue,
                BlendMode.srcIn,
              ),
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              text,
              style: context.fontStyle.bodyMedium?.copyWith(
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
