import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolioapp/core/app_resources/app_icons.dart';
import 'package:myportfolioapp/core/app_resources/app_images.dart';
import 'package:myportfolioapp/core/themes/app_colors.dart';
import 'package:myportfolioapp/core/themes/responsive_size.dart';
import 'package:myportfolioapp/features/blogs/presentation/widgets/meta_item.dart';
import 'package:myportfolioapp/features/projects/domain/entity/project_item.dart';
import 'package:myportfolioapp/features/projects/presentation/bloc/project_bloc.dart';
import 'package:myportfolioapp/features/projects/presentation/bloc/project_state.dart';
import 'package:myportfolioapp/features/projects/presentation/widgets/project_thumbnails.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/common/custom_outlined_button.dart';
import '../../../../core/themes/responsive_text_theme.dart';

class ProjectHeroSection extends StatelessWidget {
  const ProjectHeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectBloc, ProjectState>(
      builder: (context, state) {
        var projectInfo = state.projectItem;
        return Hero(
          tag: 'project_hero_${projectInfo?.id}',
          child: state.isLoading == true
              ? Center(child: CircularProgressIndicator())
              : Container(
                  padding: EdgeInsets.all(20.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 0.05,
                      color: AppColors.primaryBlue,
                    ),
                  ),
                  child: context.isMobile
                      ? mobile(context, projectInfo)
                      : desktop(context, projectInfo),
                ),
        );
      },
    );
  }

  Widget mobile(BuildContext context, ProjectItem? projectInfo) {
    return Column(
      children: [
        heroImage(projectInfo?.images ?? []),
        SizedBox(height: 20.h),
        projectInfoWidget(context, projectInfo),
      ],
    );
  }

  Widget desktop(BuildContext context, ProjectItem? projectInfo) {
    return Row(
      children: [
        Expanded(flex: 6, child: projectInfoWidget(context, projectInfo)),
        SizedBox(width: 30.w),
        Expanded(flex: 4, child: heroImage(projectInfo?.images ?? [])),
      ],
    );
  }

  Widget heroImage(List<String> urls) {
    return Container(
      height: 250.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 0.3, color: AppColors.primaryBlue),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          alignment: .center,
          children: [
            Image.asset(AppImages.projectImage, fit: BoxFit.cover),
            ProjectThumbnails(imageUrls: urls),
          ],
        ),
      ),
    );
  }

  Widget projectInfoWidget(BuildContext context, ProjectItem? projectInfo) {
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
            MetaItem(icon: AppIcons.persons, label: projectInfo?.company ?? ""),
          ],
        ),
        SizedBox(height: 20.h),
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
