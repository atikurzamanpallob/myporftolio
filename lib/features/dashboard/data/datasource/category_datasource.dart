// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:myportfolioapp/features/dashboard/data/model/category_model.dart';
import 'package:myportfolioapp/features/dashboard/domain/entity/category_list.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class CategoryDatasource {
  Future<List<Category>> getCategoryList();
}

class CategoryDatasourceImp extends CategoryDatasource {
  SupabaseClient client;
  CategoryDatasourceImp(this.client);
  @override
  Future<List<Category>> getCategoryList() async {
    List<Category> categoryList = [];
    var response = await client
        .from('category')
        .select()
        .order('id', ascending: true);

    response.forEach((v) {
      final category = CategoryModel.fromJson(v);
      categoryList.add(category.toEntity());
    });

    return categoryList;
  }
}
