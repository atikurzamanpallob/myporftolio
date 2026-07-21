import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myportfolioapp/core/app_resources/app_fonts.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/app_resources/app_icons.dart';

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
            style: TextStyle(
              fontSize: 12.sp,
              fontFamily: AppFonts.inter,
              color: AppColors.textMuted,
            ),
          ),
          SizedBox(width: 8.w),
          SvgPicture.asset(AppIcons.flutter, width: 22.r, height: 22.r),
        ],
      ),
    );
  }
}
