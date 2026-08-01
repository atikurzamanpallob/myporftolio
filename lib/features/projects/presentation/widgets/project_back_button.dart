import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:myportfolioapp/core/themes/responsive_size.dart';
import 'package:myportfolioapp/features/projects/presentation/pages/projects_page.dart';

import '../../../../core/themes/app_colors.dart';

class ProjectBackButton extends StatelessWidget {
  const ProjectBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          context.go(ProjectsPage.route);
        },
        child: Container(
          padding: EdgeInsets.all(5.r),
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: BorderRadius.circular(6.r),
            border: Border.all(color: AppColors.divider, width: 1),
          ),
          child: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: context.isMobile ? 15.r : 20.r,
          ),
        ),
      ),
    );
  }
}
