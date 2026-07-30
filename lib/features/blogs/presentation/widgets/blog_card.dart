import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:myportfolioapp/core/app_resources/app_icons.dart';
import 'package:myportfolioapp/core/common/custom_outlined_button.dart';
import 'package:myportfolioapp/core/common/glass_card.dart';
import 'package:myportfolioapp/core/themes/responsive_size.dart';
import 'package:myportfolioapp/core/themes/responsive_text_theme.dart';
import 'package:myportfolioapp/features/blogs/domain/entity/blog_item.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/app_resources/app_images.dart';
import '../pages/blog_details_page.dart';
import 'meta_item.dart';

class BlogCard extends StatelessWidget {
  const BlogCard({super.key, required this.post});

  final BlogItem post;

  @override
  Widget build(BuildContext context) {
    final bool isMobile = context.isMobile;
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Hero(
        tag: 'blog-thumbnail_${post.id}',
        child: GlassCard(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(isMobile ? 16.r : 24.r),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
            child: isMobile
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      thumbnail(isMobile),
                      SizedBox(height: 16.h),
                      info(context),
                      SizedBox(height: 16.h),
                      Align(
                        alignment: Alignment.centerRight,
                        child: readMore(context),
                      ),
                    ],
                  )
                : IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,

                      children: [
                        thumbnail(isMobile),
                        SizedBox(width: 24.w),
                        Expanded(child: info(context)),
                        SizedBox(width: 16.w),
                        Align(
                          alignment: Alignment.topRight,
                          child: readMore(context),
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  Widget thumbnail(bool isMobile) {
    return Container(
      width: isMobile ? double.infinity : 330.w,
      height: isMobile ? 160.h : 210.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: AppColors.primaryBlue, width: 0.4),
      ),
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(10.r),
        child: CachedNetworkImage(
          imageUrl: post.thumbnail,
          fit: BoxFit.cover,
          errorWidget: (context, url, error) =>
              Image.asset(AppImages.placehHolder),
          placeholder: (context, url) => Stack(
            alignment: AlignmentGeometry.center,
            children: [
              Image.asset(AppImages.placehHolder),
              CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }

  Widget info(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(post.categoryName, style: context.fontStyle.bodyLarge),
        SizedBox(height: 8.h),
        Text(
          post.title,
          style: context.fontStyle.headlineSmall?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          post.shortDescription,
          maxLines: 2,
          style: context.fontStyle.bodySmall,
        ),
        SizedBox(height: 16.h),
        Wrap(
          spacing: 20.w,
          runSpacing: 8.h,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            MetaItem(icon: AppIcons.calender, label: post.date),
            MetaItem(icon: AppIcons.minutesIcon, label: post.readTime),
          ],
        ),
      ],
    );
  }

  Widget readMore(BuildContext context) {
    return CustomOutlinedButton(
      onTap: () {
        context.go(BlogDetailsPage.routeFor(post.id));
      },
      label: 'Read More',
    );
  }
}
