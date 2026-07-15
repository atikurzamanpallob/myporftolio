// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_resources/app_colors.dart';
import '../../../../core/common/nav_bar.dart';
import '../../../../core/common/navigation.dart';
import '../../../../core/utils/responsive.dart';
import '../../../home/presentation/pages/footer_section.dart';
import '../widgets/career_hero_header.dart';
import '../widgets/education_certification_row.dart';
import '../widgets/work_timeline.dart';

class CareerPage extends StatelessWidget {
  CareerPage({super.key});

  static const String activeItem = 'Career';
  static const String route = "/career";

  List<Widget> items = [
    const CareerHeroHeader(),
    SizedBox(height: 8.h),
    const WorkTimeline(),
    SizedBox(height: 32.h),
    const EducationCertificationRow(),
    SizedBox(height: 20.h),
    const FooterSection(),
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
