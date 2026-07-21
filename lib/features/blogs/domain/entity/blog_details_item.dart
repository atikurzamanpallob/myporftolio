class BlogDetailsItem {
  int id;
  int blogId;
  int type;
  String? text;
  String? fileUrl;
  double width;
  double height;
  BlogDetailsItem({
    required this.id,
    required this.blogId,
    required this.type,
    required this.text,
    required this.fileUrl,
    required this.width,
    required this.height,
  });
}
