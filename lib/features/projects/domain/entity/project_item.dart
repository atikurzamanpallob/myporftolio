class ProjectItem {
  final int id;
  final int index;
  final String name;
  final int type;
  final String description;
  final String link;
  final String company;
  final List<String> technology;
  List<String> images;

  ProjectItem({
    required this.id,
    required this.index,
    required this.name,
    required this.link,
    required this.type,
    required this.company,
    required this.description,
    required this.technology,
    required this.images,
  });
}
