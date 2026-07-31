import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolioapp/core/themes/responsive_size.dart';

import '../../../../core/themes/responsive_text_theme.dart';
import '../../data/models/soft_skill_models.dart';
import '../widgets/soft_skill_card.dart';

class SoftSkillsSection extends StatelessWidget {
  const SoftSkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.isMobile ? 16.w : 40.w,
        vertical: 10.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Soft Skills', style: context.fontStyle.headlineSmall),
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
      children: [
        for (int i = 0; i < kSoftSkills.length; i++)
          Padding(
            padding: EdgeInsets.only(
              bottom: i == kSoftSkills.length - 1 ? 0 : 10.h,
            ),
            child: SoftSkillCard(skill: kSoftSkills[i]),
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
              Expanded(child: SoftSkillCard(skill: kSoftSkills[0])),
              SizedBox(width: 10.w),
              Expanded(child: SoftSkillCard(skill: kSoftSkills[1])),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        IntrinsicHeight(
          child: Row(
            children: [
              Expanded(child: SoftSkillCard(skill: kSoftSkills[2])),
              SizedBox(width: 10.w),
              Expanded(child: SoftSkillCard(skill: kSoftSkills[3])),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        IntrinsicHeight(
          child: Row(
            children: [Expanded(child: SoftSkillCard(skill: kSoftSkills[4]))],
          ),
        ),
      ],
    );
  }

  Widget desktopView() {
    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(child: SoftSkillCard(skill: kSoftSkills[0])),
          SizedBox(width: 10.w),
          Expanded(child: SoftSkillCard(skill: kSoftSkills[1])),
          SizedBox(width: 10.w),
          Expanded(child: SoftSkillCard(skill: kSoftSkills[2])),
          SizedBox(width: 10.w),
          Expanded(child: SoftSkillCard(skill: kSoftSkills[3])),
          SizedBox(width: 10.w),
          Expanded(child: SoftSkillCard(skill: kSoftSkills[4])),
        ],
      ),
    );
  }
}
