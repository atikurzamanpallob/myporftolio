import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_resources/app_colors.dart';
import '../../../../core/app_resources/app_fonts.dart';
import '../../data/models/blog_models.dart';

/// Row of filter pills (All, Flutter, Firebase, Node, Problem Solving).
/// Wraps onto multiple lines on narrow screens instead of overflowing.
class BlogFilterBar extends StatelessWidget {
  const BlogFilterBar({
    super.key,
    required this.selected,
    required this.onSelected,
    this.alignment = WrapAlignment.start,
  });

  final BlogCategory selected;
  final ValueChanged<BlogCategory> onSelected;
  final WrapAlignment alignment;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: alignment,
      spacing: 10.w,
      runSpacing: 10.h,
      children: [
        for (final category in BlogCategory.values)
          _FilterPill(
            label: category.label,
            active: category == selected,
            onTap: () => onSelected(category),
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
