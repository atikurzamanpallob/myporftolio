import 'package:myportfolioapp/features/projects/domain/entity/project_tech_stack.dart';

class ProjectTechstackModels extends ProjectTechStack {
  ProjectTechstackModels({
    required super.id,
    required super.name,
    required super.iconUrl,
  });

  factory ProjectTechstackModels.fromJson(Map<String, dynamic> json) {
    return ProjectTechstackModels(
      id: json['id'] ?? -1,
      name: json['name'] ?? "",
      iconUrl: json['icon_url'] ?? "",
    );
  }

  ProjectTechStack toEntity() {
    return ProjectTechStack(id: id, name: name, iconUrl: iconUrl);
  }
}
