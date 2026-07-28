import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myportfolioapp/core/themes/app_colors.dart';
import 'package:myportfolioapp/core/themes/responsive_text_theme.dart';

import '../../../../core/app_resources/app_icons.dart';
import '../../../../core/common/glass_card.dart';
import '../bloc/project_bloc.dart';
import '../bloc/project_state.dart';
import 'contents_header.dart';

class ProjectSolutions extends StatelessWidget {
  const ProjectSolutions({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Padding(
        padding: const EdgeInsetsGeometry.all(16),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            ContentsHeader(
              icon: AppIcons.solutions,
              title: "Solutions",
              iconColor: AppColors.green,
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: BlocBuilder<ProjectBloc, ProjectState>(
                builder: (context, state) {
                  List<String> solutions =
                      state.projectDetails?.solutions ?? [];
                  return Column(
                    children: List.generate(
                      solutions.length,
                      (i) => Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              AppIcons.greentick,
                              height: 25.r,
                              width: 25.r,
                            ),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: Text(
                                solutions[i],
                                style: context.fontStyle.bodySmall?.copyWith(
                                  color: AppColors.cyan,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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
