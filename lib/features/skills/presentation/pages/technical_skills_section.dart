import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolioapp/core/themes/responsive_size.dart';
import '../../../../core/themes/responsive_text_theme.dart';
import '../../data/models/skill_category_models.dart';
import '../widgets/skill_category_card.dart';

class TechnicalSkillsSection extends StatelessWidget {
  const TechnicalSkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.isMobile ? 10.w : 40.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Technical Skills', style: context.fontStyle.headlineSmall),
          SizedBox(height: 15.h),
          context.isMobile
              ? mobileView()
              : context.isTablet || context.isLaptop
              ? tabletView()
              : desktopView(),
        ],
      ),
    );
  }

  Widget mobileView() {
    return Column(
      crossAxisAlignment: .start,
      children: [
        for (int i = 0; i < kTechnicalSkills.length; i++)
          Padding(
            padding: EdgeInsets.only(
              bottom: i == kTechnicalSkills.length - 1 ? 0 : 10.h,
            ),
            child: SkillCategoryCard(category: kTechnicalSkills[i]),
          ),
      ],
    );
  }

  Widget tabletView() {
    return Column(
      children: [
        IntrinsicHeight(
          child: Row(
            children: [
              Expanded(child: SkillCategoryCard(category: kTechnicalSkills[0])),
              SizedBox(width: 10.w),
              Expanded(child: SkillCategoryCard(category: kTechnicalSkills[1])),
              SizedBox(width: 10.w),
              Expanded(child: SkillCategoryCard(category: kTechnicalSkills[2])),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        IntrinsicHeight(
          child: Row(
            children: [
              Expanded(child: SkillCategoryCard(category: kTechnicalSkills[3])),
              SizedBox(width: 10.w),
              Expanded(child: SkillCategoryCard(category: kTechnicalSkills[4])),
              SizedBox(width: 10.w),
              Expanded(child: SkillCategoryCard(category: kTechnicalSkills[5])),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        IntrinsicHeight(
          child: Row(
            children: [
              Expanded(child: SkillCategoryCard(category: kTechnicalSkills[6])),
              SizedBox(width: 10.w),
              Expanded(child: SkillCategoryCard(category: kTechnicalSkills[7])),
            ],
          ),
        ),
      ],
    );
  }

  Widget desktopView() {
    return Column(
      children: [
        IntrinsicHeight(
          child: Row(
            children: [
              Expanded(child: SkillCategoryCard(category: kTechnicalSkills[0])),
              SizedBox(width: 10.w),
              Expanded(child: SkillCategoryCard(category: kTechnicalSkills[1])),
              SizedBox(width: 10.w),
              Expanded(child: SkillCategoryCard(category: kTechnicalSkills[2])),
              SizedBox(width: 10.w),
              Expanded(child: SkillCategoryCard(category: kTechnicalSkills[3])),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        IntrinsicHeight(
          child: Row(
            children: [
              Expanded(child: SkillCategoryCard(category: kTechnicalSkills[4])),
              SizedBox(width: 10.w),
              Expanded(child: SkillCategoryCard(category: kTechnicalSkills[5])),
              SizedBox(width: 10.w),
              Expanded(child: SkillCategoryCard(category: kTechnicalSkills[6])),
              SizedBox(width: 10.w),
              Expanded(child: SkillCategoryCard(category: kTechnicalSkills[7])),
            ],
          ),
        ),
      ],
    );
  }
}
