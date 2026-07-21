// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:myportfolioapp/features/blogs/data/models/blog_details_model.dart';
import 'package:myportfolioapp/features/blogs/data/models/blog_item_models.dart';
import 'package:myportfolioapp/features/blogs/domain/entity/blog_details_item.dart';
import 'package:myportfolioapp/features/blogs/domain/entity/blog_item.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BlogDetailsDatasource {
  Future<List<BlogItem>> getRecentPosts();
  Future<BlogItem> getBlogDetails({required int blogId});
  Future<List<BlogDetailsItem>> getSections({required int blogId});
}

class BlogDetailsDatasourceImpl extends BlogDetailsDatasource {
  SupabaseClient client;
  BlogDetailsDatasourceImpl(this.client);

  @override
  Future<BlogItem> getBlogDetails({required int blogId}) async {
    var response = await client
        .from('blogs')
        .select()
        .eq('id', blogId)
        .single();

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

    response.forEach((element) {
      var ob = BlogItemModels.fromJson(element);
      items.add(ob.toEntity());
    });

    return items;
  }

  @override
  Future<List<BlogDetailsItem>> getSections({required int blogId}) async {
    List<BlogDetailsItem> sections = [];

    var response = await client
        .from('blog_details')
        .select()
        .eq('blog_id', blogId)
        .order('id', ascending: true);

    response.forEach((element) {
      var item = BlogDetailsModel.fromJson(element);
      sections.add(item.toEntity());
    });

    return sections;
  }
}
