// ignore_for_file: avoid_print, avoid_function_literals_in_foreach_calls

import 'package:file_picker/file_picker.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myportfolioapp/core/utils/time_formatter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../dashboard/domain/entity/tech_add_entity.dart';
import '../../domain/entity/project_add_item.dart';
import '../../domain/entity/project_details.dart';
import '../../domain/entity/project_item.dart';
import '../../domain/entity/project_tech_stack.dart';
import '../models/project_details_models.dart';
import '../models/project_item_models.dart';
import '../models/project_techstack_models.dart';
import 'project_datasource.dart';

class ProjectRemoteDataImp extends ProjectRemoteDatasource {
  SupabaseClient client;
  Box box;
  ProjectRemoteDataImp(this.client, this.box);

  @override
  Future<bool> addProject({required ProjectAddItem model}) async {
    List<String> solutions = [], screenshots = [];
    List<Map<String, dynamic>> techList = [], keyFeatures = [];
    try {
      model.technology.forEach((tech) {
        techList.add({
          "id": tech.id,
          "name": tech.name,
          "icon_url": tech.iconUrl,
        });
      });

      model.keyFeatures.forEach((feature) {
        keyFeatures.add({
          "title": feature.title.text,
          "description": feature.value.text,
        });
      });
      model.solutions.forEach((solution) {
        solutions.add(solution.text);
      });

      var project = await client
          .from('projects')
          .insert({
            "index": model.index,
            "name": model.name,
            "type": model.type,
            "link": model.link,
            "company": model.company,
            "description": model.description,
            "technology": techList,
          })
          .select()
          .single();
      int projectId = project['id'];

      String? url = await getFileUrls(file: model.thumbnail, id: projectId);
      if (url != null) {
        

        await client
            .from('projects')
            .update({'thumbnail': url})
            .eq('id', projectId);
      }

      if (model.screenshots.isNotEmpty) {
        await Future.forEach(model.screenshots, (file) async {
          String? url = await getFileUrls(file: file, id: projectId);
          if (url != null) {
            screenshots.add(url);
          }
        });
      }

      await client.from('project_details').insert({
        "project_id": project['id'],
        "role": model.role,
        "platform": model.platform,
        "overview": model.overview,
        "key_features": keyFeatures,
        "challenges": model.challenges,
        "solutions": solutions,
        "screenshots": screenshots,
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
    box.put("project_list", {
      "timestamp": TimeFormatter.getTimestamp(),
      "response": response.map((e) => Map<String, dynamic>.from(e)).toList(),
    });

    response.forEach((v) {
      final project = ProjectItemModels.fromJson(v);
      projects.add(project.toEntity());
    });

    return projects;
  }

  String sanitizeFileName(String name) {
    return "${DateTime.now().millisecondsSinceEpoch}_${name.replaceAll(RegExp(r'\s+'), '_').replaceAll(RegExp(r'[^a-zA-Z0-9._-]'), '')}";
  }

  @override
  Future<bool> addTechStacks({required List<TechAddEntity> techStacks}) async {
    final storageUrl = dotenv.get("STORAGE_URL");
    List<Map<String, dynamic>> techMaps = [];

    await Future.forEach(techStacks, (tech) async {
      String? iconAddress;
      if (tech.icon != null) {
        iconAddress = await client.storage
            .from('icons')
            .uploadBinary(
              tech.icon?.name ?? "",
              tech.icon!.bytes!,
              fileOptions: FileOptions(contentType: "image/svg+xml"),
            );
      }

      techMaps.add({
        "name": tech.controller.text,
        "icon_url": "$storageUrl/$iconAddress",
      });
    });
    await client.from('tech_stacks').insert(techMaps);
    return true;
  }

  @override
  Future<List<ProjectTechStack>> getTechStacks() async {
    List<ProjectTechStack> techStacks = [];
    var response = await client
        .from('tech_stacks')
        .select()
        .order('id', ascending: false);

    box.put("tech_stacks", {
      "timestamp": TimeFormatter.getTimestamp(),
      "response": response.map((e) => Map<String, dynamic>.from(e)).toList(),
    });
    response.forEach((v) {
      final tech = ProjectTechstackModels.fromJson(v);
      techStacks.add(tech.toEntity());
    });
    return techStacks;
  }

  Future<String?> getFileUrls({
    required PlatformFile? file,
    required int id,
    String contentType = "image/jpeg",
  }) async {
    final storageUrl = dotenv.get("STORAGE_URL");

    if (file != null) {
      final fileName = sanitizeFileName(file.name);
      var upLocation = await client.storage
          .from('projects/$id')
          .uploadBinary(
            fileName,
            file.bytes!,
            fileOptions: FileOptions(contentType: contentType),
          );
      return "$storageUrl/$upLocation";
    } else {
      return null;
    }
  }

  @override
  Future<ProjectDetails> getProjectDetails({required int projectId}) async {
    var response = await client
        .from('project_details')
        .select()
        .eq('project_id', projectId)
        .single();

    box.put("project_details_$projectId", {
      "timestamp": TimeFormatter.getTimestamp(),
      "response": Map<String, dynamic>.from(response),
    });
    final ob = ProjectDetailsModels.fromJson(response);
    return ob.toEntity();
  }

  @override
  Future<ProjectItem> getProjectInfo({required int projectId}) async {
    var response = await client
        .from('projects')
        .select()
        .eq('id', projectId)
        .single();

    box.put("project_info_$projectId", {
      "timestamp": TimeFormatter.getTimestamp(),
      "response": Map<String, dynamic>.from(response),
    });
    var item = ProjectItemModels.fromJson(response);
    return item.toEntity();
  }
}
