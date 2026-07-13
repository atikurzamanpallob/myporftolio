import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/app_resources/app_colors.dart';
import '../../../../core/app_resources/app_fonts.dart';
import '../../data/models/contact_models.dart';

class TrustBadgesColumn extends StatelessWidget {
  const TrustBadgesColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final badge in kTrustBadges)
          Padding(
            padding: EdgeInsets.only(bottom: 18.h),
            child: _TrustBadgeTile(badge: badge),
          ),
      ],
    );
  }
}

class _TrustBadgeTile extends StatelessWidget {
  const _TrustBadgeTile({required this.badge});
  final TrustBadge badge;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 48.r,
          height: 48.r,
          padding: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
            color: AppColors.iconCircleFill,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
              color: badge.accentColor.withValues(alpha: 0.7),
              width: 1.4,
            ),
          ),
          child: SvgPicture.asset(badge.iconAsset),
        ),
        SizedBox(width: 14.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                badge.title,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                badge.description,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontFamily: AppFonts.inter,
                  color: AppColors.textSecondary,
                  height: 1.35,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
