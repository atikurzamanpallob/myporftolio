import 'package:flutter/material.dart';

/// Central place that maps a nav-bar label to the page it should open.
/// Pages that haven't been built yet just surface a "coming soon" snackbar
/// instead of navigating, so the nav bar stays functional as new sections
/// (Skills, Projects, Blogs, Contact...) get added incrementally.
import 'package:go_router/go_router.dart';

import '../../features/career/presentation/pages/career_page.dart';
import '../../features/home/presentation/pages/home_view.dart';
import '../../features/skills/presentation/pages/skills_page.dart';

void navigateToSection(BuildContext context, String label) {
  switch (label) {
    case 'Home':
      context.go(HomePage.route);
      break;

    case 'Career':
      context.go(CareerPage.route);
      break;

    case 'Skills':
      context.go(SkillsPage.route);
      break;

    default:
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('$label page coming soon')));
  }
}
