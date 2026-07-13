import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolioapp/core/app_resources/app_fonts.dart';
import 'package:myportfolioapp/core/app_resources/app_icons.dart';

import '../../../../core/app_resources/app_colors.dart';
import '../../../../core/app_resources/app_images.dart';
import '../../../../core/utils/responsive.dart';
import '../widgets/circle_icon_button.dart';

class TopSection extends StatelessWidget {
  const TopSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);

    if (isDesktop) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 60.w, vertical: 15.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 6, child: _HeroText()),
            SizedBox(width: 30.w),
            Expanded(flex: 5, child: _HeroImage()),
          ],
        ),
      );
    }

    // Tablet / Mobile: stacked layout, image on top for visual impact.
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.isMobile(context) ? 20.w : 40.w,
        vertical: 5.h,
      ),
      child: Stack(
        children: [
          Opacity(opacity: 0.2, child: _HeroImage()),
          _HeroText(centered: true),
        ],
      ),
    );
  }
}

class _HeroText extends StatelessWidget {
  const _HeroText({this.centered = false});

  final bool centered;

  @override
  Widget build(BuildContext context) {
    final crossAlign = centered
        ? CrossAxisAlignment.center
        : CrossAxisAlignment.start;
    final textAlign = centered ? TextAlign.center : TextAlign.start;
    final bool isMobile = Responsive.isMobile(context);

    return Column(
      crossAxisAlignment: crossAlign,
      children: [
        Text.rich(
          TextSpan(
            style: TextStyle(
              fontSize: isMobile ? 30.sp : 36.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              height: 1.1,
            ),
            children: [
              const TextSpan(
                text: 'I Build Beautiful & \nHigh Performance\nApps With ',
              ),
              TextSpan(
                text: 'Flutter',
                style: TextStyle(color: AppColors.primaryBlue),
              ),
            ],
          ),
          textAlign: textAlign,
        ),
        SizedBox(height: 20.h),
        Text(
          'I create cross-platform applications that are fast, scalable '
          '\n& provide smooth user experience.',
          textAlign: textAlign,
          style: TextStyle(
            fontSize: 12.sp,
            color: AppColors.textSecondary,
            fontFamily: AppFonts.inter,
            fontStyle: FontStyle.normal,
            height: 1.2,
          ),
        ),
        SizedBox(height: 15.h),
        _DownloadResumeButton(),
        SizedBox(height: 10.h),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: centered
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          children: [
            Text(
              "Let's connect",
              style: TextStyle(fontSize: 12.sp, color: AppColors.textPrimary),
            ),
            SizedBox(width: 16.w),

            CircleIconButton(assetPath: AppIcons.github, onTap: () {}),
            SizedBox(width: 10.w),
            CircleIconButton(assetPath: AppIcons.linkedin, onTap: () {}),
            SizedBox(width: 10.w),
            CircleIconButton(assetPath: AppIcons.gmail, onTap: () {}),
            SizedBox(width: 10.w),
            CircleIconButton(assetPath: AppIcons.hackerrank, onTap: () {}),
          ],
        ),
      ],
    );
  }
}

class _DownloadResumeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 7.h),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 0.7),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Download Resume',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 10.w),
              Icon(
                Icons.file_download_outlined,
                color: Colors.white,
                size: 20.r,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeroImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    final double circleSize = isMobile
        ? 280.h
        : (Responsive.isTablet(context) ? 340.h : 340.h);

    return SizedBox(
      width: circleSize,
      height: circleSize,
      child: Image.asset(AppImages.homeImage, fit: BoxFit.contain),
    );
  }
}
