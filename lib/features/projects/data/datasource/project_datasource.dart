// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'dart:io';

import 'package:myportfolioapp/features/projects/data/models/project_item_models.dart';
import 'package:myportfolioapp/features/projects/domain/entity/project_item.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class ProjectDatasource {
  Future<bool> addProject({required ProjectItemModels model});
  Future<List<ProjectItem>> getProjects();
}

class ProjectDatasourceImp extends ProjectDatasource {
  SupabaseClient client;
  ProjectDatasourceImp(this.client);

  @override
  Future<bool> addProject({required ProjectItemModels model}) async {
    List<String> imageUrls = [];
    for (final path in model.images) {
      final file = File(path);
      String name = file.path.split('/').last;

      final fileName = "${DateTime.now().millisecondsSinceEpoch}_$name}";

      await Supabase.instance.client.storage
          .from('project_images')
          .upload(fileName, file);

      imageUrls.add(
        Supabase.instance.client.storage
            .from('project_images')
            .getPublicUrl(fileName),
      );
    }
    model.images = imageUrls;
    await client.from('projects').insert(model.toJson());
    return true;
  }

  @override
  Future<List<ProjectItem>> getProjects() async {
    List<ProjectItem> projects = [];
    var response = await client
        .from('projects')
        .select()
        .order('index', ascending: false);

    response.forEach((v) {
      final project = ProjectItemModels.fromJson(v);
      projects.add(project.toEntity());
    });
    return projects;
  }
}
