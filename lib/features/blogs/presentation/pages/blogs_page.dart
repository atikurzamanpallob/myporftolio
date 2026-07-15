import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolioapp/core/app_resources/app_images.dart';
import 'package:myportfolioapp/core/common/hero_header.dart';
import 'package:myportfolioapp/features/blogs/presentation/pages/blogs_list_page.dart';

import '../../../../core/app_resources/app_colors.dart';
import '../../../../core/common/nav_bar.dart';
import '../../../../core/common/navigation.dart';
import '../../../../core/utils/responsive.dart';
import '../../../home/presentation/pages/footer_section.dart';

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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            const HeroHeader(
              heading1: 'Thoughts , Learning &',
              heading2: '\nEverything',
              bodyText:
                  'Sharing knowledge ,tutorials and insights on Flutter '
                  'development ,best practices and more.',
              backgroundImage: AppImages.blogImage,
            ),
            SizedBox(height: 8.h),
            Expanded(child: BlogsListSection()),
            SizedBox(height: 20.h),
            const FooterSection(),
          ],
        ),
      ),
    );
  }
}
