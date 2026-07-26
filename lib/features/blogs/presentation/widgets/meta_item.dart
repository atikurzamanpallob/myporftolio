import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myportfolioapp/core/themes/app_colors.dart';
import 'package:myportfolioapp/core/themes/responsive_text_theme.dart';

class MetaItem extends StatelessWidget {
  const MetaItem({super.key, required this.icon, required this.label});
  final String icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: .min,
      crossAxisAlignment: .center,
      children: [
        SvgPicture.asset(
          icon,
          height: 20.h,
          width: 20.w,
          colorFilter: ColorFilter.mode(AppColors.primaryBlue, BlendMode.srcIn),
        ),
        SizedBox(width: 6.w),
        Text(
          label,

          style: context.fontStyle.labelLarge?.copyWith(color: AppColors.green),
        ),
      ],
    );
  }
}
