import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolioapp/features/projects/presentation/widgets/project_back_button.dart';
import 'package:myportfolioapp/features/projects/presentation/widgets/project_hero_section.dart';

import '../../../../core/common/footer_section.dart';
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
      bottomNavigationBar: const FooterSection(),

      body: ProjectBody(),
    );
  }
}

class ProjectBody extends StatelessWidget {
  const ProjectBody({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    final bool isDesktop = Responsive.isDesktop(context);
    final double hPad = isMobile
        ? 16
        : isDesktop
        ? 80
        : 40;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: hPad.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            ProjectBackButton(),
            SizedBox(height: 20.h),
            ProjectHeroSection(),
            SizedBox(height: 48.h),
          ],
        ),
      ),
    );
  }
}
