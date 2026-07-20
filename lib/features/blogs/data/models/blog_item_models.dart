import 'package:myportfolioapp/features/blogs/domain/entity/blog_item.dart';

class BlogItemModels extends BlogItem {
  BlogItemModels({
    required super.id,
    required super.index,
    required super.title,
    required super.shortDescription,
    required super.categoryName,
    required super.categoryId,
    required super.date,
    required super.readTime,
    required super.thumbnail,
  });

  factory BlogItemModels.fromJson(Map<String, dynamic> json) {
    return BlogItemModels(
      id: int.tryParse(json['id'].toString()) ?? 0,
      index: json['index'],
      title: json['title'],
      shortDescription: json['short_description'],
      categoryId: json['category_id'],
      categoryName: json['category_name'],
      date: json['date'],
      readTime: json['read_time'],
      thumbnail: json['thumbnail'],
    );
  }

  BlogItem toEntity() {
    return BlogItem(
      id: id,
      index: index,
      title: title,
      shortDescription: shortDescription,
      categoryName: categoryName,
      categoryId: categoryId,
      date: date,
      readTime: readTime,
      thumbnail: thumbnail,
    );
  }
}
