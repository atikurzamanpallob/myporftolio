// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:myportfolioapp/features/dashboard/domain/entity/category_list.dart';

abstract class CategoryDatasource {
  Future<List<Category>> getCategoryList();
}
