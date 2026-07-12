import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/app_resources/app_colors.dart';
import '../../../../core/app_resources/app_fonts.dart';
import '../../domain/entity/soft_skill.dart';

/// A card in the "Soft Skills" row: colored icon tile, title + description.
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
    return Container(
      width: double.infinity,
      height: isDesktop ? 140.h : null,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: AppColors.divider, width: 1),
      ),
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
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Text(
            skill.description,
            style: TextStyle(
              fontSize: 11.5.sp,
              fontFamily: AppFonts.inter,
              fontWeight: FontWeight.w400,
              color: AppColors.textSecondary,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
