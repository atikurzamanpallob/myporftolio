import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myportfolioapp/core/app_resources/app_icons.dart';
import 'package:myportfolioapp/core/common/glass_card.dart';

import '../../../../core/app_resources/app_colors.dart';
import '../../../../core/app_resources/app_fonts.dart';
import '../../../../core/utils/responsive.dart';
import '../../data/models/blog_models.dart';

class BlogCard extends StatelessWidget {
  const BlogCard({super.key, required this.post});

  final BlogPost post;

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);

    final thumbnail = Container(
      width: isMobile ? double.infinity : 330.w,
      height: isMobile ? 160.h : 170.h,
      decoration: BoxDecoration(
        color: AppColors.iconCircleFill,
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(color: AppColors.divider, width: 1),
      ),
      child: Center(
        child: SvgPicture.asset(
          post.thumbnailIcon,
          width: isMobile ? 90.w : 110.w,
        ),
      ),
    );

    final info = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          post.category.label,
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
          post.excerpt,
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
            _MetaItem(icon: AppIcons.calender, label: post.date),
            _MetaItem(icon: AppIcons.minutesIcon, label: post.readTime),
          ],
        ),
      ],
    );

    final readMore = InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Full blog post coming soon')),
        );
      },
      borderRadius: BorderRadius.circular(6.r),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Read More',
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryBlue,
            ),
          ),
          SizedBox(width: 4.w),
          Icon(
            Icons.chevron_right_rounded,
            size: 25.r,
            color: AppColors.primaryBlue,
          ),
        ],
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
                    crossAxisAlignment: CrossAxisAlignment.start,
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

class _MetaItem extends StatelessWidget {
  const _MetaItem({required this.icon, required this.label});
  final String icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: .min,
      crossAxisAlignment: .center,
      children: [
        SvgPicture.asset(icon, height: 20.h, width: 20.w),
        SizedBox(width: 6.w),
        Text(
          label,
          style: TextStyle(
            fontSize: 12.sp,
            fontFamily: AppFonts.inter,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
