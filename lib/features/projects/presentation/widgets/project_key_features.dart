import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myportfolioapp/core/common/glass_card.dart';
import 'package:myportfolioapp/core/themes/app_colors.dart';
import 'package:myportfolioapp/core/themes/responsive_size.dart';
import 'package:myportfolioapp/core/themes/responsive_text_theme.dart';
import 'package:myportfolioapp/features/projects/domain/entity/project_details.dart';

import '../../../../core/app_resources/app_icons.dart';
import '../bloc/project_bloc.dart';
import '../bloc/project_state.dart';
import 'contents_header.dart';

class ProjectKeyFeatures extends StatelessWidget {
  const ProjectKeyFeatures({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Padding(
        padding: const EdgeInsetsGeometry.all(16),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            ContentsHeader(
              icon: AppIcons.features,
              title: "Key Features",
              iconColor: AppColors.starYellow,
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: BlocBuilder<ProjectBloc, ProjectState>(
                builder: (context, state) {
                  var ob = state.projectDetails?.keyfeatures ?? [];
                  return MasonryGridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),

                    crossAxisCount: context.isMobile
                        ? 1
                        : context.isTablet
                        ? 2
                        : 3,
                    mainAxisSpacing: 10.h,
                    crossAxisSpacing: 10.w,
                    itemCount: ob.length,
                    itemBuilder: (context, index) {
                      return row(ob[index], context);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget row(KeyFeature feature, BuildContext context) {
    return Row(
      mainAxisSize: .min,
      crossAxisAlignment: .start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 2.5),
          child: SvgPicture.asset(
            AppIcons.greentick,
            height: 25.r,
            width: 25.w,
            colorFilter: ColorFilter.mode(
              AppColors.primaryBlue,
              BlendMode.srcIn,
            ),
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: Column(
            crossAxisAlignment: .start,
            mainAxisAlignment: .start,
            mainAxisSize: .min,
            children: [
              Text(
                feature.title,
                style: context.fontStyle.bodyMedium?.copyWith(
                  color: AppColors.cyan,
                ),
              ),
              Text(feature.description, style: context.fontStyle.bodySmall),
            ],
          ),
        ),
      ],
    );
  }
}
