// ignore_for_file: avoid_print
import 'package:hive_flutter/adapters.dart';
import '../../../../core/utils/time_formatter.dart';
import '../../domain/entity/blog_item.dart';
import '../../domain/entity/blog_section_item.dart';
import '../models/blog_details_model.dart';
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

  @override
  Future<BlogItem?> getBlogDetails({required int blogId}) async {
    var ob = box.get(
      "blog_details_$blogId",
      defaultValue: {"timestamp": null, "response": null},
    );
    if (TimeFormatter.difference(ob['timestamp']) > 10) {
      return null;
    } else {
      var item = BlogItemModels.fromJson(ob["response"]);
      return item.toEntity();
    }
  }

  @override
  Future<List<BlogItem>> getRecentPosts() async {
    List<BlogItem> items = [];
    var ob = box.get(
      "blog_recent_post",
      defaultValue: {"timestamp": null, "response": []},
    );

    if (TimeFormatter.difference(ob['timestamp']) > 10) {
      return [];
    } else {
      for (var element in ob["response"]) {
        var ob = BlogItemModels.fromJson(element);
        items.add(ob.toEntity());
      }

      return items;
    }
  }

  @override
  Future<List<BlogSectionItem>> getSections({required int blogId}) async {
    var ob = box.get(
      "blog_details_$blogId",
      defaultValue: {"timestamp": null, "response": []},
    );

    if (TimeFormatter.difference(ob['timestamp']) > 10) {
      return [];
    } else {
      var item = BlogDetailsModel.fromJson(ob["response"]);
      return item.toEntity().sections;
    }
  }
}
