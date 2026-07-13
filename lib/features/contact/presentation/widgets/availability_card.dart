import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myportfolioapp/core/common/glass_card.dart';

import '../../../../core/app_resources/app_colors.dart';
import '../../../../core/app_resources/app_fonts.dart';
import '../../../../core/app_resources/app_icons.dart';
import '../../../../core/utils/responsive.dart';

class AvailabilityCard extends StatelessWidget {
  const AvailabilityCard({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);

    return GlassCard(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(isMobile ? 18.r : 22.r),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(14.r)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100.r,
              height: 100.r,
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                color: AppColors.iconCircleFill,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  color: const Color(0xFFF39A2B).withValues(alpha: 0.6),
                  width: 1.4,
                ),
              ),
              child: SvgPicture.asset(AppIcons.date),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "I'm Available for new projects",
                    style: TextStyle(
                      fontSize: isMobile ? 16.sp : 18.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "I'm currently available for freelance projects and "
                    "full-time opportunities Let's discuss how can i help "
                    "you achieve your goal",
                    style: TextStyle(
                      fontSize: 12.5.sp,
                      fontFamily: AppFonts.inter,
                      color: AppColors.textSecondary,
                      height: 1.45,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
