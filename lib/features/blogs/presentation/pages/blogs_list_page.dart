import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolioapp/core/app_resources/app_images.dart';
import 'package:myportfolioapp/features/blogs/domain/entity/blog_item.dart';
import 'package:myportfolioapp/features/blogs/presentation/bloc/blog_bloc.dart';
import 'package:myportfolioapp/features/blogs/presentation/bloc/blog_event.dart';
import 'package:myportfolioapp/features/blogs/presentation/bloc/blog_state.dart';
import 'package:myportfolioapp/features/dashboard/domain/entity/category_list.dart';

import '../../../../core/utils/responsive.dart';
import '../widgets/blog_card.dart';
import '../widgets/blog_filter_bar.dart';

class BlogsListSection extends StatefulWidget {
  const BlogsListSection({super.key});

  @override
  State<BlogsListSection> createState() => _BlogsListSectionState();
}

class _BlogsListSectionState extends State<BlogsListSection> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 200) {
        context.read<BlogBloc>().add(LoadMoreBlogEvent());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16.w : 40.w,
        vertical: 5.h,
      ),
      child: BlocBuilder<BlogBloc, BlogState>(
        builder: (context, state) {
          List<BlogItem> list = state.blogs;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlogFilterBar(
                selected: state.currentCategory,
                categoryList: state.category ?? [Category(name: "All", id: -1)],
                alignment: isMobile ? WrapAlignment.start : WrapAlignment.end,
                onSelected: (category) {
                  context.read<BlogBloc>().add(
                    BlogFetchEvent(categoryId: category),
                  );
                },
              ),
              SizedBox(height: 24.h),
              state.isBlogLoading
                  ? Expanded(child: Center(child: CircularProgressIndicator()))
                  : list.isEmpty
                  ? Expanded(
                      child: Image.asset(
                        width: double.infinity,
                        AppImages.blogPlaceholder,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Expanded(
                      child: ListView.builder(
                        controller: scrollController,
                        itemCount: list.length,
                        shrinkWrap: true,
                        itemBuilder: (ctx, i) {
                          return BlogCard(post: list[i]);
                        },
                      ),
                    ),
            ],
          );
        },
      ),
    );
  }
}
