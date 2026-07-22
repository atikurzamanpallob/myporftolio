import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolioapp/core/app_resources/app_icons.dart';
import 'package:myportfolioapp/core/app_resources/app_images.dart';
import 'package:myportfolioapp/core/common/custom_outlined_button.dart';
import 'package:myportfolioapp/core/themes/app_colors.dart';
import 'package:myportfolioapp/features/blogs/presentation/widgets/meta_item.dart';
import '../../../../core/themes/responsive_text_theme.dart';
import '../../../../core/utils/responsive.dart';

class ProjectHeroSection extends StatelessWidget {
  const ProjectHeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    return Hero(
      tag: 'project_hero',
      child: Container(
        padding: EdgeInsets.all(20.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 0.05, color: AppColors.primaryBlue),
        ),
        child: isMobile ? mobile(context) : desktop(context),
      ),
    );
  }

  Widget mobile(BuildContext context) {
    return Column(
      children: [
        heroImage(),
        SizedBox(height: 20.h),
        projectInfo(context),
      ],
    );
  }

  Widget desktop(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 6, child: projectInfo(context)),
        SizedBox(width: 30.w),
        Expanded(flex: 4, child: heroImage()),
      ],
    );
  }

  Widget heroImage() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 0.3, color: AppColors.primaryBlue),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              AppImages.projectImage,
              height: 260.h,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }

  Widget projectInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(
          "Omirror",
          style: context.fontStyle.headlineLarge?.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
            letterSpacing: 0.3,
          ),
        ),

        SizedBox(height: 15.h),
        Text(
          "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."
          "The point of using Lorem Ipsum is that it has a more-or-less normal distribution",
          maxLines: 2,
          style: context.fontStyle.bodySmall,
        ),
        SizedBox(height: 30.h),
        Wrap(
          direction: Axis.horizontal,
          spacing: 15.w,
          runSpacing: 10.h,
          children: [
            MetaItem(icon: AppIcons.calender, label: "18 July 2025"),
            MetaItem(icon: AppIcons.minutesIcon, label: "6 Months"),
            MetaItem(icon: AppIcons.persons, label: "Personal"),
          ],
        ),
        SizedBox(height: 30.h),
        CustomOutlinedButton(
          onTap: () {},
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
