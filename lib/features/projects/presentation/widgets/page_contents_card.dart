import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolioapp/core/themes/app_colors.dart';
import 'package:myportfolioapp/core/common/glass_card.dart';
import 'package:myportfolioapp/core/themes/responsive_size.dart';
import 'package:myportfolioapp/core/themes/responsive_text_theme.dart';
import '../../../blogs/presentation/widgets/side_bar_heading.dart';

class PageContentsCard extends StatelessWidget {
  final List<String> contents;
  const PageContentsCard({super.key, required this.contents});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Padding(
        padding: EdgeInsets.all(15.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SidebarHeading(title: 'Contents'),
            Divider(),
            SizedBox(height: 12.h),
            Wrap(
              direction: context.isDesktop ? Axis.vertical : Axis.horizontal,
              spacing: 10.w,
              runSpacing: 15.h,
              alignment: WrapAlignment.start,
              children: [
                for (int i = 0; i < contents.length; i++)
                  Row(
                    mainAxisSize: .min,
                    children: [
                      Container(
                        width: 7.w,
                        height: 7.h,
                        margin: EdgeInsets.only(right: 5.w),
                        decoration: const BoxDecoration(
                          color: AppColors.primaryBlue,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Text(
                        contents[i],
                        overflow: TextOverflow.ellipsis,
                        style: context.fontStyle.labelMedium?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
