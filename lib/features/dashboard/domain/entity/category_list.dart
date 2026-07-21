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

List<Category> widgetsCategory = [
  Category(name: "Heading", id: 1),
  Category(name: "Body", id: 2),
  Category(name: "Spacer", id: 3),
  Category(name: "Image", id: 4),
  Category(name: "Video", id: 5),
  Category(name: "DartCode", id: 6),
  Category(name: "JsCode", id: 7),
];
