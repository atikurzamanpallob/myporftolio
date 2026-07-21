import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/responsive_text_theme.dart';
import '../../../../core/utils/responsive.dart';
import '../../data/models/skill_category_models.dart';
import '../widgets/soft_skill_card.dart';

class SoftSkillsSection extends StatelessWidget {
  const SoftSkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    final bool isTablet = Responsive.isTablet(context);
    final bool isDesktop = Responsive.isDesktop(context);

    // 1 column on mobile, 2 on tablet, 3 on desktop (5 items wrap nicely).
    final int columns = isMobile ? 1 : (isTablet ? 2 : 5);
    final double spacing = 16.w;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16.w : 40.w,
        vertical: 10.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Soft Skills',
            style: context.fontStyle.bodyLarge?.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 16.h),
          LayoutBuilder(
            builder: (context, constraints) {
              final double cardWidth =
                  (constraints.maxWidth - spacing * (columns - 1)) / columns;
              return Wrap(
                spacing: spacing,
                runSpacing: spacing,
                children: [
                  for (int i = 0; i < kSoftSkills.length; i++)
                    SizedBox(
                      width: cardWidth,
                      child: SoftSkillCard(
                        skill: kSoftSkills[i],
                        isDesktop: isDesktop,
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
