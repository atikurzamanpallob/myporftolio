import 'package:flutter/widgets.dart';

/// Breakpoints (logical pixels, based on MediaQuery width):
/// - Mobile  : < 700
/// - Tablet  : 700 - 1099
/// - Desktop : >= 1100
class Responsive {
  Responsive._();

  static const double mobileMax = 700;
  static const double tabletMax = 1100;

  static bool isMobile(BuildContext context) =>
      MediaQuery.sizeOf(context).width < mobileMax;

  static bool isTablet(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    return w >= mobileMax && w < tabletMax;
  }

  static bool isDesktop(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= tabletMax;

  /// Returns the ScreenUtil design size to use based on current window width.
  /// This lets flutter_screenutil scale fonts/spacing appropriately whether
  /// the app is being viewed on a phone, tablet, or desktop browser window.
  static Size designSizeFor(double width) {
    if (width >= tabletMax) {
      return const Size(1440, 1024); // desktop design reference
    } else if (width >= mobileMax) {
      return const Size(834, 1194); // tablet design reference
    }
    return const Size(390, 844); // mobile design reference
  }
}
