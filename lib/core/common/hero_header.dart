import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../themes/app_colors.dart';
import '../../../../core/app_resources/app_fonts.dart';
import '../../../../core/utils/responsive.dart';

class HeroHeader extends StatelessWidget {
  const HeroHeader({
    super.key,
    required this.heading1,
    required this.heading2,
    required this.bodyText,
    required this.backgroundImage,
  });
  final String heading1, heading2, bodyText, backgroundImage;

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    final double bannerHeight = isMobile ? 120 : 150;

    return Stack(
      children: [
        Opacity(
          opacity: isMobile ? 0.4 : 1,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 50.w),
            width: double.infinity,
            height: bannerHeight,
            child: Image.asset(backgroundImage, fit: BoxFit.fill),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 16.w : 40.w,
            vertical: isMobile ? 28.h : 15.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontSize: isMobile ? 26.sp : 34.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    height: 1.2,
                  ),
                  children: [
                    TextSpan(text: heading1),
                    TextSpan(
                      text: heading2,
                      style: TextStyle(color: AppColors.primaryBlue),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 14.h),
              Text(
                bodyText,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontFamily: AppFonts.inter,
                  color: AppColors.textSecondary,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
