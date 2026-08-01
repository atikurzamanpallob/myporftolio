import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolioapp/core/app_resources/app_icons.dart';
import 'package:myportfolioapp/core/common/glass_card.dart';
import 'package:myportfolioapp/core/themes/app_colors.dart';
import 'package:myportfolioapp/core/themes/responsive_size.dart';
import 'package:myportfolioapp/features/blogs/presentation/widgets/meta_item.dart';
import 'package:myportfolioapp/features/projects/domain/entity/project_details.dart';
import 'package:myportfolioapp/features/projects/domain/entity/project_item.dart';
import 'package:myportfolioapp/features/projects/presentation/bloc/project_bloc.dart';
import 'package:myportfolioapp/features/projects/presentation/bloc/project_state.dart';
import 'package:myportfolioapp/features/projects/presentation/widgets/project_thumbnails.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/common/custom_outlined_button.dart';
import '../../../../core/themes/responsive_text_theme.dart';

class ProjectHeroSection extends StatelessWidget {
  const ProjectHeroSection({super.key, required this.projectId});
  final int projectId;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectBloc, ProjectState>(
      builder: (context, state) {
        var projectInfo = state.projectItem;
        var details = state.projectDetails;
        return Hero(
          tag: 'project_hero_$projectId',
          child: state.isLoading == true
              ? Center(child: CircularProgressIndicator())
              : GlassCard(
                  child: Container(
                    padding: EdgeInsets.all(20.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: context.isMobile
                        ? mobile(context, projectInfo, details)
                        : context.isTablet || context.isLaptop
                        ? tablet(context, projectInfo, details)
                        : desktop(context, projectInfo, details),
                  ),
                ),
        );
      },
    );
  }

  Widget mobile(
    BuildContext context,
    ProjectItem? projectInfo,
    ProjectDetails? details,
  ) {
    return Column(
      children: [
        ProjectThumbnails(imageUrls: projectInfo?.images ?? []),
        SizedBox(height: 10.h),
        projectInfoWidget(context, projectInfo, details),
      ],
    );
  }

  Widget tablet(
    BuildContext context,
    ProjectItem? projectInfo,
    ProjectDetails? details,
  ) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: projectInfoWidget(context, projectInfo, details)),
            SizedBox(width: 10.w),
            ProjectThumbnails(imageUrls: projectInfo?.images ?? []),
          ],
        ),
      ],
    );
  }

  Widget desktop(
    BuildContext context,
    ProjectItem? projectInfo,
    ProjectDetails? details,
  ) {
    return Row(
      children: [
        Expanded(
          flex: 6,
          child: projectInfoWidget(context, projectInfo, details),
        ),
        Expanded(flex: 2, child: SizedBox()),
        ProjectThumbnails(imageUrls: projectInfo?.images ?? []),
      ],
    );
  }

  Widget projectInfoWidget(
    BuildContext context,
    ProjectItem? projectInfo,
    ProjectDetails? details,
  ) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(
          projectInfo?.name ?? "",
          style: context.fontStyle.headlineLarge?.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
            letterSpacing: 0.3,
          ),
        ),

        SizedBox(height: 15.h),
        Text(
          projectInfo?.description ?? "",
          maxLines: 2,
          style: context.fontStyle.bodySmall,
        ),
        SizedBox(height: 30.h),
        Wrap(
          direction: Axis.horizontal,
          spacing: 15.w,
          runSpacing: 10.h,
          children: [
            MetaItem(
              icon: AppIcons.companyIcon,
              label: projectInfo?.company ?? "",
            ),
            MetaItem(icon: AppIcons.persons, label: details?.role ?? ""),
            MetaItem(
              icon: AppIcons.screenshots,
              label: details?.platform ?? "",
            ),
          ],
        ),
        SizedBox(height: 15.h),
        CustomOutlinedButton(
          onTap: () {
            launchUrl(Uri.parse(projectInfo?.link ?? ""));
          },
          label: "Project Link",
          textColor: AppColors.textPrimary,
          borderColor: AppColors.textPrimary,
          backgroundColor: AppColors.primaryBlue,
          iconData: Icons.open_in_new,
        ),
      ],
    );
  }
}
