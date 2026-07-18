class Category {
  int type;
  String name;
  Category({required this.name, required this.type});
}

List<Category> projectOptions = [
  Category(name: "All", type: -1),
  Category(name: "Mobile ", type: 0),
  Category(name: "Backend", type: 1),
  Category(name: "Web", type: 2),
  Category(name: "UI/UX", type: 3),
];
List<Category> dashboardProjectOptions = [
  Category(name: "Mobile ", type: 0),
  Category(name: "Backend", type: 1),
  Category(name: "Web", type: 2),
  Category(name: "UI/UX", type: 3),
];
