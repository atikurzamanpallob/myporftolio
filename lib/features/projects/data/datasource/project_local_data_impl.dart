import 'package:hive_flutter/hive_flutter.dart';
import '../../../../core/utils/time_formatter.dart';
import '../../domain/entity/project_details.dart';
import '../../domain/entity/project_item.dart';
import '../../domain/entity/project_tech_stack.dart';
import '../models/project_details_models.dart';
import '../models/project_item_models.dart';
import '../models/project_techstack_models.dart';
import 'project_datasource.dart';

class ProjectLocalDataImp extends ProjectLocalDatasource {
  Box box;
  ProjectLocalDataImp(this.box);

  @override
  Future<List<ProjectItem>> getProjects() async {
    List<ProjectItem> projects = [];
    var ob = box.get(
      "project_list",
      defaultValue: {"timestamp": null, "response": []},
    );

    if (TimeFormatter.difference(ob['timestamp']) > 10) {
      return [];
    } else {
      ob["response"].forEach((v) {
        final project = ProjectItemModels.fromJson(v);
        projects.add(project.toEntity());
      });

      return projects;
    }
  }

  @override
  Future<List<ProjectTechStack>> getTechStacks() async {
    List<ProjectTechStack> techStacks = [];
    var ob = box.get(
      "tech_stacks",
      defaultValue: {"timestamp": null, "response": []},
    );

    if (TimeFormatter.difference(ob['timestamp']) > 10) {
      return [];
    } else {
      ob["response"].forEach((v) {
        final tech = ProjectTechstackModels.fromJson(v);
        techStacks.add(tech.toEntity());
      });
      return techStacks;
    }
  }

  @override
  Future<ProjectDetails?> getProjectDetails({required int projectId}) async {
    var ob = box.get(
      "project_details_$projectId",
      defaultValue: {"timestamp": null, "response": null},
    );
    if (TimeFormatter.difference(ob['timestamp']) > 10) {
      return null;
    } else {
      final model = ProjectDetailsModels.fromJson(ob["response"]);
      return model.toEntity();
    }
  }

  @override
  Future<ProjectItem?> getProjectInfo({required int projectId}) async {
    var ob = box.get(
      "project_info_$projectId",
      defaultValue: {"timestamp": "null", "response": null},
    );
    if (TimeFormatter.difference(ob['timestamp']) > 10) {
      return null;
    } else {
      var item = ProjectItemModels.fromJson(ob["response"]);
      return item.toEntity();
    }
  }
}
