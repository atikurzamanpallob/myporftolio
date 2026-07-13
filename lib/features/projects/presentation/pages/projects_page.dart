import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_resources/app_colors.dart';
import '../../../../core/common/nav_bar.dart';
import '../../../../core/common/navigation.dart';
import '../../../../core/utils/responsive.dart';
import '../../../home/presentation/pages/footer_section.dart';
import '../widgets/projects_hero_header.dart';
import 'projects_list_section.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  static const String activeItem = 'Projects';
  static const String route = "/projects";

  @override
  Widget build(BuildContext context) {
    final bool showDrawer = !Responsive.isDesktop(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: NavBar(
        activeItem: activeItem,
        onItemTap: (item) => navigateToSection(context, item),
      ),
      endDrawer: showDrawer
          ? NavDrawer(
              activeItem: activeItem,
              onItemTap: (item) => navigateToSection(context, item),
            )
          : null,
      body: Column(
        children: [
          const ProjectsHeroHeader(),
          SizedBox(height: 8.h),
          Expanded(child: ProjectsListSection()),
          SizedBox(height: 20.h),
          const FooterSection(),
        ],
      ),
    );
  }
}
