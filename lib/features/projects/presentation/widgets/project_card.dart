import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolioapp/core/common/glass_card.dart';

import '../../../../core/app_resources/app_colors.dart';
import '../../../../core/app_resources/app_fonts.dart';
import '../../../../core/utils/responsive.dart';
import '../../data/models/project_models.dart';
import 'project_thumbnails.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key, required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: GlassCard(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(isMobile ? 16.r : 24.r),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
          child: isMobile
              ? _MobileLayout(project: project)
              : _WideLayout(project: project),
        ),
      ),
    );
  }
}

class _WideLayout extends StatelessWidget {
  const _WideLayout({required this.project});
  final Project project;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ProjectThumbnails(icon: project.iconGlyph),
          SizedBox(width: 28.w),
          Expanded(child: _ProjectInfo(project: project)),
          SizedBox(width: 20.w),
          VerticalDivider(color: AppColors.divider, width: 1, thickness: 1),
          SizedBox(width: 20.w),
          SizedBox(
            width: 140.w,
            child: _ProjectSideActions(project: project),
          ),
        ],
      ),
    );
  }
}

class _MobileLayout extends StatelessWidget {
  const _MobileLayout({required this.project});
  final Project project;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(child: ProjectThumbnails(icon: project.iconGlyph)),
        SizedBox(height: 16.h),
        _ProjectInfo(project: project),
        SizedBox(height: 16.h),
        Divider(color: AppColors.divider, height: 1, thickness: 1),
        SizedBox(height: 16.h),
        _ProjectSideActions(project: project, horizontal: true),
      ],
    );
  }
}

class _ProjectInfo extends StatelessWidget {
  const _ProjectInfo({required this.project});
  final Project project;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          project.title,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          project.description,
          style: TextStyle(
            fontSize: 13.sp,
            fontFamily: AppFonts.inter,
            color: AppColors.textSecondary,
            height: 1.5,
          ),
        ),
        SizedBox(height: 16.h),
        Wrap(
          spacing: 10.w,
          runSpacing: 10.h,
          children: [
            for (final tech in project.techStack) _TechChip(label: tech),
          ],
        ),
      ],
    );
  }
}

class _TechChip extends StatelessWidget {
  const _TechChip({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.divider, width: 1),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11.5.sp,
          fontFamily: AppFonts.inter,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }
}

/// Case-study link (top) and Android/iOS availability badges (bottom).
/// Stacked on desktop/tablet (spaceBetween), laid out in a row on mobile.
class _ProjectSideActions extends StatelessWidget {
  const _ProjectSideActions({required this.project, this.horizontal = false});

  final Project project;
  final bool horizontal;

  @override
  Widget build(BuildContext context) {
    final caseStudy = project.caseStudyUrl == null
        ? const SizedBox.shrink()
        : InkWell(
            onTap: () {},
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Case Study',
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontFamily: AppFonts.inter,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryBlue,
                  ),
                ),
                SizedBox(width: 4.w),
                Icon(
                  Icons.arrow_outward,
                  size: 15.r,
                  color: AppColors.primaryBlue,
                ),
              ],
            ),
          );

    final platforms = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (project.androidAvailable) ...[
          _PlatformBadge(icon: Icons.android, iconColor: AppColors.accentGreen),
          SizedBox(width: 10.w),
        ],
        if (project.iosAvailable)
          _PlatformBadge(icon: Icons.apple, iconColor: Colors.white),
      ],
    );

    if (horizontal) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [caseStudy, platforms],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [caseStudy, platforms],
    );
  }
}

class _PlatformBadge extends StatelessWidget {
  const _PlatformBadge({required this.icon, required this.iconColor});
  final IconData icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 34.r,
      height: 34.r,
      decoration: const BoxDecoration(
        color: AppColors.iconCircleFill,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 18.r, color: iconColor),
    );
  }
}
