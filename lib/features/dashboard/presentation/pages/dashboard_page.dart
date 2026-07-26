import 'package:flutter/material.dart';
import 'package:myportfolioapp/features/dashboard/presentation/pages/add_blog_page.dart';
import 'package:myportfolioapp/features/dashboard/presentation/pages/add_project_page.dart';
import '../../../../core/themes/app_colors.dart';
import '../widgets/sidebar.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
  static const route = "/dashboard";
}

class _DashboardPageState extends State<DashboardPage> {
  int currentOption = 0;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isNarrow = width < 1000;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isNarrow)
            AppSidebar(
              currentOption: currentOption,
              onTap: (int option) {
                setState(() {
                  currentOption = option;
                });
              },
            ),
          getPage(),
        ],
      ),
    );
  }

  Widget getPage() {
    switch (currentOption) {
      case 0:
        return AddProjectPage();
      default:
        return AddBlogPage();
    }
  }
}
