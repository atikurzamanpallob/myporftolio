import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/responsive_text_theme.dart';
import '../../domain/entity/project_tech_stack.dart';

class TechChip extends StatelessWidget {
  const TechChip({required this.techStack, super.key});
  final ProjectTechStack techStack;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.textPrimary, width: 0.5),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisSize: .min,
        children: [
          SvgPicture.network(techStack.iconUrl, width: 35.r, height: 35.r),

          SizedBox(width: 10.w),
          Text(
            techStack.name,
            style: context.fontStyle.labelMedium?.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.green,
            ),
          ),
        ],
      ),
    );
  }
}
