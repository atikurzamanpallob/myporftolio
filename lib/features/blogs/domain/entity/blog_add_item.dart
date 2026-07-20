import 'package:file_picker/file_picker.dart';
import 'package:myportfolioapp/features/dashboard/domain/entity/description_elements.dart';

class BlogAddItem {
  int index;
  int categoryId;
  String categoryName;
  String title;
  String shortDescription;
  PlatformFile? thumbnail;
  String date;
  String readTime;
  List<DescriptionItem> descriptionItems;
  BlogAddItem({
    required this.index,
    required this.categoryId,
    required this.categoryName,
    required this.title,
    required this.shortDescription,
    required this.thumbnail,
    required this.date,
    required this.readTime,
    required this.descriptionItems,
  });
}
