import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolioapp/core/app_resources/app_icons.dart';
import 'package:myportfolioapp/core/common/glass_card.dart';
import 'package:myportfolioapp/features/projects/domain/entity/project_tech_stack.dart';
import 'package:myportfolioapp/features/projects/presentation/widgets/contents_header.dart';
import 'package:myportfolioapp/features/projects/presentation/widgets/tech_chip.dart';

class TechStacks extends StatelessWidget {
  final List<ProjectTechStack> techStacks;
  const TechStacks({super.key, required this.techStacks});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Padding(
        padding: const EdgeInsetsGeometry.all(16),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            ContentsHeader(icon: AppIcons.stack, title: "Tech Stacks"),
            SizedBox(height: 20.h),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Wrap(
                direction: Axis.horizontal,
                spacing: 10.w,
                runSpacing: 15.h,
                alignment: WrapAlignment.start,
                children: [
                  for (int i = 0; i < techStacks.length; i++)
                    TechChip(techStack: techStacks[i]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
