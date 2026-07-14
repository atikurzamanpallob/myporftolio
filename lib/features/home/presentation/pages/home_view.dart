import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolioapp/features/home/presentation/bloc/home_bloc.dart';
import 'package:myportfolioapp/features/home/presentation/bloc/home_event.dart';
import '../../../../core/app_resources/app_colors.dart';
import '../../../../core/common/navigation.dart';
import '../../../../core/utils/responsive.dart';
import 'about_section.dart';
import 'footer_section.dart';
import 'top_section.dart';
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
    context.read<HomeBloc>().add(HomeContactEvent());
    context.read<HomeBloc>().add(HomeInfoEvent());
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TopSection(),
            SizedBox(height: 7.h),
            const AboutSection(),
            SizedBox(height: 20.h),
            const WhatIDoSection(),
            const FooterSection(),
          ],
        ),
      ),
    );
  }
}
