// ignore_for_file: avoid_print, avoid_function_literals_in_foreach_calls

import 'package:file_picker/file_picker.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:myportfolioapp/core/app_resources/app_constants.dart';
import 'package:myportfolioapp/features/blogs/data/models/blog_item_models.dart';
import 'package:myportfolioapp/features/blogs/domain/entity/blog_add_item.dart';
import 'package:myportfolioapp/features/blogs/domain/entity/blog_item.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BlogDatasource {
  Future<List<BlogItem>> getBlogs({
    required int page,
    required int limit,
    int? categoryId,
  });
  Future<bool> addBlogs({required BlogAddItem item});
}

class BlogDatasourceImp extends BlogDatasource {
  SupabaseClient client;
  BlogDatasourceImp(this.client);

  @override
  Future<List<BlogItem>> getBlogs({
    required int page,
    required int limit,
    int? categoryId,
  }) async {
    final from = (page - 1) * limit;
    final to = from + limit - 1;

    final response = categoryId != null
        ? await client
              .from('blogs')
              .select()
              .eq('category_id', categoryId)
              .order('index', ascending: false)
              .range(from, to)
        : await client
              .from('blogs')
              .select()
              .order('index', ascending: false)
              .range(from, to);

    return response
        .map<BlogItem>((e) => BlogItemModels.fromJson(e).toEntity())
        .toList();
  }

  @override
  Future<bool> addBlogs({required BlogAddItem item}) async {
    try {
      List<Map<String, dynamic>> blogDetails = [];

      var blog = await client
          .from('blogs')
          .insert({
            'index': item.index,
            'category_id': item.categoryId,
            'category_name': item.categoryName,
            'title': item.title,
            'short_description': item.shortDescription,
            'date': item.date,
            'read_time': item.readTime,
          })
          .select()
          .single();
      int id = blog['id'];

      String? thumbnailUrl = await getFileUrls(id: id, file: item.thumbnail);
      if (thumbnailUrl != null) {
        await client
            .from('blogs')
            .update({'thumbnail': thumbnailUrl})
            .eq('id', id);
      }

      for (final element in item.descriptionItems) {
        String? url;

        if (element.file != null) {
          url = await getFileUrls(
            id: id,
            file: element.file,
            contentType: element.type == AppConstants.Video
                ? "video/mp4"
                : "image/jpeg",
          );
          blogDetails.add({
            'blog_id': id,
            'type': element.type,
            'text': element.text,
            'file': url,
            'width': element.width,
            'height': element.height,
          });
        }
      }
      await client.from('blog_details').insert(blogDetails);
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

  String sanitizeFileName(String name) {
    return name
        .replaceAll(RegExp(r'\s+'), '_')
        .replaceAll(RegExp(r'[^a-zA-Z0-9._-]'), '');
  }

  Future<String?> getFileUrls({
    PlatformFile? file,
    required int id,
    String contentType = "image/jpeg",
  }) async {
    final storageUrl = dotenv.get("STORAGE_URL");

    if (file != null) {
      final fileName =
          "${DateTime.now().millisecondsSinceEpoch}_${sanitizeFileName(file.name)}";
      var upLocation = await client.storage
          .from('blogs/$id')
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
}
