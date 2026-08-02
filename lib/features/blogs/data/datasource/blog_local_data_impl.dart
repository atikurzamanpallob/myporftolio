// ignore_for_file: avoid_print
import 'package:hive_flutter/adapters.dart';
import '../../../../core/utils/time_formatter.dart';
import '../../domain/entity/blog_item.dart';
import '../models/blog_item_models.dart';
import 'blog_datasource.dart';

class BlogLocalDataImp extends BlogLocalDatasource {
  Box box;
  BlogLocalDataImp(this.box);

  @override
  Future<List<BlogItem>> getBlogs({
    required int page,
    required int limit,
    int? categoryId,
  }) async {
    List<BlogItem> blogs = [];

    final ob = box.get(
      "blog_list_$page",
      defaultValue: {"timestamp": null, "response": []},
    );
    if (TimeFormatter.difference(ob['timestamp']) > 10) {
      return [];
    } else {
      for (var element in ob["response"]) {
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
  }
}
