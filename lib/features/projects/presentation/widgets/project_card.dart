import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:myportfolioapp/core/app_resources/app_icons.dart';
import 'package:myportfolioapp/core/common/custom_outlined_button.dart';
import 'package:myportfolioapp/core/common/glass_card.dart';
import 'package:myportfolioapp/core/themes/responsive_text_theme.dart';
import 'package:myportfolioapp/features/projects/domain/entity/project_item.dart';
import 'package:myportfolioapp/features/projects/presentation/pages/project_details_page.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/utils/responsive.dart';
import 'project_thumbnails.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key, required this.project});

  final ProjectItem project;

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
  final ProjectItem project;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ProjectThumbnails(imageUrls: project.images),
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
  final ProjectItem project;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(child: ProjectThumbnails(imageUrls: project.images)),
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
  final ProjectItem project;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          project.name,
          style: context.fontStyle.headlineSmall?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 10.h),
        Text(project.description, style: context.fontStyle.bodySmall),
        SizedBox(height: 16.h),
        Wrap(
          spacing: 10.w,
          runSpacing: 10.h,
          children: [
            SvgPicture.asset(
              AppIcons.stack,
              height: 30.h,
              colorFilter: ColorFilter.mode(
                AppColors.starYellow,
                BlendMode.srcIn,
              ),
            ),
            for (final tech in project.technology) _TechChip(label: tech),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            SvgPicture.asset(
              AppIcons.companyIcon,
              height: 25.h,
              colorFilter: ColorFilter.mode(
                AppColors.starYellow,
                BlendMode.srcIn,
              ),
            ),
            SizedBox(width: 15.w),
            Text(
              project.company,
              style: context.fontStyle.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.textSecondary,
              ),
            ),
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
        style: context.fontStyle.labelMedium?.copyWith(
          fontWeight: FontWeight.w500,
          color: AppColors.green,
        ),
      ),
    );
  }
}

class _ProjectSideActions extends StatelessWidget {
  const _ProjectSideActions({required this.project, this.horizontal = false});

  final ProjectItem project;
  final bool horizontal;

  @override
  Widget build(BuildContext context) {
    final caseStudy = CustomOutlinedButton(
      onTap: () {
        context.go(ProjectDetailsPage.routeFor(project.id));
      },
      label: 'Case Study',
    );
    final platforms = CustomOutlinedButton(
      iconData: Icons.open_in_new,
      onTap: () {
        launchUrl(Uri.parse(project.link));
      },
      label: 'Project Link',
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
