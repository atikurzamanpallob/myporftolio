import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_resources/app_colors.dart';
import '../../../../core/app_resources/app_fonts.dart';
import '../../../../core/app_resources/app_images.dart';
import '../../../../core/utils/responsive.dart';

class ProjectsHeroHeader extends StatelessWidget {
  const ProjectsHeroHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    final double bannerHeight = isMobile ? 120 : 150;

    return Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 50.w),
          width: double.infinity,
          height: bannerHeight,
          child: Image.asset(AppImages.projectImage, fit: BoxFit.fill),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 16.w : 40.w,
            vertical: isMobile ? 28.h : 40.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontSize: isMobile ? 30.sp : 36.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    height: 1.15,
                  ),
                  children: [
                    const TextSpan(text: 'My '),
                    TextSpan(
                      text: 'Projects',
                      style: TextStyle(color: AppColors.primaryBlue),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 14.h),
              Text(
                'Here are the projects i have worked on so far . Each '
                'projects reflects my focus on design , performance and '
                'great user experience',
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
