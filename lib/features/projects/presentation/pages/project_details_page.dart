import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolioapp/core/themes/responsive_size.dart';
import 'package:myportfolioapp/features/projects/presentation/widgets/page_contents_card.dart';
import 'package:myportfolioapp/features/projects/presentation/widgets/project_back_button.dart';
import 'package:myportfolioapp/features/projects/presentation/pages/project_details_item_list.dart';
import 'package:myportfolioapp/features/projects/presentation/widgets/project_hero_section.dart';

import '../../../../core/common/footer_section.dart';
import '../../../../core/common/nav_bar.dart';
import '../../../../core/common/navigation.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/utils/responsive.dart';

List<String> items = [
  "Overview",
  "Screenshots",
  "Tech Stacks",
  "Key Features",
  "Challenges",
  "Solutions",
];

class ProjectDetailsPage extends StatelessWidget {
  const ProjectDetailsPage({super.key, required this.projectId});

  final int projectId;
  static const String route = '/projects/:id';
  static const String activeItem = 'Projects';
  static String routeFor(int id) => '/projects/$id';

  @override
  Widget build(BuildContext context) {
    final bool showDrawer = !Responsive.isDesktop(context);
    final double hPad = context.isMobile
        ? 16
        : context.isDesktop
        ? 80
        : 40;
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

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: hPad.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              ProjectBackButton(),
              SizedBox(height: 20.h),
              ProjectHeroSection(projectId: projectId),
              SizedBox(height: 20.h),
              context.isMobile ? mobileContent() : desktopContent(),
              SizedBox(height: 48.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget desktopContent() {
    return Row(
      crossAxisAlignment: .start,
      children: [
        SizedBox(
          width: 150.w,
          child: PageContentsCard(contents: items),
        ),
        SizedBox(width: 10.w),
        Expanded(child: ProjectDetailsItemList()),
      ],
    );
  }

  Widget mobileContent() {
    return Column(
      children: [
        PageContentsCard(contents: items),
        SizedBox(height: 20.h),
        ProjectDetailsItemList(),
      ],
    );
  }
}
