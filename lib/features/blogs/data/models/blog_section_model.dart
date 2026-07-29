import 'package:myportfolioapp/features/blogs/domain/entity/blog_section_item.dart';

class BlogSectionModel extends BlogSectionItem {
  BlogSectionModel({
    required super.type,
    required super.text,
    required super.fileUrl,
    required super.width,
    required super.height,
  });

  factory BlogSectionModel.fromJson(Map<String, dynamic> json) {
    return BlogSectionModel(
      type: json['type'],
      text: json['text'],
      fileUrl: json['file'],
      width: json['width'],
      height: json['height'],
    );
  }

  BlogSectionItem toEntity() {
    return BlogSectionItem(
      type: type,
      text: text,
      fileUrl: fileUrl,
      width: width,
      height: height,
    );
  }
}
