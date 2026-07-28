import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../blogs/presentation/widgets/side_bar_heading.dart';

class ContentsHeader extends StatelessWidget {
  final String icon;
  final String title;
  final Color iconColor;
  const ContentsHeader({
    super.key,
    required this.icon,
    required this.title,
    this.iconColor = AppColors.textPrimary,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: .min,
      children: [
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: iconColor, width: 0.8),
          ),
          child: SvgPicture.asset(
            icon,
            height: 25.r,
            width: 25.r,
            colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
          ),
        ),
        SizedBox(width: 10.w),
        SidebarHeading(title: title),
      ],
    );
  }
}
