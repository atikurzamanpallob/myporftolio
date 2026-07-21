import 'package:myportfolioapp/features/projects/domain/entity/project_item.dart';

class ProjectItemModels extends ProjectItem {
  ProjectItemModels({
    required super.id,
    required super.index,
    required super.name,
    required super.link,
    required super.type,
    required super.description,
    required super.technology,
    required super.images,
    required super.company,
  });

  factory ProjectItemModels.fromJson(Map<String, dynamic> json) {
    List<String> technologies = [], images = [];
    if (json['technology'] != null) {
      json['technology'].forEach((v) {
        technologies.add(v.toString());
      });
    }

    if (json['images'] != null) {
      json['images'].forEach((v) {
        images.add(v.toString());
      });
    }
    return ProjectItemModels(
      id: json['id'],
      index: json['index'],
      name: json['name'],
      link: json['link'],
      type: json['type'],
      company: json['company'],
      description: json['description'],
      technology: technologies,
      images: images,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = <String, dynamic>{};
    map['index'] = index;
    map['name'] = name;
    map['link'] = link;
    map['type'] = type;
    map['description'] = description;
    map['technology'] = technology;
    map['images'] = images;
    map['company'] = company;
    return map;
  }

  ProjectItem toEntity() {
    return ProjectItem(
      id: id,
      index: index,
      name: name,
      link: link,
      type: type,
      company: company,
      description: description,
      technology: technology,
      images: images,
    );
  }
}
