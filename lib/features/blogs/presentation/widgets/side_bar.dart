import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolioapp/core/utils/responsive.dart';
import '../bloc/blog_details_bloc.dart';
import '../bloc/blog_state.dart';
import 'author_card.dart';
import 'categories_card.dart';
import 'recent_post_card.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    return BlocBuilder<BlogDetailsBloc, BlogDetailsState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AuthorCard(),
            SizedBox(height: 16.h),
            CategoriesCard(categories: state.category ?? []),
            SizedBox(height: 16.h),
            RecentPostsCard(posts: state.recentPosts ?? []),
            if (isMobile) SizedBox(height: 8.h),
          ],
        );
      },
    );
  }
}
