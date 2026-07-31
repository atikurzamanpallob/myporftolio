import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolioapp/core/common/type_writer_text.dart';
import 'package:myportfolioapp/core/themes/responsive_size.dart';
import 'package:myportfolioapp/core/themes/responsive_text_theme.dart';

import '../themes/app_colors.dart';

class HeroHeader extends StatelessWidget {
  const HeroHeader({
    super.key,
    required this.heading1,
    required this.heading2,
    required this.bodyText,
    this.extraWidget,
  });
  final String heading1, heading2, bodyText;
  final Widget? extraWidget;

  @override
  Widget build(BuildContext context) {
    final bool isMobile = context.isMobile;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16.w : 40.w,
        vertical: isMobile ? 28.h : 15.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TypewriterText(
            segments: [
              TypewriterSegment(
                text: heading1,
                style: context.fontStyle.displaySmall!.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
              TypewriterSegment(
                text: heading2,
                style: context.fontStyle.displaySmall!.copyWith(
                  color: AppColors.primaryBlue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 14.h),
          TypewriterText(
            speed: Duration(milliseconds: 20),
            segments: [
              TypewriterSegment(
                text: bodyText,
                style: context.fontStyle.bodyMedium!.copyWith(
                  color: AppColors.starYellow,
                ),
              ),
            ],
          ),

          extraWidget != null
              ? Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: extraWidget,
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
