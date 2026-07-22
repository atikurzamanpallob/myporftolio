import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolioapp/features/dashboard/domain/entity/category_list.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/responsive_text_theme.dart';

class ProjectFilterBar extends StatelessWidget {
  const ProjectFilterBar({
    super.key,
    required this.selected,
    required this.onSelected,
    this.alignment = WrapAlignment.end,
  });

  final int selected;
  final ValueChanged<int> onSelected;
  final WrapAlignment alignment;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: alignment,
      spacing: 10.w,
      runSpacing: 10.h,
      children: [
        for (final project in projectOptions)
          _FilterPill(
            label: project.name,
            active: project.id == selected,
            onTap: () => onSelected(project.id),
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
          style: context.fontStyle.bodyMedium?.copyWith(
            color: active ? Colors.white : AppColors.textSecondary,
          ),
        ),
      ),
    );
  }
}
