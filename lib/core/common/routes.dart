import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myportfolioapp/features/blogs/presentation/pages/blogs_page.dart';
import 'package:myportfolioapp/features/home/presentation/pages/home_view.dart';
import 'package:myportfolioapp/features/projects/presentation/pages/projects_page.dart';

import '../../features/career/presentation/pages/career_page.dart';
import '../../features/skills/presentation/pages/skills_page.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: HomePage.route,
      pageBuilder: (context, state) => buildPage(state, const HomePage()),
    ),

    GoRoute(
      path: CareerPage.route,
      pageBuilder: (context, state) => buildPage(state, CareerPage()),
    ),

    GoRoute(
      path: SkillsPage.route,
      pageBuilder: (context, state) => buildPage(state, SkillsPage()),
    ),
    GoRoute(
      path: ProjectsPage.route,
      pageBuilder: (context, state) => buildPage(state, ProjectsPage()),
    ),
    GoRoute(
      path: BlogsPage.route,
      pageBuilder: (context, state) => buildPage(state, BlogsPage()),
    ),
    GoRoute(
      path: ProjectsPage.route,
      pageBuilder: (context, state) => buildPage(state, ProjectsPage()),
    ),
  ],
);

CustomTransitionPage buildPage(GoRouterState state, Widget child) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: 300),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(opacity: animation, child: child);
    },
  );
}
