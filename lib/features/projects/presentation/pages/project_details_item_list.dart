import 'package:flutter/material.dart';
import 'package:myportfolioapp/features/projects/presentation/widgets/project_challenge_solutions.dart';
import 'package:myportfolioapp/features/projects/presentation/widgets/project_key_features.dart';
import 'package:myportfolioapp/features/projects/presentation/widgets/project_overview.dart';
import 'package:myportfolioapp/features/projects/presentation/widgets/project_screenshots.dart';
import 'package:myportfolioapp/features/projects/presentation/widgets/project_tech_stacks.dart';

class ProjectDetailsItemList extends StatefulWidget {
  const ProjectDetailsItemList({super.key});

  @override
  State<ProjectDetailsItemList> createState() => _ProjectDetailsItemListState();
}

class _ProjectDetailsItemListState extends State<ProjectDetailsItemList> {
  List<Widget> descriptionItems = [
    const ProjectOverview(),
    const ProjectScreenshots(),
    const ProjectTechStacks(),
    const ProjectKeyFeatures(),
    const ProjectChallengeSolutions(),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: descriptionItems.length,
      shrinkWrap: true,
      itemBuilder: (ctx, i) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: descriptionItems[i],
        );
      },
    );
  }
}
