// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:myportfolioapp/features/blogs/data/models/blog_item_models.dart';
import 'package:myportfolioapp/features/blogs/domain/entity/blog_item.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BlogDatasource {
  Future<List<BlogItem>> getBlogs({
    required int page,
    required int limit,
    int? categoryId,
  });
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
}
