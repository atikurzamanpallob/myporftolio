// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolioapp/core/app_resources/app_images.dart';
import 'package:myportfolioapp/core/common/hero_header.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/common/nav_bar.dart';
import '../../../../core/common/navigation.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../core/common/footer_section.dart';
import 'soft_skills_section.dart';
import 'technical_skills_section.dart';

class SkillsPage extends StatelessWidget {
  SkillsPage({super.key});

  static const String activeItem = 'Skills';
  static const String route = "/skills";

  List<Widget> items = [
    const HeroHeader(
      heading1: 'My ',
      heading2: 'Skills',
      bodyText:
          'Here are the tools and technology that i use to design, build , ship high performance \nfrontend (web, mobile) and backend '
          'applications.',
      backgroundImage: AppImages.skillImage,
    ),
    SizedBox(height: 8.h),
    const TechnicalSkillsSection(),
    SizedBox(height: 8.h),
    const SoftSkillsSection(),
    SizedBox(height: 20.h),
  ];

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
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return items[index];
        },
      ),
    );
  }
}
