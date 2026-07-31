import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolioapp/core/common/glass_card.dart';
import 'package:myportfolioapp/core/themes/app_colors.dart';
import 'package:myportfolioapp/core/themes/responsive_size.dart';
import 'package:myportfolioapp/core/themes/responsive_text_theme.dart';
import '../../../../core/app_resources/app_icons.dart';
import '../bloc/project_bloc.dart';
import '../bloc/project_state.dart';
import 'contents_header.dart';

class ProjectOverview extends StatelessWidget {
  const ProjectOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Padding(
        padding: const EdgeInsetsGeometry.all(16),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            ContentsHeader(
              icon: AppIcons.overview,
              title: "Overview",
              iconColor: AppColors.cyan,
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.only(
                left: context.isMobile | context.isTablet | context.isLaptop
                    ? 0.w
                    : 40.w,
              ),
              child: BlocBuilder<ProjectBloc, ProjectState>(
                builder: (context, state) {
                  return Expanded(
                    child: Text(
                      state.projectDetails?.overview ?? "",
                      style: context.fontStyle.bodySmall,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
