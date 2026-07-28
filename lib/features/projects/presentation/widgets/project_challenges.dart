import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          children: [
            ContentsHeader(
              icon: AppIcons.challenges,
              title: "Challenges",
              iconColor: AppColors.danger,
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: BlocBuilder<ProjectBloc, ProjectState>(
                builder: (context, state) {
                  var text = state.projectDetails?.challenges ?? "";
                  return Text(
                    text,
                    style: context.fontStyle.bodySmall?.copyWith(height: 1.5),
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
