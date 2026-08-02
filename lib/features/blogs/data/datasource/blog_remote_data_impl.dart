// ignore_for_file: avoid_print

import 'package:file_picker/file_picker.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:myportfolioapp/core/utils/time_formatter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:myportfolioapp/features/blogs/data/models/blog_details_model.dart';
import 'package:myportfolioapp/features/blogs/data/models/blog_item_models.dart';
import '../../../../core/app_resources/app_constants.dart';
import '../../domain/entity/blog_add_item.dart';
import '../../domain/entity/blog_item.dart';
import '../../domain/entity/blog_section_item.dart';
import 'blog_datasource.dart';

class BlogRemoteDataImp extends BlogRemoteDatasource {
  SupabaseClient client;
  Box box;
  BlogRemoteDataImp(this.client, this.box);

  @override
  Future<List<BlogItem>> getBlogs({
    required int page,
    required int limit,
    int? categoryId,
  }) async {
    List<BlogItem> blogs = [];
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

    box.put("blog_list_${page}_${categoryId ?? -1}", {
      "timestamp": TimeFormatter.getTimestamp(),
      "response": response,
    });
    for (var element in response) {
      try {
        var blog = BlogItemModels.fromJson(element);
        blogs.add(blog.toEntity());
      } catch (e, stack) {
        print(e.toString());
        print(stack);
      }
    }
    return blogs;
  }

  @override
  Future<bool> addBlogs({required BlogAddItem item}) async {
    try {
      List<Map<String, dynamic>> blogSections = [];

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
        String? url = element.file != null
            ? await getFileUrls(
                id: id,
                file: element.file,
                contentType: element.type == AppConstants.Video
                    ? "video/mp4"
                    : "image/jpeg",
              )
            : null;
        blogSections.add({
          'type': element.type,
          'text': element.text,
          'file': url,
          'width': element.width,
          'height': element.height,
        });
      }
      await client.from('blog_details').insert({
        "blog_id": id,
        "blog_sections": blogSections,
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

  @override
  Future<BlogItem> getBlogDetails({required int blogId}) async {
    var response = await client
        .from('blogs')
        .select()
        .eq('id', blogId)
        .single();

    box.put("blog_details_$blogId", {
      "timestamp": TimeFormatter.getTimestamp(),
      "response": response,
    });

    var item = BlogItemModels.fromJson(response);
    return item.toEntity();
  }

  @override
  Future<List<BlogItem>> getRecentPosts() async {
    List<BlogItem> items = [];
    var response = await client
        .from('blogs')
        .select()
        .order('id', ascending: false)
        .limit(4);
    box.put("blog_recent_post", {
      "timestamp": TimeFormatter.getTimestamp(),
      "response": response,
    });
    for (var element in response) {
      var ob = BlogItemModels.fromJson(element);
      items.add(ob.toEntity());
    }

    return items;
  }

  @override
  Future<List<BlogSectionItem>> getSections({required int blogId}) async {
    var response = await client
        .from('blog_details')
        .select()
        .eq('blog_id', blogId)
        .single();

    var item = BlogDetailsModel.fromJson(response);
    box.put("blog_details_$blogId", {
      "timestamp": TimeFormatter.getTimestamp(),
      "response": response,
    });

    return item.toEntity().sections;
  }
}
