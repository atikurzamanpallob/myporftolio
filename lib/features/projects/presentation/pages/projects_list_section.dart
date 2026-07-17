import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolioapp/features/projects/domain/entity/project_item.dart';
import 'package:myportfolioapp/features/projects/presentation/bloc/project_bloc.dart';
import 'package:myportfolioapp/features/projects/presentation/bloc/project_event.dart';
import 'package:myportfolioapp/features/projects/presentation/bloc/project_state.dart';

import '../../../../core/app_resources/app_fonts.dart';
import '../../../../core/app_resources/app_colors.dart';
import '../../../../core/utils/responsive.dart';
import '../widgets/project_card.dart';
import '../widgets/project_filter_bar.dart';

class ProjectsListSection extends StatefulWidget {
  const ProjectsListSection({super.key});

  @override
  State<ProjectsListSection> createState() => _ProjectsListSectionState();
}

class _ProjectsListSectionState extends State<ProjectsListSection> {
  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    return BlocBuilder<ProjectBloc, ProjectState>(
      builder: (context, state) {
        List<ProjectItem> filtered = state.filtered;
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 16.w : 40.w,
            vertical: 5.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProjectFilterBar(
                selected: state.currentFilter,
                alignment: isMobile ? WrapAlignment.start : WrapAlignment.end,
                onSelected: (option) {
                  context.read<ProjectBloc>().add(
                    ProjectFilterEvent(currentOption: option),
                  );
                },
              ),

              SizedBox(height: 24.h),
              (state.isLoading ?? false)
                  ? Expanded(child: Center(child: CircularProgressIndicator()))
                  : SizedBox.shrink(),
              state.filtered.isEmpty
                  ? Padding(
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
                  : Expanded(
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
      },
    );
  }
}
