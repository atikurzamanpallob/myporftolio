import 'package:hive_flutter/adapters.dart';

import '../../../../core/utils/time_formatter.dart';
import '../../domain/entity/category_list.dart';
import '../model/category_model.dart';
import 'category_datasource.dart';

class CategoryLocalDataImp extends CategoryDatasource {
  Box box;
  CategoryLocalDataImp(this.box);
  @override
  Future<List<Category>> getCategoryList() async {
    List<Category> categoryList = [];
    var ob = Map<String, dynamic>.from(
      box.get(
        "category_list",
        defaultValue: {"timestamp": null, "response": []},
      ),
    );

    if (TimeFormatter.difference(ob['timestamp']) > 10) {
      return [];
    } else {
      for (var v in ob["response"]) {
        final category = CategoryModel.fromJson(Map<String, dynamic>.from(v));
        categoryList.add(category.toEntity());
      }

      return categoryList;
    }
  }
}
