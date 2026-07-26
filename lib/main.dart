import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolioapp/core/di/injection.dart';
import 'package:myportfolioapp/core/supabase/supabase_client.dart';
import 'package:myportfolioapp/core/themes/text_theme.dart';

import 'core/themes/app_colors.dart';
import 'core/utils/responsive.dart';
import 'core/common/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await initSupabase();
  await injectDependency();
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Re-evaluated on every rebuild (e.g. browser window resize), so the
    // ScreenUtil "design size" adapts between mobile / tablet / desktop.
    final width = MediaQuery.sizeOf(context).width;
    final designSize = Responsive.designSizeFor(width);
    return ScreenUtilInit(
      designSize: designSize,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          routerConfig: router,
          title: 'Pallob | Flutter Developer',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.background,
            fontFamily: 'Roboto',
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.primaryBlue,
              brightness: Brightness.dark,
            ),
            textTheme: textTheme,
            useMaterial3: true,
          ),
        );
      },
    );
  }
}

// flutter run -d web-server --web-port=8080
