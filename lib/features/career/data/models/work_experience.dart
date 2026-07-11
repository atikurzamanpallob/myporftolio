
import 'package:myportfolioapp/core/app_resources/app_icons.dart';

/// What kind of logo to render for a [WorkExperience.company] when no real
/// logo image asset is available yet (see [CompanyLogo] widget).
enum LogoStyle { freelancer, initials }

class WorkExperience {
  const WorkExperience({
    required this.year,
    required this.role,
    required this.company,
    required this.employmentType,
    required this.techStack,
    required this.location,
    required this.dateRange,
    required this.description,
    required this.achievements,
    this.logoStyle = LogoStyle.initials,
    this.logoAsset,
  });

  final String year;
  final String role;
  final String company;
  final String employmentType; // e.g. "Freelance" / "Fulltime"
  final String techStack;
  final String location;
  final String dateRange;
  final String description;
  final List<String> achievements;
  final LogoStyle logoStyle;

  /// Optional real logo image (drop a file into assets/images and point
  /// this at it, e.g. 'assets/images/amharc_tech_logo.png'). Falls back to
  /// a generated placeholder (initials / freelancer badge) when null.
  final String? logoAsset;
}

/// Sample data mirroring the Figma "Career" page. Update freely, or wire
/// this up to a CMS / JSON source later.
const List<WorkExperience> kWorkExperiences = [
  WorkExperience(
    year: '2021',
    role: 'Fullstack Flutter Developer',
    company: 'Freelance',
    employmentType: 'Freelance',
    techStack: 'Flutter , Node , Express, Firebase',
    location: 'Remote',
    dateRange: 'Aug 2025 -  Present',
    description: 'Working with clients from Australia , Dubai , UK on freelance basis.',
    achievements: [
      "Designed  end-to-end system architecture from REST Api's to database schema to mobile UI and state management",
      'Integrating Firebase services, Real time web sockets feature across client projects',
      'Product delivery  before deadline .  24×7  support for fixing bugs.',
    ],
    logoStyle: LogoStyle.freelancer,
  ),
  WorkExperience(
    year: '2021',
    role: 'Flutter Developer',
    company: 'Amharc Tech',
    employmentType: 'Fulltime',
    techStack: 'Flutter , Micro Service, Firebase, Sockets',
    location: 'Dublin, County Dublin , Ireland ( Remote )',
    dateRange: 'Mar 2024 -  Aug 2025',
    description: 'Global IT company based in Dublin, Ireland. Specialising in custom software and digital marketing.',
    achievements: [
      'Worked on paired saas apps (AT Service Portal & AT Customer Portal ) for field service management. Serving agents and customer',
      'Implemented sockets for real-time communication among users',
      'Worked with gps based features & implemented isolates for cpu intensive task',
    ],
    logoStyle: LogoStyle.initials,
  ),
  WorkExperience(
    year: '2021',
    role: 'Flutter Developer',
    company: 'Amharc Tech',
    employmentType: 'Fulltime',
    techStack: 'Flutter , Micro Service, Firebase, Sockets',
    location: 'Dublin, County Dublin , Ireland ( Remote )',
    dateRange: 'Mar 2024 -  Aug 2025',
    description: 'Global IT company based in Dublin, Ireland. Specialising in custom software and digital marketing.',
    achievements: [
      'Worked on paired saas apps (AT Service Portal & AT Customer Portal ) for field service management. Serving agents and customer',
      'Implemented sockets for real-time communication among users',
      'Worked with gps based features & implemented isolates for cpu intensive task',
    ],
    logoStyle: LogoStyle.initials,
  ),
  WorkExperience(
    year: '2021',
    role: 'Flutter Developer',
    company: 'Amharc Tech',
    employmentType: 'Fulltime',
    techStack: 'Flutter , Micro Service, Firebase, Sockets',
    location: 'Dublin, County Dublin , Ireland ( Remote )',
    dateRange: 'Mar 2024 -  Aug 2025',
    description: 'Global IT company based in Dublin, Ireland. Specialising in custom software and digital marketing.',
    achievements: [
      'Worked on paired saas apps (AT Service Portal & AT Customer Portal ) for field service management. Serving agents and customer',
      'Implemented sockets for real-time communication among users',
      'Worked with gps based features & implemented isolates for cpu intensive task',
    ],
    logoStyle: LogoStyle.initials,
  ),
];

class EducationItem {
  const EducationItem({required this.iconAsset, required this.text});
  final String iconAsset;
  final String text;
}

const List<EducationItem> kEducationItems = [
  EducationItem(
    iconAsset: AppIcons.education,
    text: 'Bachelor Of Science  ( Class of 2018 )',
  ),
  EducationItem(
    iconAsset:AppIcons.subjects,
    text: 'Computer Science & Engineering',
  ),
  EducationItem(
    iconAsset: AppIcons.university,
    text: 'Rajshahi University Of Engineering & Technology',
  ),
];

class CertificationItem {
  const CertificationItem({required this.title, required this.issuer});
  final String title;
  final String issuer;
}

const List<CertificationItem> kCertifications = [
  CertificationItem(title: 'Machine Learning', issuer: 'Coursera'),
  CertificationItem(title: 'Problem Solving', issuer: 'Hacker Rank'),
  CertificationItem(title: 'Java', issuer: 'Hacker Rank'),
  CertificationItem(title: 'C++', issuer: 'Hacker Rank'),
];
