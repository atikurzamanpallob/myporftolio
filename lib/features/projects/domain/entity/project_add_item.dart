import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:myportfolioapp/features/dashboard/domain/entity/key_feature_entity.dart';
import 'package:myportfolioapp/features/projects/domain/entity/project_tech_stack.dart';

class ProjectAddItem {
  final int index;
  final String name;
  final int type;
  final String description;
  final String link;
  final String company;
  final String role;
  final String platform;
  final String overview;
  final String challenges;
  final List<ProjectTechStack> technology;
  final List<KeyFeatureEntity> keyFeatures;
  final List<PlatformFile> files;
  final List<PlatformFile> screenshots;
  final List<TextEditingController> solutions;

  ProjectAddItem({
    required this.index,
    required this.name,
    required this.type,
    required this.description,
    required this.role,
    required this.platform,
    required this.overview,
    required this.link,
    required this.company,
    required this.challenges,
    required this.technology,
    required this.keyFeatures,
    required this.files,
    required this.screenshots,
    required this.solutions,
  });
}
