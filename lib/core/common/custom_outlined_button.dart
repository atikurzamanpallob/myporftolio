import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolioapp/core/themes/app_colors.dart';

import '../themes/responsive_text_theme.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String label;
  final Function onTap;
  final IconData? iconData;
  final Color? backgroundColor, textColor, borderColor;
  const CustomOutlinedButton({
    super.key,
    required this.onTap,
    required this.label,
    this.iconData,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: borderColor ?? AppColors.primaryBlue,
            width: 0.3,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: context.fontStyle.labelMedium?.copyWith(
                fontWeight: FontWeight.w500,
                color: textColor ?? AppColors.primaryBlue,
              ),
            ),
            SizedBox(width: 10.w),
            Icon(
              iconData ?? Icons.arrow_forward_ios,
              size: 17.r,
              color: textColor ?? AppColors.primaryBlue,
            ),
          ],
        ),
      ),
    );
  }
}
