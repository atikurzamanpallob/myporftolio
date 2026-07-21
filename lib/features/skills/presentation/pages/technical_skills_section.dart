import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/responsive_text_theme.dart';
import '../../../../core/utils/responsive.dart';
import '../../data/models/skill_category_models.dart';
import '../widgets/skill_category_card.dart';

class TechnicalSkillsSection extends StatelessWidget {
  const TechnicalSkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    final bool isTablet = Responsive.isTablet(context);

    // 1 column on mobile, 2 on tablet, 4 on desktop (7 items wrap to 2 rows).
    final int columns = isMobile ? 1 : (isTablet ? 3 : 4);
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
            'Technical Skills',
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
                  for (final category in kTechnicalSkills)
                    SizedBox(
                      width: cardWidth,
                      child: SkillCategoryCard(
                        category: category,
                        isMobile: isMobile,
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
