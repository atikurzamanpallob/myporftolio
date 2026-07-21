import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolioapp/core/app_resources/app_colors.dart';
import 'package:myportfolioapp/core/app_resources/app_fonts.dart';
import 'package:myportfolioapp/core/common/glass_card.dart';

import '../../../dashboard/domain/entity/category_list.dart';

class CategoriesCard extends StatelessWidget {
  final List<Category> categories;

  const CategoriesCard({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Padding(
        padding: EdgeInsets.all(20.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SidebarHeading(title: 'Categories'),
            SizedBox(height: 12.h),
            ...categories.asMap().entries.map((entry) {
              final isLast = entry.key == categories.length - 1;
              return Column(
                children: [
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Row(
                        children: [
                          Container(
                            width: 5.w,
                            height: 5.h,
                            margin: EdgeInsets.only(right: 10.w),
                            decoration: const BoxDecoration(
                              color: AppColors.primaryBlue,
                              shape: BoxShape.circle,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              entry.value.name,
                              style: TextStyle(
                                fontSize: 13.sp,
                                color: AppColors.textSecondary,
                                fontFamily: AppFonts.inter,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.chevron_right_rounded,
                            size: 16.r,
                            color: AppColors.textMuted,
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (!isLast)
                    Divider(
                      height: 1,
                      color: AppColors.divider.withValues(alpha: 0.4),
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

class _SidebarHeading extends StatelessWidget {
  const _SidebarHeading({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 3.w,
          height: 16.h,
          margin: EdgeInsets.only(right: 8.w),
          decoration: BoxDecoration(
            color: AppColors.primaryBlue,
            borderRadius: BorderRadius.circular(2.r),
          ),
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
