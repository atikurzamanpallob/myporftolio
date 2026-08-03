import 'package:myportfolioapp/features/projects/domain/entity/project_details.dart';

class ProjectDetailsModels extends ProjectDetails {
  ProjectDetailsModels({
    required super.id,
    required super.projectId,
    required super.platform,
    required super.overview,
    required super.challenges,
    required super.screenshots,
    required super.role,
    required super.keyfeatures,
    required super.solutions,
  });

  factory ProjectDetailsModels.fromJson(Map<String, dynamic> json) {
    List<String> screenshots = [], solutions = [];
    List<KeyFeature> keyFeatures = [];
    if (json['screenshots'] != null) {
      json['screenshots'].forEach((v) {
        screenshots.add(v);
      });
    }

    if (json['solutions'] != null) {
      json['solutions'].forEach((v) {
        solutions.add(v);
      });
    }

    if (json['key_features'] != null) {
      json['key_features'].forEach((v) {
        var ob = KeyFeatureModels.fromJson(Map<String, dynamic>.from(v));
        keyFeatures.add(ob.toEntity());
      });
    }

    return ProjectDetailsModels(
      id: json['id'],
      projectId: json['project_id'],
      platform: json['platform'],
      overview: json['overview'],
      challenges: json['challenges'],
      role: json['role'],
      screenshots: screenshots,
      solutions: solutions,
      keyfeatures: keyFeatures,
    );
  }

  ProjectDetails toEntity() {
    return ProjectDetails(
      id: id,
      projectId: projectId,
      platform: platform,
      overview: overview,
      challenges: challenges,
      screenshots: screenshots,
      role: role,
      keyfeatures: keyfeatures,
      solutions: solutions,
    );
  }
}

class KeyFeatureModels extends KeyFeature {
  KeyFeatureModels({required super.title, required super.description});

  factory KeyFeatureModels.fromJson(Map<String, dynamic> json) {
    return KeyFeatureModels(
      title: json["title"],
      description: json['description'],
    );
  }

  KeyFeature toEntity() {
    return KeyFeature(title: title, description: description);
  }
}
