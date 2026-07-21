import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolioapp/core/app_resources/app_colors.dart';
import 'package:myportfolioapp/core/common/glass_card.dart';
import 'package:myportfolioapp/core/common/nav_bar.dart';
import 'package:myportfolioapp/core/common/navigation.dart';
import 'package:myportfolioapp/core/utils/responsive.dart';
import 'package:myportfolioapp/features/blogs/domain/entity/blog_details_item.dart';
import 'package:myportfolioapp/features/blogs/presentation/bloc/blog_details_bloc.dart';
import 'package:myportfolioapp/features/blogs/presentation/bloc/blog_state.dart';
import 'package:myportfolioapp/features/blogs/presentation/widgets/back_button.dart';
import '../../../home/presentation/pages/footer_section.dart';
import '../widgets/description_item_card.dart';
import '../widgets/side_bar.dart';
import '../widgets/top_hero_banner.dart';

class BlogDetailsPage extends StatelessWidget {
  const BlogDetailsPage({super.key, required this.blogId});

  final int blogId;
  static const String route = '/blogs/:id';
  static const String activeItem = 'Blogs';
  static String routeFor(int id) => '/blogs/$id';

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
      body: BlogDetailBody(),
    );
  }
}

class BlogDetailBody extends StatelessWidget {
  const BlogDetailBody({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    final bool isDesktop = Responsive.isDesktop(context);
    final double hPad = isMobile
        ? 16
        : isDesktop
        ? 80
        : 40;

    return BlocBuilder<BlogDetailsBloc, BlogDetailsState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: hPad.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                BlogBackButton(),
                SizedBox(height: 20.h),
                if (isDesktop)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 7, child: MainContent()),
                      SizedBox(width: 24.w),
                      SizedBox(width: 290.w, child: Sidebar()),
                    ],
                  )
                else
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MainContent(),
                      SizedBox(height: 32.h),
                      Sidebar(),
                    ],
                  ),
                SizedBox(height: 48.h),
                const FooterSection(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlogDetailsBloc, BlogDetailsState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeroBanner(detail: state.blog),
            SizedBox(height: 20.h),
            GlassCard(
              child: Padding(
                padding: EdgeInsets.all(24.r),
                child: ContentSections(sections: state.sections ?? []),
              ),
            ),
          ],
        );
      },
    );
  }
}

class ContentSections extends StatelessWidget {
  const ContentSections({required this.sections, super.key});
  final List<BlogDetailsItem> sections;

  @override
  Widget build(BuildContext context) {
    bool isMobile = Responsive.isMobile(context);
    bool isTab = Responsive.isTablet(context);
    return ListView.builder(
      shrinkWrap: true,
      itemCount: sections.length,
      itemBuilder: (context, index) {
        return DescriptionItemCard(
          element: sections[index],
          isMobile: isMobile,
          isTab: isTab,
        );
      },
    );
  }
}
