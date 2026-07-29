import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myportfolioapp/core/common/glass_card.dart';
import 'package:myportfolioapp/core/themes/app_colors.dart';
import 'package:myportfolioapp/core/themes/responsive_size.dart';
import 'package:myportfolioapp/core/themes/responsive_text_theme.dart';
import '../../../../core/app_resources/app_icons.dart';
import '../bloc/project_bloc.dart';
import '../bloc/project_state.dart';
import 'contents_header.dart';

class ProjectOverview extends StatelessWidget {
  const ProjectOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Padding(
        padding: const EdgeInsetsGeometry.all(16),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            ContentsHeader(
              icon: AppIcons.overview,
              title: "Overview",
              iconColor: AppColors.cyan,
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: BlocBuilder<ProjectBloc, ProjectState>(
                builder: (context, state) {
                  String text = state.projectDetails?.overview ?? "";
                  return context.isMobile
                      ? Column(
                          children: [
                            Text(text, style: context.fontStyle.bodySmall),
                            Divider(
                              color: AppColors.primaryBlue,
                              thickness: 0.3,
                            ),
                          ],
                        )
                      : IntrinsicHeight(
                          child: Row(
                            children: [
                              Expanded(
                                flex: 6,
                                child: Text(
                                  text,
                                  style: context.fontStyle.bodySmall,
                                ),
                              ),
                              VerticalDivider(
                                color: AppColors.primaryBlue,
                                thickness: 0.2,
                              ),
                              Column(
                                children: [
                                  meta(
                                    context: context,
                                    icon: AppIcons.screenshots,
                                    value1: "Platform :",
                                    value2:
                                        state.projectDetails?.platform ?? "",
                                  ),
                                  SizedBox(height: 10.h),
                                  meta(
                                    context: context,
                                    icon: AppIcons.persons,
                                    value1: "Role :",
                                    value2: state.projectDetails?.role ?? "",
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget meta({
    required BuildContext context,
    required String icon,
    required String value1,
    required String value2,
  }) {
    return SizedBox(
      width: 200.w,
      child: Expanded(
        child: Wrap(
          crossAxisAlignment: .center,
          children: [
            SvgPicture.asset(
              icon,
              height: 20.h,
              width: 20.w,
              colorFilter: ColorFilter.mode(
                AppColors.primaryBlue,
                BlendMode.srcIn,
              ),
            ),
            SizedBox(width: 6.w),
            Text(
              value1,
              style: context.fontStyle.labelLarge?.copyWith(
                color: AppColors.primaryBlue,
              ),
            ),
            SizedBox(width: 10.w),
            Text(
              value2,
              style: context.fontStyle.labelLarge?.copyWith(
                color: AppColors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
