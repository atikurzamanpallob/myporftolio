import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myportfolioapp/core/common/glass_card.dart';
import 'package:myportfolioapp/core/themes/responsive_size.dart';
import 'package:myportfolioapp/features/home/domain/entity/service_item.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/responsive_text_theme.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({super.key, required this.serviceItem});

  final ServiceItem serviceItem;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Container(
        padding: EdgeInsets.all(context.isMobile ? 10.r : 20.r),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
        child: Row(
          crossAxisAlignment: .center,
          mainAxisSize: .min,
          children: [
            Container(
              width: 52.r,
              height: 52.r,
              padding: EdgeInsets.all(6.r),
              decoration: BoxDecoration(
                color: AppColors.iconCircleFill,
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.iconCircleBorder,
                  width: 1.5,
                ),
              ),
              child: SvgPicture.asset(serviceItem.icon),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    serviceItem.title,
                    style: context.fontStyle.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    serviceItem.desc,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: context.fontStyle.labelLarge?.copyWith(
                      color: AppColors.textSecondary,
                      height: 1.1,
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
