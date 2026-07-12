import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolioapp/core/common/glass_card.dart';

import '../../../../core/app_resources/app_colors.dart';
import '../../../../core/app_resources/app_icons.dart';
import '../../../../core/utils/responsive.dart';
import '../../data/models/work_experience.dart';
import 'achievements_list.dart';
import 'company_logo.dart';
import 'employment_badge.dart';
import 'meta_info_row.dart';

class ExperienceCard extends StatelessWidget {
  const ExperienceCard({super.key, required this.experience});

  final WorkExperience experience;

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    final bool isMobile = Responsive.isMobile(context);

    final logo = CompanyLogo(
      company: experience.company,
      style: experience.logoStyle,
      logoAsset: experience.logoAsset,
      size: isMobile ? 64.r : 96.r,
    );

    final header = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 10.w,
            runSpacing: 6.h,
            children: [
              Text(
                experience.role,
                style: TextStyle(
                  fontSize: isMobile ? 16.sp : 18.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              EmploymentBadge(label: experience.employmentType),
            ],
          ),
        ),
      ],
    );

    final meta = Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MetaInfoRow(iconAsset: AppIcons.stack, text: experience.techStack),
          MetaInfoRow(iconAsset: AppIcons.location, text: experience.location),
          MetaInfoRow(iconAsset: AppIcons.calender, text: experience.dateRange),
        ],
      ),
    );

    final description = Padding(
      padding: EdgeInsets.only(top: 4.h),
      child: Text(
        experience.description,
        style: TextStyle(
          fontSize: 13.5.sp,
          color: AppColors.textSecondary,
          height: 1.55,
        ),
      ),
    );

    final infoColumn = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [header, meta, description],
    );

    final achievements = AchievementsList(items: experience.achievements);

    Widget content;
    if (isDesktop) {
      content = IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            logo,
            SizedBox(width: 20.w),
            Expanded(flex: 6, child: infoColumn),
            SizedBox(width: 20.w),
            VerticalDivider(color: AppColors.divider, thickness: 1, width: 1),
            SizedBox(width: 20.w),
            Expanded(flex: 5, child: achievements),
          ],
        ),
      );
    } else if (isMobile) {
      content = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              logo,
              SizedBox(width: 14.w),
              Expanded(child: header),
            ],
          ),
          meta,
          description,
          SizedBox(height: 16.h),
          Divider(color: AppColors.divider, thickness: 1),
          SizedBox(height: 12.h),
          achievements,
        ],
      );
    } else {
      // Tablet
      content = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              logo,
              SizedBox(width: 18.w),
              Expanded(child: infoColumn),
            ],
          ),
          SizedBox(height: 16.h),
          Divider(color: AppColors.divider, thickness: 1),
          SizedBox(height: 14.h),
          achievements,
        ],
      );
    }

    return GlassCard(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(isMobile ? 16.r : 24.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(color: AppColors.divider, width: 1),
        ),
        child: content,
      ),
    );
  }
}
