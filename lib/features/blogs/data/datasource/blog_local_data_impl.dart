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

    final ob = Map<String, dynamic>.from(
      box.get(
        "blog_list_${page}_${categoryId ?? -1}",
        defaultValue: {"timestamp": null, "response": []},
      ),
    );

    if (TimeFormatter.difference(ob['timestamp']) > 10) {
      return [];
    } else {
      for (var element in ob["response"]) {
        try {
          var blog = BlogItemModels.fromJson(
            Map<String, dynamic>.from(element),
          );
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
    try {
      var ob = Map<String, dynamic>.from(
        box.get(
          "blog_details_$blogId",
          defaultValue: {"timestamp": null, "response": null},
        ),
      );
      print("this is details object:");
      print(ob);
      if (TimeFormatter.difference(ob['timestamp']) > 10) {
        return null;
      } else {
        var item = BlogItemModels.fromJson(
          Map<String, dynamic>.from(ob["response"]),
        );
        return item.toEntity();
      }
    } catch (e) {
      print("This is exception:${e.toString()}");
      return null;
    }
  }

  @override
  Future<List<BlogItem>> getRecentPosts() async {
    List<BlogItem> items = [];
    var ob = Map<String, dynamic>.from(
      box.get(
        "blog_recent_post",
        defaultValue: {"timestamp": null, "response": []},
      ),
    );

    if (TimeFormatter.difference(ob['timestamp']) > 10) {
      return [];
    } else {
      for (var element in ob["response"]) {
        var ob = BlogItemModels.fromJson(Map<String, dynamic>.from(element));
        items.add(ob.toEntity());
      }

      return items;
    }
  }

  @override
  Future<List<BlogSectionItem>> getSections({required int blogId}) async {
    var ob = Map<String, dynamic>.from(
      box.get(
        "blog_details_$blogId",
        defaultValue: {"timestamp": null, "response": []},
      ),
    );

    if (TimeFormatter.difference(ob['timestamp']) > 10) {
      return [];
    } else {
      var item = BlogDetailsModel.fromJson(
        Map<String, dynamic>.from(ob["response"]),
      );
      return item.toEntity().sections;
    }
  }
}
