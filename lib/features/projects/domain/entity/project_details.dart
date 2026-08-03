class ProjectDetails {
  final int id;
  final int projectId;
  final String overview;
  final String platform;
  final String role;
  final List<String> challenges;
  final List<String> screenshots;
  final List<String> solutions;
  final List<KeyFeature> keyfeatures;

  ProjectDetails({
    required this.id,
    required this.projectId,
    required this.platform,
    required this.overview,
    required this.challenges,
    required this.screenshots,
    required this.role,
    required this.keyfeatures,
    required this.solutions,
  });
}

class KeyFeature {
  final String title;
  final String description;
  KeyFeature({required this.title, required this.description});
}
