import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolioapp/core/common/hero_header.dart';
import '../../../../core/common/nav_bar.dart';
import '../../../../core/common/navigation.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../core/common/footer_section.dart';
import 'projects_list_section.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  static const String activeItem = 'Projects';
  static const String route = "/projects";

  @override
  Widget build(BuildContext context) {
    final bool showDrawer = !Responsive.isDesktop(context);

    return Scaffold(
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

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            const HeroHeader(
              heading1: 'My ',
              heading2: 'Projects',
              bodyText:
                  'Here are the projects i have worked on so far . Each '
                  'projects reflects my focus on design ,\nperformance and '
                  'great user experience',
            ),
            SizedBox(height: 8.h),
            Expanded(child: ProjectsListSection()),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
