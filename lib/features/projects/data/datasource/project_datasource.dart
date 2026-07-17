// ignore_for_file: avoid_print, avoid_function_literals_in_foreach_calls
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:myportfolioapp/features/projects/data/models/project_item_models.dart';
import 'package:myportfolioapp/features/projects/domain/entity/project_add_item.dart';
import 'package:myportfolioapp/features/projects/domain/entity/project_item.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class ProjectDatasource {
  Future<bool> addProject({required ProjectAddItem model});
  Future<List<ProjectItem>> getProjects();
}

class ProjectDatasourceImp extends ProjectDatasource {
  SupabaseClient client;
  ProjectDatasourceImp(this.client);
  final storageUrl = dotenv.get("STORAGE_URL");

  @override
  Future<bool> addProject({required ProjectAddItem model}) async {
    List<String> imageUrls = [];
    try {
      for (final file in model.files) {
        final fileName =
            "${DateTime.now().millisecondsSinceEpoch}_${sanitizeFileName(file.name)}";
        var imageaddress = await client.storage
            .from('project_images')
            .uploadBinary(
              fileName,
              file.bytes!,
              fileOptions: FileOptions(contentType: "image/jpeg"),
            );
        imageUrls.add("$storageUrl/$imageaddress");
      }

      await client.from('projects').insert({
        "index": model.index,
        "name": model.name,
        "type": model.type,
        "link": model.link,
        "description": model.description,
        "technology": model.technology,
        "images": imageUrls,
      });
    } on StorageException catch (e) {
      print("Storage Error");
      print(e.message);
      print(e.statusCode);
      print(e.error);
    } catch (e) {
      print(e);
    }

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

  String sanitizeFileName(String name) {
    return name
        .replaceAll(RegExp(r'\s+'), '_')
        .replaceAll(RegExp(r'[^a-zA-Z0-9._-]'), '');
  }
}
