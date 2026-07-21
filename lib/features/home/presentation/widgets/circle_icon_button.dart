import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/themes/app_colors.dart';

/// A circular badge containing an svg icon, used for the "Let's connect"
/// social row (GitHub, LinkedIn, Gmail, HackerRank).
class CircleIconButton extends StatelessWidget {
  const CircleIconButton({
    super.key,
    required this.assetPath,
    this.size,
    this.iconPadding,
    this.onTap,
    this.backgroundColor,
    this.borderColor,
  });

  final String assetPath;
  final double? size;
  final double? iconPadding;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    final double diameter = size ?? 40.r;
    return MouseRegion(
      cursor: onTap != null ? SystemMouseCursors.click : MouseCursor.defer,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: diameter,
          height: diameter,
          padding: EdgeInsets.all(iconPadding ?? 5.r),
          decoration: BoxDecoration(
            color: backgroundColor ?? AppColors.iconCircleFill,
            shape: BoxShape.circle,
            border: Border.all(
              color: borderColor ?? AppColors.iconCircleBorder,
              width: 1,
            ),
          ),
          child: SvgPicture.asset(assetPath),
        ),
      ),
    );
  }
}
