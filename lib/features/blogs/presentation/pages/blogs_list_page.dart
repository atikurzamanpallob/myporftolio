import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_resources/app_colors.dart';
import '../../../../core/app_resources/app_fonts.dart';
import '../../../../core/utils/responsive.dart';
import '../../data/models/blog_models.dart';
import '../widgets/blog_card.dart';
import '../widgets/blog_filter_bar.dart';

class BlogsListSection extends StatefulWidget {
  const BlogsListSection({super.key});

  @override
  State<BlogsListSection> createState() => _BlogsListSectionState();
}

class _BlogsListSectionState extends State<BlogsListSection> {
  BlogCategory _selected = BlogCategory.all;

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    final filtered = kBlogPosts.where((p) => p.matches(_selected)).toList();

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16.w : 40.w,
        vertical: 5.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlogFilterBar(
            selected: _selected,
            alignment: isMobile ? WrapAlignment.start : WrapAlignment.end,
            onSelected: (category) => setState(() => _selected = category),
          ),
          SizedBox(height: 24.h),
          if (filtered.isEmpty)
            Padding(
              padding: EdgeInsets.symmetric(vertical: 40.h),
              child: Center(
                child: Text(
                  'No post in this category yet.',
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontFamily: AppFonts.inter,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
            )
          else
            Expanded(
              child: ListView.builder(
                itemCount: filtered.length,
                shrinkWrap: true,
                itemBuilder: (ctx, i) {
                  return BlogCard(post: filtered[i]);
                },
              ),
            ),
        ],
      ),
    );
  }
}
