import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_resources/app_colors.dart';
import '../../../../core/app_resources/app_fonts.dart';
import '../../../../core/app_resources/app_icons.dart';
import '../../../../core/app_resources/app_images.dart';
import '../../../../core/utils/responsive.dart';
import '../widgets/stat_item.dart';

const String _kBio =
    "I'm a Flutter developer with over 5.5+ years of experience building "
    "high-performance, visually appealing, and scalable cross-platform "
    "applications. I specialize in creating pixel-perfect UI, efficient "
    "state management, and seamless real-time features using Flutter and "
    "Dart. My expertise includes clean architecture, performance "
    "optimization, secure API integration, and handling complex app logic "
    "with isolates and background services. I've worked on diverse "
    "projects including eCommerce apps, SaaS platforms, and real-time chat "
    "applications.";

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    final bool isMobile = Responsive.isMobile(context);

    final photo = ClipRRect(
      borderRadius: BorderRadius.circular(10.r),
      child: Image.asset(
        AppImages.profile,
        width: isDesktop ? 220.w : (isMobile ? 320.w : 200.w),
        height: isDesktop ? 270.h : (isMobile ? 245.h : 218.h),
        fit: BoxFit.cover,
      ),
    );

    final bioText = Text(
      _kBio,
      textAlign: TextAlign.justify,
      style: TextStyle(
        fontSize: 12.sp,
        color: AppColors.textSecondary,
        height: 1.7,
        letterSpacing: 0.3,

        fontFamily: AppFonts.inter,
        fontStyle: FontStyle.italic,
      ),
    );

    final stats = Flex(
      direction: isDesktop ? Axis.vertical : Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: isDesktop
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        StatItem(
          iconAsset: AppIcons.experience,
          value: '5.5 +',
          label: 'Years Of Experience',
        ),
        SizedBox(height: isDesktop ? 15.h : 0.0, width: isDesktop ? 0.0 : 12.w),
        StatItem(
          iconAsset: AppIcons.projects,
          value: '15 +',
          label: 'Projects Completed',
        ),
        SizedBox(height: isDesktop ? 15.h : 0.0, width: isDesktop ? 0.0 : 12.w),
        StatItem(
          iconAsset: AppIcons.client,
          value: '100 %',
          label: 'Client Satisfaction',
        ),
      ],
    );

    Widget content;
    if (isDesktop) {
      content = IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            photo,
            SizedBox(width: 28.w),
            Expanded(child: bioText),
            SizedBox(width: 28.w),
            VerticalDivider(
              color: AppColors.textPrimary,
              thickness: 5,
              width: 10,
              radius: BorderRadius.circular(10.r),
            ),
            SizedBox(width: 28.w),
            Expanded(child: stats),
          ],
        ),
      );
    } else {
      content = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          photo,
          SizedBox(height: 10.h),
          bioText,
          SizedBox(height: 24.h),
          Divider(color: AppColors.divider, thickness: 1),
          SizedBox(height: 20.h),
          isMobile
              ? Column(
                  children: [
                    _wrapStat(
                      StatItem(
                        iconAsset: AppIcons.experience,
                        value: '5.5 +',
                        label: 'Years Of Experience',
                      ),
                    ),
                    SizedBox(height: 15.h),
                    _wrapStat(
                      StatItem(
                        iconAsset: AppIcons.projects,
                        value: '15 +',
                        label: 'Projects Completed',
                      ),
                    ),
                    SizedBox(height: 15.h),
                    _wrapStat(
                      StatItem(
                        iconAsset: AppIcons.client,
                        value: '100 %',
                        label: 'Client Satisfaction',
                      ),
                    ),
                  ],
                )
              : stats,
        ],
      );
    }

    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: isMobile ? 16.w : 55.w),
      padding: EdgeInsets.all(isMobile ? 15.r : 20.r),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.divider, width: 1),
      ),
      child: content,
    );
  }

  Widget _wrapStat(Widget child) =>
      Align(alignment: Alignment.centerLeft, child: child);
}
