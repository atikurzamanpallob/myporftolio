import 'package:myportfolioapp/features/blogs/domain/entity/blog_details_item.dart';

class BlogDetailsModel extends BlogDetailsItem {
  BlogDetailsModel({
    required super.id,
    required super.blogId,
    required super.type,
    required super.text,
    required super.fileUrl,
    required super.width,
    required super.height,
  });

  factory BlogDetailsModel.fromJson(Map<String, dynamic> json) {
    return BlogDetailsModel(
      id: json['id'],
      blogId: json['blog_id'],
      type: json['type'],
      text: json['text'],
      fileUrl: json['file'],
      width: json['width'],
      height: json['height'],
    );
  }

  BlogDetailsItem toEntity() {
    return BlogDetailsItem(
      id: id,
      blogId: blogId,
      type: type,
      text: text,
      fileUrl: fileUrl,
      width: width,
      height: height,
    );
  }
}
