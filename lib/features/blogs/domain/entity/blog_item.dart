class BlogItem {
  const BlogItem({
    required this.id,
    required this.index,
    required this.title,
    required this.shortDescription,
    required this.categoryName,
    required this.categoryId,
    required this.date,
    required this.readTime,
    required this.thumbnail,
  });
  final int id;
  final int index;
  final String title;
  final String shortDescription;
  final String categoryName;
  final int categoryId;
  final String date;
  final String readTime;
  final String thumbnail;
}
