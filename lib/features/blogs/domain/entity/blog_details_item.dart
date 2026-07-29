import 'package:myportfolioapp/features/blogs/domain/entity/blog_section_item.dart';

class BlogDetailsItem {
  final int id;
  final int blogId;
  final List<BlogSectionItem> sections;
  BlogDetailsItem({
    required this.id,
    required this.blogId,
    required this.sections,
  });
}
