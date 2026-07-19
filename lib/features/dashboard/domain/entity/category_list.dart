class Category {
  int id;
  String name;
  Category({required this.name, required this.id});
}

List<Category> projectOptions = [
  Category(name: "All", id: -1),
  Category(name: "Mobile ", id: 0),
  Category(name: "Backend", id: 1),
  Category(name: "Web", id: 2),
  Category(name: "UI/UX", id: 3),
];
List<Category> dashboardProjectOptions = [
  Category(name: "Mobile ", id: 0),
  Category(name: "Backend", id: 1),
  Category(name: "Web", id: 2),
  Category(name: "UI/UX", id: 3),
];
