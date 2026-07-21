import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolioapp/core/app_resources/app_images.dart';
import 'package:myportfolioapp/core/themes/responsive_text_theme.dart';
import 'package:myportfolioapp/core/utils/size_helper.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/app_resources/app_fonts.dart';
import '../../../../core/common/glass_card.dart';
import '../../../../core/utils/responsive.dart';
import 'side_bar_heading.dart';

class AuthorCard extends StatelessWidget {
  const AuthorCard({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    final bool isTab = Responsive.isTablet(context);

    return GlassCard(
      child: Padding(
        padding: EdgeInsets.all(20.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SidebarHeading(title: 'About The Author'),
            SizedBox(height: 16.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 46.r,
                  height: 46.r,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        AppColors.primaryBlue.withValues(alpha: 0.7),
                        AppColors.accentGreen.withValues(alpha: 0.5),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    border: Border.all(
                      color: AppColors.primaryBlue.withValues(alpha: 0.4),
                      width: 1.5,
                    ),
                  ),
                  child: ClipOval(child: Image.asset(AppImages.profile)),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Atikur Zaman Pallob",
                        style: context.fontStyle.headlineSmall?.copyWith(
                          color: AppColors.textPrimary,
                          height: 1.5,
                        ),
                      ),
                      SizedBox(height: 3.h),
                      Text(
                        "Software Engineer",
                        style: context.fontStyle.titleSmall?.copyWith(
                          color: AppColors.green,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        "Turning ideas into seamless software solutions",
                        style: TextStyle(
                          fontSize: SizeHelper.getBodyFontSize2(
                            isMobile: isMobile,
                            isTab: isTab,
                          ),
                          color: AppColors.textSecondary,
                          fontFamily: AppFonts.inter,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
