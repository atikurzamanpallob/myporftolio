class ProjectType {
  int type;
  String name;
  ProjectType({required this.name, required this.type});
}

List<ProjectType> projectOptions = [
  ProjectType(name: "Mobile App", type: 0),
  ProjectType(name: "Backend App", type: 1),
  ProjectType(name: "Web App", type: 2),
  ProjectType(name: "UI/UX Design", type: 3),
];
