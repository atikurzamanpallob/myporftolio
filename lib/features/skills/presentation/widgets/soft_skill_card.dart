import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myportfolioapp/core/common/glass_card.dart';
import 'package:myportfolioapp/core/themes/responsive_size.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/responsive_text_theme.dart';
import '../../domain/entity/soft_skill.dart';

class SoftSkillCard extends StatelessWidget {
  const SoftSkillCard({super.key, required this.skill});

  final SoftSkill skill;

  @override
  Widget build(BuildContext context) {
    final content = Container(
      padding: EdgeInsets.all(context.isMobile ? 8.r : 16.r),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              SizedBox(
                width: context.isMobile ? 25.r : 34.r,
                height: context.isMobile ? 25.r : 34.r,
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
            style: context.fontStyle.labelLarge?.copyWith(
              height: 1.4,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );

    return GlassCard(
      child: context.isMobile ? content : SizedBox.expand(child: content),
    );
  }
}
