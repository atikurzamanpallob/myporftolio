import '../../domain/entity/work_experience_item.dart';

class WorkExperienceItemModel extends WorkExperienceItem {
  WorkExperienceItemModel({
    required super.id,
    required super.year,
    required super.role,
    required super.employmentType,
    required super.techStack,
    required super.companyName,
    required super.companyLogoUrl,
    required super.companyUrl,
    required super.companyLocation,
    required super.dateRange,
    required super.description,
    required super.achievements,
  });

  factory WorkExperienceItemModel.fromJson(Map<String, dynamic> json) {
    List<String> achievements = [];
    if (json['achievements'] != null) {
      json['achievements'].forEach((v) {
        achievements.add(v.toString());
      });
    }
    return WorkExperienceItemModel(
      id: json['id'],
      year: json['year'] ?? 2026,
      role: json['role'] ?? "Software Engineer",
      employmentType: json['employee'] ?? "Full-Time",
      techStack: json['tech_stack'],
      companyName: json['company_name'] ?? "Freelance",
      companyLogoUrl: json['company_logo_url'] ?? "",
      companyUrl: json['company_url'] ?? "",
      companyLocation: json['company_location'] ?? "Remote",
      dateRange: json['date_range'] ?? "Present",
      description: json['description'] ?? "N/A",
      achievements: achievements,
    );
  }

  WorkExperienceItem toEntity() {
    return WorkExperienceItem(
      id: id,
      year: year,
      role: role,
      employmentType: employmentType,
      techStack: techStack,
      companyName: companyName,
      companyLogoUrl: companyLogoUrl,
      companyUrl: companyUrl,
      companyLocation: companyLocation,
      dateRange: dateRange,
      description: description,
      achievements: achievements,
    );
  }
}
