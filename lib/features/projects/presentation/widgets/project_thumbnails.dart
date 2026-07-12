import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_resources/app_colors.dart';

/// A stylized pair of "phone screen" placeholders used until real project
/// screenshots are available. Swap this out for `Image.asset`/`Image.network`
/// once you have actual screenshots for each project.
class ProjectThumbnails extends StatelessWidget {
  const ProjectThumbnails({
    super.key,
    required this.icon,
    this.width = 130,
    this.height = 210,
  });

  final IconData icon;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w + 18.w,
      height: height.h,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 14.h,
            child: _PhoneFrame(
              width: width.w,
              height: height.h - 14.h,
              icon: icon,
              muted: true,
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: _PhoneFrame(
              width: width.w,
              height: height.h - 14.h,
              icon: icon,
              muted: false,
            ),
          ),
        ],
      ),
    );
  }
}

class _PhoneFrame extends StatelessWidget {
  const _PhoneFrame({
    required this.width,
    required this.height,
    required this.icon,
    required this.muted,
  });

  final double width;
  final double height;
  final IconData icon;
  final bool muted;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(3.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: AppColors.divider, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.35),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: muted
                ? [AppColors.iconCircleFill, AppColors.cardBackground]
                : [
                    AppColors.primaryBlue.withValues(alpha: 0.85),
                    AppColors.background,
                  ],
          ),
        ),
        child: Center(
          child: Icon(
            icon,
            color: Colors.white.withValues(alpha: muted ? 0.5 : 0.9),
            size: 30.r,
          ),
        ),
      ),
    );
  }
}
