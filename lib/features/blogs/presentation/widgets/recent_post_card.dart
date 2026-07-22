import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:myportfolioapp/core/themes/responsive_text_theme.dart';
import 'package:myportfolioapp/features/blogs/presentation/pages/blog_details_page.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/app_resources/app_images.dart';
import '../../../../core/common/glass_card.dart';
import '../../domain/entity/blog_item.dart';
import 'side_bar_heading.dart';

class RecentPostsCard extends StatelessWidget {
  const RecentPostsCard({super.key, required this.posts});
  final List<BlogItem> posts;

  @override
  Widget build(BuildContext context) {
    final recent = posts.take(4).toList();

    return GlassCard(
      child: Padding(
        padding: EdgeInsets.all(20.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SidebarHeading(title: 'Recent Posts'),
            SizedBox(height: 14.h),
            ...recent.asMap().entries.map((entry) {
              final isLast = entry.key == recent.length - 1;
              return Column(
                children: [
                  RecentPostItem(post: entry.value),
                  if (!isLast)
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.h),
                      child: Divider(
                        height: 1,
                        color: AppColors.divider.withValues(alpha: 0.4),
                      ),
                    ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}

class RecentPostItem extends StatelessWidget {
  const RecentPostItem({required this.post, super.key});
  final BlogItem post;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => context.push(BlogDetailsPage.routeFor(post.id)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6.r),
                child: SizedBox(
                  width: 58.w,
                  height: 46.h,
                  child: CachedNetworkImage(
                    imageUrl: post.thumbnail,
                    fit: BoxFit.cover,
                    errorWidget: (_, _, _) =>
                        Image.asset(AppImages.placehHolder, fit: BoxFit.cover),
                    placeholder: (_, _) =>
                        Image.asset(AppImages.placehHolder, fit: BoxFit.cover),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: context.fontStyle.labelLarge?.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time_rounded,
                          size: 11.r,
                          color: AppColors.textMuted,
                        ),
                        SizedBox(width: 4.w),
                        Text(post.date, style: context.fontStyle.labelSmall),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
