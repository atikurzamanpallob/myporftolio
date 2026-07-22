import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolioapp/core/themes/app_colors.dart';
import 'package:myportfolioapp/core/common/glass_card.dart';
import 'package:myportfolioapp/core/themes/responsive_text_theme.dart';

import '../../../dashboard/domain/entity/category_list.dart';
import 'side_bar_heading.dart';

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
            SidebarHeading(title: 'Categories'),
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
                              style: context.fontStyle.labelMedium?.copyWith(
                                color: AppColors.textSecondary,
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
