import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:myportfolioapp/core/app_resources/app_icons.dart';
import 'package:myportfolioapp/core/common/custom_outlined_button.dart';
import 'package:myportfolioapp/core/common/glass_card.dart';
import 'package:myportfolioapp/core/themes/responsive_size.dart';
import 'package:myportfolioapp/core/themes/responsive_text_theme.dart';
import 'package:myportfolioapp/features/projects/domain/entity/project_item.dart';
import 'package:myportfolioapp/features/projects/presentation/pages/project_details_page.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/themes/app_colors.dart';
import 'project_thumbnails.dart';
import 'tech_chip.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key, required this.project});
  final ProjectItem project;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Hero(
        tag: "project_hero_${project.id}",
        transitionOnUserGestures: true,
        child: GlassCard(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(context.isMobile ? 16.r : 24.r),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
            child: context.isMobile
                ? mobileView(context)
                : context.isTablet || context.isTablet
                ? tabletView(context)
                : desktopView(context),
          ),
        ),
      ),
    );
  }

  Widget mobileView(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(child: ProjectThumbnails(imageUrl: project.thumbnail)),
        SizedBox(height: 16.h),
        projectInfo(context),
        SizedBox(height: 16.h),
        Divider(color: AppColors.divider, height: 1, thickness: 1),
        SizedBox(height: 16.h),
        _ProjectSideActions(project: project, horizontal: true),
      ],
    );
  }

  Widget tabletView(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: .start,
          children: [
            ProjectThumbnails(imageUrl: project.thumbnail),
            SizedBox(width: 10.w),
            Expanded(child: nameDescription(context)),
          ],
        ),
        SizedBox(height: 10.h),
        Wrap(
          spacing: 10.w,
          runSpacing: 10.h,
          children: [
            for (final tech in project.technology) TechChip(techStack: tech),
          ],
        ),
        SizedBox(height: 10.h),
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
        SizedBox(height: 10.h),
        Divider(color: AppColors.divider, height: 1, thickness: 1),
        SizedBox(height: 16.h),
        _ProjectSideActions(project: project, horizontal: true),
      ],
    );
  }

  Widget desktopView(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ProjectThumbnails(imageUrl: project.thumbnail),
          SizedBox(width: 28.w),
          Expanded(child: projectInfo(context)),
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

  Widget projectInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        nameDescription(context),
        SizedBox(height: 16.h),
        Wrap(
          spacing: 10.w,
          runSpacing: 10.h,
          children: [
            for (final tech in project.technology) TechChip(techStack: tech),
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

  Widget nameDescription(BuildContext context) {
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
      ],
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
