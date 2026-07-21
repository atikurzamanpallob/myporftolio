import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myportfolioapp/core/common/glass_card.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/responsive_text_theme.dart';
import '../../domain/entity/soft_skill.dart';

class SoftSkillCard extends StatelessWidget {
  const SoftSkillCard({
    super.key,
    required this.skill,
    required this.isDesktop,
  });

  final SoftSkill skill;
  final bool isDesktop;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Container(
        width: double.infinity,
        height: isDesktop ? 140.h : null,
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 34.r,
                  height: 34.r,
                  child: SvgPicture.asset(skill.iconAsset),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Text(
                    skill.title,
                    style: context.fontStyle.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Text(
              skill.description,
              style: context.fontStyle.bodySmall?.copyWith(
                height: 1.4,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
