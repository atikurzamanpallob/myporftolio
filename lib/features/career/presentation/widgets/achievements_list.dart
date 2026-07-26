import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myportfolioapp/core/themes/responsive_text_theme.dart';

import '../../../../core/app_resources/app_icons.dart';
import '../../../../core/utils/responsive.dart';

class AchievementsList extends StatelessWidget {
  const AchievementsList({super.key, required this.items});

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Key Achievements',
          style: context.fontStyle.bodyMedium?.copyWith(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w600,
            color: const Color(0xFFE8D95A),
          ),
        ),
        SizedBox(height: 10.h),
        ...items.map(
          (text) => Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: SvgPicture.asset(
                    AppIcons.greentick,
                    width: isDesktop ? 20.w : 16.w,
                    height: isDesktop ? 20.h : 16.h,
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: Text(
                    text,
                    style: context.fontStyle.bodySmall?.copyWith(
                      fontStyle: FontStyle.italic,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
