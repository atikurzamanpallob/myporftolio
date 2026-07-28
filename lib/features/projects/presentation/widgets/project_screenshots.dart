import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolioapp/core/themes/app_colors.dart';

import '../../../../core/app_resources/app_icons.dart';
import '../../../../core/common/glass_card.dart';
import '../bloc/project_bloc.dart';
import '../bloc/project_state.dart';
import 'contents_header.dart';

class ProjectScreenshots extends StatelessWidget {
  const ProjectScreenshots({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Padding(
        padding: const EdgeInsetsGeometry.all(16),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            ContentsHeader(
              icon: AppIcons.screenshots,
              title: "Screenshots",
              iconColor: AppColors.magenta,
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: BlocBuilder<ProjectBloc, ProjectState>(
                builder: (context, state) {
                  return Wrap(children: []);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
