class WorkExperienceItem {
  const WorkExperienceItem({
    required this.id,
    required this.year,
    required this.role,
    required this.employmentType,
    required this.techStack,
    required this.companyName,
    required this.companyLogoUrl,
    required this.companyUrl,
    required this.companyLocation,
    required this.dateRange,
    required this.description,
    required this.achievements,
  });
  final int id;
  final String year;
  final String role;
  final String employmentType;
  final String techStack;
  final String dateRange;
  final String companyName;
  final String companyLogoUrl;
  final String companyLocation;
  final String? companyUrl;
  final String? description;
  final List<String>? achievements;
}

List<WorkExperienceItem> workExperiences = [
  WorkExperienceItem(
    id: 1,
    year: '2025',
    role: 'Fullstack Flutter Developer',
    companyName: 'Freelance',
    employmentType: 'Freelance',
    techStack: 'Flutter , Node , Express, Firebase, Supabase',
    companyLocation: 'Remote',
    dateRange: 'Aug 2025 -  Present',
    companyLogoUrl: "",
    companyUrl: "",
    description:
        'Working with clients from Australia , Dubai , UK on freelance basis.',
    achievements: [
      "Designed  end-to-end system architecture from REST Api's to database schema to mobile UI and state management",
      'Integrating Firebase services, Real time web sockets feature across client projects',
      'Product delivery  before deadline .  24×7  support for fixing bugs.',
    ],
  ),
];
