import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/app_resources/app_images.dart';
import '../../../../core/common/hero_header.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/common/navigation.dart';
import '../../../../core/utils/responsive.dart';
import 'about_section.dart';
import 'footer_section.dart';
import '../../../../core/common/nav_bar.dart';
import 'what_i_do_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
  static const String route = "/";
}

class _HomePageState extends State<HomePage> {
  String activeItem = 'Home';
  @override
  void initState() {
    super.initState();
  }

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
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        children: [
          const HeroHeader(
            heading1: 'I Build Beautiful & High\nPerformance apps With ',
            heading2: 'Flutter',
            bodyText:
                'I create cross-platform applications that are fast, scalable '
                '\n& provide smooth user experience.',
            backgroundImage: AppImages.homeImage,
          ),
          // const TopSection(),
          SizedBox(height: 7.h),
          const AboutSection(),
          SizedBox(height: 20.h),
          const WhatIDoSection(),
          const FooterSection(),
        ],
      ),
    );
  }
}
