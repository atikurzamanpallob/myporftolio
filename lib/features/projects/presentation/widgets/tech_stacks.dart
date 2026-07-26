import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myportfolioapp/core/app_resources/app_icons.dart';
import 'package:myportfolioapp/core/common/glass_card.dart';
import 'package:myportfolioapp/core/themes/app_colors.dart';

import '../../../../core/themes/responsive_text_theme.dart';
import '../../../blogs/presentation/widgets/side_bar_heading.dart';

class TechStacks extends StatelessWidget {
  final List<String> techStacks;
  const TechStacks({super.key, required this.techStacks});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Padding(
        padding: const EdgeInsetsGeometry.all(16),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: AppColors.primaryBlue,
                      width: 0.8,
                    ),
                  ),
                  child: SvgPicture.asset(
                    AppIcons.stack,
                    height: 20.r,
                    width: 20.r,
                  ),
                ),
                SizedBox(width: 10.w),
                SidebarHeading(title: 'Tech Stacks'),
              ],
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Wrap(
                direction: Axis.horizontal,
                spacing: 10.w,
                runSpacing: 15.h,
                alignment: WrapAlignment.start,
                children: [
                  for (int i = 0; i < techStacks.length; i++)
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        color: AppColors.primaryBlue,
                      ),

                      child: Text(
                        techStacks[i],
                        overflow: TextOverflow.ellipsis,
                        style: context.fontStyle.labelMedium?.copyWith(
                          color: AppColors.textPrimary,
                        ),
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
