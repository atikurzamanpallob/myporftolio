import 'package:flutter/material.dart';

/// Filter categories shown in the pill bar above the project list.
enum ProjectCategory {
  all('All'),
  mobile('Mobile'),
  backend('Backend'),
  web('Web'),
  uiux('UI/UX');

  const ProjectCategory(this.label);
  final String label;
}

class Project {
  const Project({
    required this.title,
    required this.description,
    required this.techStack,
    required this.categories,
    this.androidAvailable = false,
    this.iosAvailable = false,
    this.caseStudyUrl,
    this.iconGlyph = Icons.shopping_bag_outlined,
  });

  final String title;
  final String description;
  final List<String> techStack;

  /// Which filter chips this project should show under (excluding "All",
  /// which always matches every project).
  final List<ProjectCategory> categories;

  final bool androidAvailable;
  final bool iosAvailable;

  /// Link to an external case-study write-up. Null hides the CTA.
  final String? caseStudyUrl;

  /// Icon shown inside the placeholder screenshot mockup. Swap the
  /// [ProjectThumbnails] widget for real screenshot assets once available.
  final IconData iconGlyph;

  bool matches(ProjectCategory filter) =>
      filter == ProjectCategory.all || categories.contains(filter);
}

/// Sample data mirroring the Figma "Projects" page. Update freely — or
/// wire this up to a CMS/API later.
const List<Project> kProjects = [
  Project(
    title: 'Shoply',
    description:
        'A modern e-commerce apps with product listing, cart, secure '
        'checkout and order tracking',
    techStack: [
      'Flutter',
      'Dart',
      'Provider',
      'Firebase Notification',
      'Firebase Dynamic Links',
      'Drift',
      'Payment gateway',
    ],
    categories: [ProjectCategory.mobile, ProjectCategory.backend],
    androidAvailable: true,
    iosAvailable: true,
    caseStudyUrl: 'https://example.com/case-studies/shoply',
    iconGlyph: Icons.shopping_bag_outlined,
  ),
  Project(
    title: 'Shoply',
    description:
        'A modern e-commerce apps with product listing, cart, secure '
        'checkout and order tracking',
    techStack: [
      'Flutter',
      'Dart',
      'Provider',
      'Firebase Notification',
      'Firebase Dynamic Links',
      'Drift',
      'Payment gateway',
    ],
    categories: [ProjectCategory.mobile, ProjectCategory.backend],
    androidAvailable: true,
    iosAvailable: true,
    caseStudyUrl: 'https://example.com/case-studies/shoply',
    iconGlyph: Icons.shopping_bag_outlined,
  ),
  Project(
    title: 'Shoply',
    description:
        'A modern e-commerce apps with product listing, cart, secure '
        'checkout and order tracking',
    techStack: [
      'Flutter',
      'Dart',
      'Provider',
      'Firebase Notification',
      'Firebase Dynamic Links',
      'Drift',
      'Payment gateway',
    ],
    categories: [ProjectCategory.mobile, ProjectCategory.backend],
    androidAvailable: true,
    iosAvailable: true,
    caseStudyUrl: 'https://example.com/case-studies/shoply',
    iconGlyph: Icons.shopping_bag_outlined,
  ),
];
