import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolioapp/core/common/glass_card.dart';
import 'package:myportfolioapp/features/career/domain/entity/work_experience_item.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/app_resources/app_colors.dart';
import '../../../../core/app_resources/app_icons.dart';
import '../../../../core/utils/responsive.dart';
import 'achievements_list.dart';
import 'company_logo.dart';
import 'employment_badge.dart';
import 'meta_info_row.dart';

class ExperienceCard extends StatelessWidget {
  const ExperienceCard({super.key, required this.experience});

  final WorkExperienceItem experience;

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    final bool isMobile = Responsive.isMobile(context);
    return GlassCard(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(isMobile ? 16.r : 24.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(color: AppColors.divider, width: 1),
        ),
        child: isDesktop
            ? desktop(isMobile: isMobile, isDesktop: isDesktop)
            : isMobile
            ? mobile(isMobile: isMobile, isDesktop: isDesktop)
            : tablet(isMobile: isMobile, isDesktop: isDesktop),
      ),
    );
  }

  Widget desktop({required bool isMobile, required bool isDesktop}) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          logo(isMobile: isMobile, isDesktop: isDesktop),
          SizedBox(width: 20.w),
          Expanded(flex: 6, child: infoColumn(isMobile: isMobile)),
          SizedBox(width: 20.w),
          VerticalDivider(color: AppColors.divider, thickness: 1, width: 1),
          SizedBox(width: 20.w),
          Expanded(
            flex: 5,
            child: AchievementsList(items: experience.achievements ?? []),
          ),
        ],
      ),
    );
  }

  Widget mobile({required bool isMobile, required bool isDesktop}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            logo(isMobile: isMobile, isDesktop: isDesktop),
            SizedBox(width: 14.w),
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  header(isMobile: isMobile),
                  company(isMobile: isMobile),
                ],
              ),
            ),
          ],
        ),

        meta(),
        description(),
        SizedBox(height: 16.h),
        Divider(color: AppColors.divider, thickness: 1),
        SizedBox(height: 12.h),
        AchievementsList(items: experience.achievements ?? []),
      ],
    );
  }

  Widget tablet({required bool isMobile, required bool isDesktop}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            logo(isMobile: isMobile, isDesktop: isDesktop),
            SizedBox(width: 18.w),
            Expanded(child: infoColumn(isMobile: isMobile)),
          ],
        ),
        SizedBox(height: 16.h),
        Divider(color: AppColors.divider, thickness: 1),
        SizedBox(height: 14.h),
        AchievementsList(items: experience.achievements ?? []),
      ],
    );
  }

  Widget infoColumn({required bool isMobile}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        header(isMobile: isMobile),
        company(isMobile: isMobile),
        meta(),
        description(),
      ],
    );
  }

  Widget logo({required bool isMobile, required bool isDesktop}) {
    return CompanyLogo(
      logoUrl: experience.companyLogoUrl,
      size: isMobile ? 70.r : 150.r,
    );
  }

  Widget header({required bool isMobile}) {
    return Row(
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
  }

  Widget company({required bool isMobile}) {
    return Padding(
      padding: EdgeInsets.only(top: 5.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            experience.companyName,
            style: TextStyle(
              fontSize: isMobile ? 14.sp : 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.green,
            ),
          ),
          SizedBox(width: 10.w),
          InkWell(
            onTap: () {
              launchUrl(Uri.parse(experience.companyUrl ?? ""));
            },
            child: Container(
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                border: Border.all(color: AppColors.primaryBlue, width: 1),
              ),
              child: Icon(
                Icons.arrow_outward,
                size: 15.r,
                color: AppColors.primaryBlue,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget meta() {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MetaInfoRow(iconAsset: AppIcons.stack, text: experience.techStack),
          MetaInfoRow(
            iconAsset: AppIcons.location,
            text: experience.companyLocation,
          ),
          MetaInfoRow(iconAsset: AppIcons.calender, text: experience.dateRange),
        ],
      ),
    );
  }

  Widget description() {
    return Padding(
      padding: EdgeInsets.only(top: 4.h),
      child: Text(
        experience.description ?? "",
        style: TextStyle(
          fontSize: 13.5.sp,
          color: AppColors.textSecondary,
          height: 1.55,
        ),
      ),
    );
  }
}
