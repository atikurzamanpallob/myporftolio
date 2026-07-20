import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_resources/app_colors.dart';
import '../app_resources/app_fonts.dart';

void showToast(BuildContext context, String message) {
  final overlay = Overlay.of(context);
  final entry = OverlayEntry(builder: (_) => _CopiedToast(message: message));
  overlay.insert(entry);
  Future.delayed(const Duration(milliseconds: 1500), entry.remove);
}

class _CopiedToast extends StatelessWidget {
  final String message;
  const _CopiedToast({required this.message});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.5,
      left: 0,
      right: 0,
      child: Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: AppColors.accentGreen, width: 0.8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.check_circle_rounded,
                  color: AppColors.accentGreen,
                  size: 16.r,
                ),
                SizedBox(width: 8.w),
                Text(
                  message,
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.white,
                    fontFamily: AppFonts.inter,
                    fontWeight: FontWeight.w500,
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
