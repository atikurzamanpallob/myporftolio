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

class ProjectChallenges extends StatelessWidget {
  const ProjectChallenges({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Padding(
        padding: const EdgeInsetsGeometry.all(16),
        child: Column(
          crossAxisAlignment: .start,
          mainAxisSize: .min,
          children: [
            ContentsHeader(
              icon: AppIcons.challenges,
              title: "Challenges",
              iconColor: AppColors.danger,
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: BlocBuilder<ProjectBloc, ProjectState>(
                builder: (context, state) {
                  List<String> challenges =
                      state.projectDetails?.challenges ?? [];
                  return Column(
                    children: List.generate(
                      challenges.length,
                      (i) => Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          crossAxisAlignment: .center,
                          children: [
                            SvgPicture.asset(
                              AppIcons.warning,
                              height: 25.r,
                              width: 25.r,
                            ),
                            SizedBox(width: 10.w),

                            Expanded(
                              child: Column(
                                mainAxisAlignment: .start,
                                crossAxisAlignment: .start,
                                children: [
                                  Text(
                                    challenges[i],
                                    textAlign: TextAlign.left,
                                    style: context.fontStyle.bodySmall,
                                  ),
                                ],
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
