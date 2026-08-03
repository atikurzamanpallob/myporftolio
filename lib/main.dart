// ignore_for_file: depend_on_referenced_packages

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolioapp/core/app_resources/app_images.dart';
import 'package:myportfolioapp/core/di/injection.dart';
import 'package:myportfolioapp/core/supabase/supabase_client.dart';
import 'package:myportfolioapp/core/themes/responsive_size.dart';
import 'package:myportfolioapp/core/themes/text_theme.dart';
import 'core/themes/app_colors.dart';
import 'core/common/routes.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  await initSupabase();
  await injectDependency();
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: context.getDesignSize,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.appBackground),
                  fit: BoxFit.fill,
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(),
              ),
            ),

            MaterialApp.router(
              routerConfig: router,
              title: 'Pallob | Flutter Developer',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                fontFamily: 'Roboto',
                scaffoldBackgroundColor: Colors.transparent,
                colorScheme: ColorScheme.fromSeed(
                  seedColor: AppColors.primaryBlue,
                  brightness: Brightness.dark,
                ),
                textTheme: textTheme,
                useMaterial3: true,
              ),
            ),
          ],
        );
      },
    );
  }
}

// flutter run -d web-server --web-port=8080
