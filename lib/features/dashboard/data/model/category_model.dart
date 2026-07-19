import 'package:myportfolioapp/features/dashboard/domain/entity/category_list.dart';

class CategoryModel extends Category {
  CategoryModel({required super.name, required super.id});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(name: json['name'], id: json['id']);
  }

  Category toEntity() {
    return Category(name: name, id: id);
  }
}
