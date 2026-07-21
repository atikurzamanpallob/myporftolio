import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:myportfolioapp/core/common/glass_card.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/app_resources/app_fonts.dart';
import '../../domain/entity/skill_category.dart';

class SkillCategoryCard extends StatelessWidget {
  const SkillCategoryCard({
    super.key,
    required this.category,
    required this.isMobile,
  });

  final SkillCategory category;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Container(
        width: double.infinity,
        height: !isMobile ? 280.h : null,
        padding: EdgeInsets.all(14.r),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 34.r,
                  height: 34.r,
                  padding: EdgeInsets.all(4.r),
                  decoration: BoxDecoration(
                    color: AppColors.iconCircleFill,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.textSecondary,
                      width: 1.2,
                    ),
                  ),
                  child: SvgPicture.asset(category.iconAsset),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Text(
                    category.title,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            for (final item in category.items)
              Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 1.h),
                      child: Container(
                        width: 10.r,
                        height: 10.r,
                        decoration: const BoxDecoration(
                          color: AppColors.starYellow,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      flex: 3,
                      child: Text(
                        item.name,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontFamily: AppFonts.inter,
                          fontStyle: FontStyle.italic,
                          color: AppColors.textSecondary,
                          height: 1.3,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: LinearProgressBar(
                        maxSteps: 100,
                        animateProgress: true,
                        progressType: ProgressType.linear,
                        currentStep: item.level,
                        animationCurve: Curves.bounceOut,
                        animationDuration: Duration(seconds: 2),
                        progressColor: AppColors.green,
                        borderRadius: BorderRadiusGeometry.circular(2.r),
                        backgroundColor: AppColors.background,
                        minHeight: 3,
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
