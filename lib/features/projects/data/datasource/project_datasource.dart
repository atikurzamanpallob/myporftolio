// ignore_for_file: avoid_print, avoid_function_literals_in_foreach_calls

import 'package:myportfolioapp/features/dashboard/domain/entity/tech_add_entity.dart';
import 'package:myportfolioapp/features/projects/domain/entity/project_add_item.dart';
import 'package:myportfolioapp/features/projects/domain/entity/project_details.dart';
import 'package:myportfolioapp/features/projects/domain/entity/project_item.dart';
import 'package:myportfolioapp/features/projects/domain/entity/project_tech_stack.dart';

abstract class ProjectRemoteDatasource {
  Future<bool> addProject({required ProjectAddItem model});
  Future<bool> addTechStacks({required List<TechAddEntity> techStacks});
  Future<List<ProjectItem>> getProjects();
  Future<List<ProjectTechStack>> getTechStacks();
  Future<ProjectDetails> getProjectDetails({required int projectId});
  Future<ProjectItem> getProjectInfo({required int projectId});
}

abstract class ProjectLocalDatasource {
  Future<List<ProjectItem>> getProjects();
  Future<List<ProjectTechStack>> getTechStacks();
  Future<ProjectDetails?> getProjectDetails({required int projectId});
  Future<ProjectItem?> getProjectInfo({required int projectId});
}
