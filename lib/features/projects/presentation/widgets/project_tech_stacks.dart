import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolioapp/core/app_resources/app_icons.dart';
import 'package:myportfolioapp/core/common/glass_card.dart';
import 'package:myportfolioapp/core/themes/app_colors.dart';
import 'package:myportfolioapp/features/projects/presentation/bloc/project_bloc.dart';
import 'package:myportfolioapp/features/projects/presentation/bloc/project_state.dart';
import 'package:myportfolioapp/features/projects/presentation/widgets/contents_header.dart';
import 'package:myportfolioapp/features/projects/presentation/widgets/tech_chip.dart';

class ProjectTechStacks extends StatelessWidget {
  const ProjectTechStacks({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Padding(
        padding: const EdgeInsetsGeometry.all(16),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            ContentsHeader(
              icon: AppIcons.stack,
              title: "Tech Stacks",
              iconColor: AppColors.purple,
            ),
            SizedBox(height: 20.h),
            BlocBuilder<ProjectBloc, ProjectState>(
              builder: (context, state) {
                var techStacks = state.projectItem?.technology ?? [];
                return Wrap(
                  direction: Axis.horizontal,
                  spacing: 10.w,
                  runSpacing: 15.h,
                  alignment: WrapAlignment.start,
                  children: [
                    for (int i = 0; i < techStacks.length; i++)
                      TechChip(techStack: techStacks[i]),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
