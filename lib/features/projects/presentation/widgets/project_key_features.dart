import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myportfolioapp/core/common/glass_card.dart';
import 'package:myportfolioapp/core/themes/app_colors.dart';
import 'package:myportfolioapp/core/themes/responsive_text_theme.dart';

import '../../../../core/app_resources/app_icons.dart';
import '../bloc/project_bloc.dart';
import '../bloc/project_state.dart';
import 'contents_header.dart';

class ProjectKeyFeatures extends StatelessWidget {
  const ProjectKeyFeatures({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Padding(
        padding: const EdgeInsetsGeometry.all(16),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            ContentsHeader(
              icon: AppIcons.features,
              title: "Key Features",
              iconColor: AppColors.starYellow,
            ),
            SizedBox(height: 20.h),
            BlocBuilder<ProjectBloc, ProjectState>(
              builder: (context, state) {
                var ob = state.projectDetails?.keyfeatures ?? [];
                return Wrap(
                  direction: Axis.horizontal,
                  spacing: 10.h,
                  children: [
                    for (int i = 0; i < ob.length; i++)
                      Row(
                        mainAxisSize: .min,
                        crossAxisAlignment: .start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 2.5),
                            child: SvgPicture.asset(
                              AppIcons.greentick,
                              height: 25.r,
                              width: 25.w,
                              colorFilter: ColorFilter.mode(
                                AppColors.primaryBlue,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: .start,
                              mainAxisAlignment: .start,
                              mainAxisSize: .min,
                              children: [
                                Text(
                                  ob[i].title,
                                  style: context.fontStyle.bodyMedium,
                                ),
                                Text(
                                  ob[i].description,
                                  style: context.fontStyle.bodySmall,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
