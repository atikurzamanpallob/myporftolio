import 'package:flutter/material.dart';
import 'package:myportfolioapp/core/themes/responsive_size.dart';
import 'package:myportfolioapp/features/projects/presentation/widgets/project_challenges.dart';
import 'package:myportfolioapp/features/projects/presentation/widgets/project_solutions.dart';

class ProjectChallengeSolutions extends StatelessWidget {
  const ProjectChallengeSolutions({super.key});

  @override
  Widget build(BuildContext context) {
    if (context.isMobile) {
      return const Column(
        children: [
          ProjectChallenges(),
          SizedBox(height: 15),
          ProjectSolutions(),
        ],
      );
    } else {
      return IntrinsicHeight(
        child: Row(
          crossAxisAlignment: .start,
          children: [
            Expanded(flex: 1, child: ProjectChallenges()),
            SizedBox(width: 15),
            Expanded(flex: 1, child: ProjectSolutions()),
          ],
        ),
      );
    }
  }
}
