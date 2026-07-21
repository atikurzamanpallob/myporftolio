import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myportfolioapp/core/app_resources/app_colors.dart';
import 'package:myportfolioapp/core/app_resources/app_fonts.dart';

class MetaItem extends StatelessWidget {
  const MetaItem({
    super.key,
    required this.icon,
    required this.label,
    this.isMobile = false,
  });
  final String icon;
  final String label;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: .min,
      crossAxisAlignment: .center,
      children: [
        SvgPicture.asset(
          icon,
          height: 20.h,
          width: 25.w,
          colorFilter: ColorFilter.mode(
            AppColors.accentBlueLight,
            BlendMode.srcIn,
          ),
        ),
        SizedBox(width: 6.w),
        Text(
          label,
          style: TextStyle(
            fontSize: isMobile ? 10.sp : 12.sp,
            fontFamily: AppFonts.inter,
            color: AppColors.green,
          ),
        ),
      ],
    );
  }
}
