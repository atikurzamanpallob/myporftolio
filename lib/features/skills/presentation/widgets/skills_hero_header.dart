import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_resources/app_colors.dart';
import '../../../../core/app_resources/app_fonts.dart';
import '../../../../core/app_resources/app_images.dart';
import '../../../../core/utils/responsive.dart';

class SkillsHeroHeader extends StatelessWidget {
  const SkillsHeroHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    final bool isDesktop = Responsive.isDesktop(context);

    final title = Text.rich(
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
            text: 'Skills',
            style: TextStyle(color: AppColors.primaryBlue),
          ),
        ],
      ),
    );

    final subtitle = Text(
      'Here are the tools and technology that i use to design, build '
      'ship high performance frontend (web, mobile) and backend '
      'applications.',
      style: TextStyle(
        fontSize: 12.sp,
        color: AppColors.textSecondary,
        fontFamily: AppFonts.inter,
        fontStyle: FontStyle.normal,
        height: 1.4,
      ),
    );

    final illustration = _HeroIllustration(compact: !isDesktop);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16.w : 40.w,
        vertical: isMobile ? 28.h : 15.h,
      ),
      child: isDesktop
          ? Stack(
              children: [
                Expanded(child: illustration),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      title,
                      SizedBox(height: 14.h),
                      ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 480.w),
                        child: subtitle,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 24.w),
              ],
            )
          : Stack(
              children: [
                Opacity(opacity: 0.4, child: illustration),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    title,
                    SizedBox(height: 12.h),
                    subtitle,
                  ],
                ),
              ],
            ),
    );
  }
}

class _HeroIllustration extends StatelessWidget {
  const _HeroIllustration({required this.compact});
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14.r),
      child: AspectRatio(
        aspectRatio: compact ? 16 / 6 : 1316 / 180,
        child: Image.asset(AppImages.skillImage, fit: BoxFit.fill),
      ),
    );
  }
}
