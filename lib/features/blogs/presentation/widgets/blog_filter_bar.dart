import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolioapp/features/dashboard/domain/entity/category_list.dart';

import '../../../../core/app_resources/app_colors.dart';
import '../../../../core/app_resources/app_fonts.dart';

class BlogFilterBar extends StatelessWidget {
  const BlogFilterBar({
    super.key,
    required this.selected,
    required this.onSelected,
    required this.categoryList,
    this.alignment = WrapAlignment.start,
  });

  final int selected;
  final List<Category> categoryList;
  final ValueChanged<int> onSelected;
  final WrapAlignment alignment;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: alignment,
      spacing: 10.w,
      runSpacing: 10.h,
      children: [
        for (final category in categoryList)
          _FilterPill(
            label: category.name,
            active: category.id == selected,
            onTap: () => onSelected(category.id),
          ),
      ],
    );
  }
}

class _FilterPill extends StatelessWidget {
  const _FilterPill({
    required this.label,
    required this.active,
    required this.onTap,
  });

  final String label;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10.r),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: active ? AppColors.primaryBlue : Colors.transparent,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: active ? AppColors.primaryBlue : AppColors.divider,
            width: 1.2,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13.sp,
            fontFamily: AppFonts.inter,
            fontWeight: FontWeight.w600,
            color: active ? Colors.white : AppColors.textSecondary,
          ),
        ),
      ),
    );
  }
}
