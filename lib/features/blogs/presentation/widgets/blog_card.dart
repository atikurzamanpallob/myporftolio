import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:myportfolioapp/core/app_resources/app_icons.dart';
import 'package:myportfolioapp/core/common/glass_card.dart';
import 'package:myportfolioapp/features/blogs/domain/entity/blog_item.dart';

import '../../../../core/app_resources/app_colors.dart';
import '../../../../core/app_resources/app_fonts.dart';
import '../../../../core/app_resources/app_images.dart';
import '../../../../core/utils/responsive.dart';
import '../pages/blog_details_page.dart';
import 'meta_item.dart';

class BlogCard extends StatelessWidget {
  const BlogCard({super.key, required this.post});

  final BlogItem post;

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);

    final thumbnail = Container(
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

    final info = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          post.categoryName,
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryBlue,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          post.title,
          style: TextStyle(
            fontSize: isMobile ? 17.sp : 20.sp,
            fontWeight: FontWeight.w700,
            color: Colors.white,
            height: 1.25,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          post.shortDescription,
          style: TextStyle(
            fontSize: 12.5.sp,
            fontFamily: AppFonts.inter,
            color: AppColors.textSecondary,
            height: 1.4,
          ),
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

    final readMore = InkWell(
      onTap: () {
        context.push(BlogDetailsPage.routeFor(post.id));
      },
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: AppColors.primaryBlue, width: 0.3),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Read More',
              style: TextStyle(
                fontSize: 12.sp,
                fontFamily: AppFonts.inter,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryBlue,
              ),
            ),
            SizedBox(width: 10.w),
            Icon(
              Icons.arrow_forward_ios,
              size: 15.r,
              color: AppColors.primaryBlue,
            ),
          ],
        ),
      ),
    );

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: GlassCard(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(isMobile ? 16.r : 24.r),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
          child: isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    thumbnail,
                    SizedBox(height: 16.h),
                    info,
                    SizedBox(height: 16.h),
                    Align(alignment: Alignment.centerRight, child: readMore),
                  ],
                )
              : IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [
                      thumbnail,
                      SizedBox(width: 24.w),
                      Expanded(child: info),
                      SizedBox(width: 16.w),
                      Align(alignment: Alignment.topRight, child: readMore),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
