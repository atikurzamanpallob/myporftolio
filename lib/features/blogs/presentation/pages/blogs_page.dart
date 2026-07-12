import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolioapp/features/blogs/presentation/pages/blogs_list_page.dart';

import '../../../../core/app_resources/app_colors.dart';
import '../../../../core/common/nav_bar.dart';
import '../../../../core/common/navigation.dart';
import '../../../../core/utils/responsive.dart';
import '../../../home/presentation/pages/footer_section.dart';
import '../widgets/blogs_hero_header.dart';

class BlogsPage extends StatelessWidget {
  const BlogsPage({super.key});

  static const String activeItem = 'Blogs';
  static const String route = "/blogs";

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
          const BlogsHeroHeader(),
          SizedBox(height: 8.h),
          Expanded(child: BlogsListSection()),
          SizedBox(height: 20.h),
          const FooterSection(),
        ],
      ),
    );
  }
}
