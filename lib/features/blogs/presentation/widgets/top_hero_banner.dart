import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolioapp/core/app_resources/app_fonts.dart';
import 'package:myportfolioapp/core/app_resources/app_icons.dart';
import 'package:myportfolioapp/core/app_resources/app_images.dart';
import 'package:myportfolioapp/core/utils/size_helper.dart';
import 'package:myportfolioapp/features/blogs/domain/entity/blog_item.dart';
import 'package:myportfolioapp/features/blogs/presentation/widgets/meta_item.dart';

import '../../../../core/app_resources/app_colors.dart';
import '../../../../core/common/glass_card.dart';
import '../../../../core/utils/responsive.dart';
import 'category_chip.dart';

class HeroBanner extends StatelessWidget {
  const HeroBanner({required this.detail, super.key});
  final BlogItem? detail;

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    bool isTab = Responsive.isTablet(context);
    return Hero(
      tag: 'blog-thumbnail',
      child: GlassCard(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: SizedBox(
            height: isMobile ? 235.h : 300.h,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CachedNetworkImage(
                  imageUrl: detail?.thumbnail ?? "",
                  fit: BoxFit.cover,
                  errorWidget: (_, _, _) =>
                      Image.asset(AppImages.placehHolder, fit: BoxFit.cover),
                  placeholder: (_, _) =>
                      Image.asset(AppImages.placehHolder, fit: BoxFit.cover),
                ),

                DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      stops: const [0.0, 0.5, 1.0],
                      colors: [
                        Colors.transparent,
                        AppColors.background.withValues(alpha: 0.75),
                        AppColors.background.withValues(alpha: 0.97),
                      ],
                    ),
                  ),
                ),
                if (isMobile)
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: const [0.4, 1.0],
                        colors: [
                          Colors.transparent,
                          AppColors.background.withValues(alpha: 0.9),
                        ],
                      ),
                    ),
                  ),
                Padding(
                  padding: EdgeInsets.all(20.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CategoryChip(label: detail?.categoryName ?? ""),
                          SizedBox(height: 15.h),
                          SizedBox(
                            width: isMobile ? double.infinity : 550.w,
                            child: Text(
                              detail?.title ?? "",
                              style: TextStyle(
                                fontSize: isMobile ? 14.sp : 20.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                height: 1,
                                letterSpacing: -0.3,
                              ),
                            ),
                          ),
                          SizedBox(height: 10.h),
                          SizedBox(
                            width: isMobile ? double.infinity : 550.w,
                            child: Text(
                              detail?.shortDescription ?? "",
                              maxLines: 2,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: SizeHelper.getBodyFontSize(
                                  isMobile: isMobile,
                                  isTab: isTab,
                                ),
                                color: AppColors.textSecondary,
                                fontFamily: AppFonts.inter,
                                height: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 10.h),
                      Wrap(
                        spacing: 20.w,
                        runSpacing: 8.h,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          MetaItem(
                            icon: AppIcons.calender,
                            label: detail?.date ?? "",
                            isMobile: isMobile,
                            isTab: isTab,
                          ),
                          MetaItem(
                            icon: AppIcons.minutesIcon,
                            label: detail?.readTime ?? "",
                            isMobile: isMobile,
                            isTab: isTab,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
