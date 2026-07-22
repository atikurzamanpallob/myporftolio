import 'package:flutter/material.dart';

import '../../../../core/common/nav_bar.dart';
import '../../../../core/common/navigation.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/utils/responsive.dart';

class ProjectDetailsPage extends StatelessWidget {
  const ProjectDetailsPage({super.key, required this.projectId});

  final int projectId;
  static const String route = '/projects/:id';
  static const String activeItem = 'Projects';
  static String routeFor(int id) => '/projects/$id';

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
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColors.accentBlueLight,
      ),
    );
  }
}
