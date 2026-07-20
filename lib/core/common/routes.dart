import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:myportfolioapp/core/di/injection.dart';
import 'package:myportfolioapp/features/blogs/presentation/bloc/blog_bloc.dart';
import 'package:myportfolioapp/features/blogs/presentation/bloc/blog_details_bloc.dart';
import 'package:myportfolioapp/features/blogs/presentation/bloc/blog_event.dart';
import 'package:myportfolioapp/features/blogs/presentation/pages/blog_details_page.dart';
import 'package:myportfolioapp/features/blogs/presentation/pages/blogs_page.dart';
import 'package:myportfolioapp/features/career/presentation/bloc/career_bloc.dart';
import 'package:myportfolioapp/features/contact/presentation/bloc/contact_bloc.dart';
import 'package:myportfolioapp/features/contact/presentation/pages/contact_page.dart';
import 'package:myportfolioapp/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:myportfolioapp/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:myportfolioapp/features/home/presentation/bloc/home_bloc.dart';
import 'package:myportfolioapp/features/home/presentation/pages/home_view.dart';
import 'package:myportfolioapp/features/projects/presentation/bloc/project_bloc.dart';
import 'package:myportfolioapp/features/projects/presentation/pages/projects_page.dart';

import '../../features/career/presentation/pages/career_page.dart';
import '../../features/skills/presentation/pages/skills_page.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: HomePage.route,
      pageBuilder: (context, state) => buildPage(
        state,
        BlocProvider(create: (_) => getIt<HomeBloc>(), child: const HomePage()),
      ),
    ),

    GoRoute(
      path: CareerPage.route,
      pageBuilder: (context, state) => buildPage(
        state,
        BlocProvider(create: (_) => getIt<CareerBloc>(), child: CareerPage()),
      ),
    ),

    GoRoute(
      path: SkillsPage.route,
      pageBuilder: (context, state) => buildPage(state, SkillsPage()),
    ),
    GoRoute(
      path: ProjectsPage.route,
      pageBuilder: (context, state) => buildPage(
        state,
        BlocProvider(
          create: (_) => getIt<ProjectBloc>(),
          child: ProjectsPage(),
        ),
      ),
    ),
    GoRoute(
      path: BlogsPage.route,
      pageBuilder: (context, state) => buildPage(
        state,
        BlocProvider(create: (_) => getIt<BlogBloc>(), child: BlogsPage()),
      ),
    ),
    GoRoute(
      path: ContactPage.route,
      pageBuilder: (context, state) => buildPage(
        state,
        BlocProvider(
          create: (_) => getIt<ContactBloc>(),
          child: const ContactPage(),
        ),
      ),
    ),
    GoRoute(
      path: BlogDetailsPage.route,
      pageBuilder: (context, state) {
        final id = int.tryParse(state.pathParameters['id'] ?? '') ?? 0;
        return buildPage(
          state,
          BlocProvider(
            create: (_) => getIt<BlogDetailsBloc>()
              ..add(SectionFetchEvent(blogId: id))
              ..add(DetailsFetchEvent(blogId: id)),
            child: BlogDetailsPage(blogId: id),
          ),
        );
      },
    ),
    GoRoute(
      path: DashboardPage.route,
      pageBuilder: (context, state) {
        final extra = state.extra as Map<String, dynamic>?;
        final bool isLoggedIn = extra?['is_loggedin'] ?? true;
        return buildPage(
          state,
          BlocProvider(
            create: (_) => getIt<DashBoardBloc>(),
            child: isLoggedIn
                ? const DashboardPage()
                : Scaffold(
                    body: const Center(child: Text("Logged in to continue")),
                  ),
          ),
        );
      },
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
