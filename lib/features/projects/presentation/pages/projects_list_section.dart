import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_resources/app_fonts.dart';
import '../../../../core/app_resources/app_colors.dart';
import '../../../../core/utils/responsive.dart';
import '../../data/models/project_models.dart';
import '../widgets/project_card.dart';
import '../widgets/project_filter_bar.dart';

/// Holds the currently selected filter and renders the pill bar plus the
/// matching list of [ProjectCard]s.
class ProjectsListSection extends StatefulWidget {
  const ProjectsListSection({super.key});

  @override
  State<ProjectsListSection> createState() => _ProjectsListSectionState();
}

class _ProjectsListSectionState extends State<ProjectsListSection> {
  ProjectCategory _selected = ProjectCategory.all;

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    final filtered = kProjects
        .where((project) => project.matches(_selected))
        .toList();

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16.w : 40.w,
        vertical: 5.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProjectFilterBar(
            selected: _selected,
            alignment: isMobile ? WrapAlignment.start : WrapAlignment.end,
            onSelected: (category) => setState(() => _selected = category),
          ),
          SizedBox(height: 24.h),
          if (filtered.isEmpty)
            Padding(
              padding: EdgeInsets.symmetric(vertical: 40.h),
              child: Center(
                child: Text(
                  'No projects in this category yet.',
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontFamily: AppFonts.inter,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
            )
          else
            Expanded(
              child: ListView.builder(
                itemCount: filtered.length,
                shrinkWrap: true,
                itemBuilder: (ctx, i) {
                  return ProjectCard(project: filtered[i]);
                },
              ),
            ),
        ],
      ),
    );
  }
}
