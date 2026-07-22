import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/glass_card.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/utils/responsive.dart';

class ProjectHeroSection extends StatelessWidget {
  const ProjectHeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    return Hero(
      tag: 'project-thumbnail',
      child: GlassCard(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: SizedBox(
            height: isMobile ? 235.h : 300.h,
            child: Stack(
              fit: StackFit.expand,
              children: [
                if (isMobile)
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: const [0.4, 1.0],
                        colors: [
                          Colors.transparent,
                          AppColors.background.withValues(alpha: 0.9),
                        ],
                      ),
                    ),
                  ),
                Padding(
                  padding: EdgeInsets.all(20.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [SizedBox(height: 15.h)],
                      ),

                      SizedBox(height: 10.h),
                      Wrap(
                        spacing: 20.w,
                        runSpacing: 8.h,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
