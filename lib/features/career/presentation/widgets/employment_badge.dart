import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmploymentBadge extends StatelessWidget {
  const EmploymentBadge({super.key, required this.label});

  final String label;

  bool get _isFreelance => label.toLowerCase().contains('freelance');

  @override
  Widget build(BuildContext context) {
    final Color color = _isFreelance
        ? const Color(0xFF29E0A6)
        : const Color(0xFF6FA8DC);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(color: color.withValues(alpha: 0.5), width: 1),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11.sp,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }
}
