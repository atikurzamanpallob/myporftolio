import 'package:myportfolioapp/features/blogs/data/models/blog_section_model.dart';
import 'package:myportfolioapp/features/blogs/domain/entity/blog_details_item.dart';
import 'package:myportfolioapp/features/blogs/domain/entity/blog_section_item.dart';

class BlogDetailsModel extends BlogDetailsItem {
  BlogDetailsModel({
    required super.id,
    required super.blogId,
    required super.sections,
  });

  factory BlogDetailsModel.fromJson(Map<String, dynamic> json) {
    List<BlogSectionItem> sections = [];
    if (json['blog_sections'] != null) {
      json['blog_sections'].forEach((element) {
        var ob = BlogSectionModel.fromJson(element);
        sections.add(ob.toEntity());
      });
    }

    return BlogDetailsModel(
      id: json['id'],
      blogId: json['blog_id'],
      sections: sections,
    );
  }

  BlogDetailsItem toEntity() {
    return BlogDetailsItem(id: id, blogId: blogId, sections: sections);
  }
}
