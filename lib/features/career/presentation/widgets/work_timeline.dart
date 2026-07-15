import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolioapp/core/common/stagger_list_animation.dart';
import 'package:myportfolioapp/features/career/domain/entity/work_experience_item.dart';
import 'package:myportfolioapp/features/career/presentation/bloc/career_bloc.dart';
import 'package:myportfolioapp/features/career/presentation/bloc/career_state.dart';

import '../../../../core/app_resources/app_colors.dart';
import '../../../../core/utils/responsive.dart';
import 'experience_card.dart';

class WorkTimeline extends StatelessWidget {
  const WorkTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 16.w : 40.w),
      child: BlocBuilder<CareerBloc, CareerState>(
        builder: (context, state) {
          List<WorkExperienceItem> experiences =
              (state.experiences?.isEmpty ?? false)
              ? workExperiences
              : state.experiences ?? workExperiences;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Work Experience',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20.h),

              for (int i = 0; i < experiences.length; i++)
                isMobile
                    ? StaggerListAnimation(
                        index: i,
                        item: _MobileTimelineItem(
                          experience: experiences[i],
                          isLast: i == experiences.length - 1,
                        ),
                      )
                    : StaggerListAnimation(
                        index: i,
                        item: _RailTimelineItem(
                          experience: experiences[i],
                          isLast: i == experiences.length - 1,
                        ),
                      ),
            ],
          );
        },
      ),
    );
  }
}

class _RailTimelineItem extends StatelessWidget {
  const _RailTimelineItem({required this.experience, required this.isLast});

  final WorkExperienceItem experience;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              width: 90.w,
              child: Column(
                children: [
                  Text(
                    experience.year,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Container(
                    width: 25.r,
                    height: 25.r,
                    decoration: BoxDecoration(
                      color: AppColors.textPrimary,
                      shape: BoxShape.circle,
                    ),
                  ),

                  if (!isLast)
                    Expanded(
                      child: Container(width: 3, color: AppColors.textPrimary),
                    ),
                ],
              ),
            ),
            SizedBox(width: 24.w),
            Expanded(child: ExperienceCard(experience: experience)),
          ],
        ),
      ),
    );
  }
}

class _MobileTimelineItem extends StatelessWidget {
  const _MobileTimelineItem({required this.experience, required this.isLast});

  final WorkExperienceItem experience;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 15.r,
                height: 15.r,
                decoration: BoxDecoration(
                  color: AppColors.textPrimary,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 10.w),
              Text(
                experience.year,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          ExperienceCard(experience: experience),
        ],
      ),
    );
  }
}
