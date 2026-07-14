import 'package:myportfolioapp/features/home/domain/entity/home_info.dart';

class HomeInfoModel extends HomeInfo {
  HomeInfoModel({
    required super.id,
    required super.description,
    required super.resumeUrl,
    required super.totalExperience,
    required super.totalProjects,
    required super.profileUrl,
    required super.clientSatisfaction,
  });

  factory HomeInfoModel.fromJson(Map<String, dynamic> json) {
    return HomeInfoModel(
      id: json['id'],
      description: json['description'],
      resumeUrl: json['resume_url'],
      profileUrl: json['profile_url'],
      totalExperience: json['total_experience'],
      totalProjects: json['total_projects'],
      clientSatisfaction: json['client_satisfaction'],
    );
  }
  HomeInfo toEntity() => HomeInfo(
    id: id,
    description: description,
    resumeUrl: resumeUrl,
    profileUrl: profileUrl,
    totalExperience: totalExperience,
    totalProjects: totalProjects,
    clientSatisfaction: clientSatisfaction,
  );
}
