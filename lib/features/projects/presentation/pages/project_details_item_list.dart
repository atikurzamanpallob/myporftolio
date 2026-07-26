import 'package:flutter/material.dart';
import 'package:myportfolioapp/features/projects/presentation/widgets/tech_stacks.dart';

class ProjectDetailsItemList extends StatelessWidget {
  const ProjectDetailsItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      shrinkWrap: true,
      itemBuilder: (ctx, i) {
        return TechStacks(techStacks: ["Flutter", "Dart", "Java", "Node"]);
      },
    );
  }
}
