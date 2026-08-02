import 'package:hive_flutter/adapters.dart';
import 'package:myportfolioapp/core/utils/time_formatter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../domain/entity/category_list.dart';
import '../model/category_model.dart';
import 'category_datasource.dart';

class CategoryRemoteDataImp extends CategoryDatasource {
  SupabaseClient client;
  Box box;
  CategoryRemoteDataImp(this.client, this.box);
  @override
  Future<List<Category>> getCategoryList() async {
    List<Category> categoryList = [];
    var response = await client
        .from('category')
        .select()
        .order('id', ascending: true);

    box.put("category_list", {
      "timestamp": TimeFormatter.getTimestamp(),
      "response": response.map((e) => Map<String, dynamic>.from(e)).toList(),
    });

    for (var v in response) {
      final category = CategoryModel.fromJson(v);
      categoryList.add(category.toEntity());
    }

    return categoryList;
  }
}
