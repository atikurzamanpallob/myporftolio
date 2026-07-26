import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myportfolioapp/core/themes/responsive_text_theme.dart';

import '../themes/app_colors.dart';
import '../app_resources/app_icons.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Powered By',
            style: context.fontStyle.bodySmall?.copyWith(
              color: Colors.cyanAccent,
            ),
          ),
          SizedBox(width: 8.w),
          SvgPicture.asset(AppIcons.flutter, width: 22.r, height: 22.r),
          SizedBox(width: 8.w),
          Text(
            'Crafted With',
            style: context.fontStyle.bodySmall?.copyWith(
              color: AppColors.primaryBlue,
            ),
          ),
          SizedBox(width: 8.w),
          Icon(Icons.favorite, color: Colors.redAccent, size: 22.r),
        ],
      ),
    );
  }
}
