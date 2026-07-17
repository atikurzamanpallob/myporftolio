class ProjectType {
  int type;
  String name;
  ProjectType({required this.name, required this.type});
}

List<ProjectType> projectOptions = [
  ProjectType(name: "All", type: -1),
  ProjectType(name: "Mobile ", type: 0),
  ProjectType(name: "Backend", type: 1),
  ProjectType(name: "Web", type: 2),
  ProjectType(name: "UI/UX", type: 3),
];
List<ProjectType> dashboardProjectOptions = [
  ProjectType(name: "Mobile ", type: 0),
  ProjectType(name: "Backend", type: 1),
  ProjectType(name: "Web", type: 2),
  ProjectType(name: "UI/UX", type: 3),
];
