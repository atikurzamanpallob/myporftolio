import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolioapp/core/themes/responsive_text_theme.dart';

class EmploymentBadge extends StatelessWidget {
  const EmploymentBadge({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final Color color = const Color(0xFF6FA8DC);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(color: color.withValues(alpha: 0.5), width: 1),
      ),
      child: Text(
        label,
        style: context.fontStyle.labelMedium?.copyWith(color: color),
      ),
    );
  }
}
