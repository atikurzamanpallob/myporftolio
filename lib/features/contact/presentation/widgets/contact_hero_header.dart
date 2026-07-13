import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_resources/app_colors.dart';
import '../../../../core/app_resources/app_fonts.dart';
import '../../../../core/app_resources/app_images.dart';
import '../../../../core/utils/responsive.dart';

class ContactHeroHeader extends StatelessWidget {
  const ContactHeroHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    final double bannerHeight = isMobile ? 170 : 260;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(color: AppColors.background),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: bannerHeight.h,
            child: Image.asset(
              AppImages.contactImage,
              fit: BoxFit.cover,
              alignment: isMobile ? Alignment.centerLeft : Alignment.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 16.w : 40.w,
              vertical: isMobile ? 28.h : 42.h,
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
                      const TextSpan(text: "Let's Build Amazing Things "),
                      TextSpan(
                        text: 'Together',
                        style: TextStyle(color: AppColors.primaryBlue),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 14.h),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 460.w),
                  child: Text(
                    'Have project in mind or just want to say Hi? I would '
                    'love to hear from you.  Let’s turn your ideas into '
                    'real products.',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontFamily: AppFonts.inter,
                      color: AppColors.textSecondary,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
