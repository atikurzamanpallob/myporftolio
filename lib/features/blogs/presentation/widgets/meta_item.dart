import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myportfolioapp/core/app_resources/app_colors.dart';
import 'package:myportfolioapp/core/app_resources/app_fonts.dart';
import 'package:myportfolioapp/core/utils/size_helper.dart';

class MetaItem extends StatelessWidget {
  const MetaItem({
    super.key,
    required this.icon,
    required this.label,
    this.isMobile = false,
    this.isTab = false,
  });
  final String icon;
  final String label;
  final bool isMobile;
  final bool isTab;

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
          colorFilter: ColorFilter.mode(AppColors.primaryBlue, BlendMode.srcIn),
        ),
        SizedBox(width: 6.w),
        Text(
          label,
          style: TextStyle(
            fontSize: SizeHelper.getBodyFontSize(
              isMobile: isMobile,
              isTab: isTab,
            ),
            fontFamily: AppFonts.inter,
            color: AppColors.green,
          ),
        ),
      ],
    );
  }
}
