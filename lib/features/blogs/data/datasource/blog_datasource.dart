// ignore_for_file: avoid_print, avoid_function_literals_in_foreach_calls

import 'package:myportfolioapp/features/blogs/domain/entity/blog_add_item.dart';
import 'package:myportfolioapp/features/blogs/domain/entity/blog_item.dart';

import '../../domain/entity/blog_section_item.dart';

abstract class BlogRemoteDatasource {
  Future<List<BlogItem>> getBlogs({
    required int page,
    required int limit,
    int? categoryId,
  });
  Future<bool> addBlogs({required BlogAddItem item});
  Future<List<BlogItem>> getRecentPosts();
  Future<BlogItem?> getBlogDetails({required int blogId});
  Future<List<BlogSectionItem>> getSections({required int blogId});
}

abstract class BlogLocalDatasource {
  Future<List<BlogItem>> getBlogs({
    required int page,
    required int limit,
    int? categoryId,
  });
  Future<List<BlogItem>> getRecentPosts();
  Future<BlogItem?> getBlogDetails({required int blogId});
  Future<List<BlogSectionItem>> getSections({required int blogId});
}
