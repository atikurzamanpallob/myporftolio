import 'package:flutter/material.dart';
import 'package:myportfolioapp/core/constants/break_points.dart';

extension ResponsiveSize on BuildContext {
  bool get isMobile {
    final width = MediaQuery.sizeOf(this).width;
    return width <= Breakpoints.mobile;
  }

  bool get isTablet {
    final width = MediaQuery.sizeOf(this).width;
    return width > Breakpoints.mobile && width <= Breakpoints.smallTablet;
  }

  bool get isLaptop {
    final width = MediaQuery.sizeOf(this).width;
    return width > Breakpoints.smallTablet && width <= Breakpoints.laptop;
  }

  bool get isDesktop {
    final width = MediaQuery.sizeOf(this).width;
    return width > Breakpoints.laptop && width <= Breakpoints.desktop;
  }

  Size get getDesignSize {
    double width = MediaQuery.sizeOf(this).width;
    if (width <= Breakpoints.mobile) {
      // Phone (Figma mobile frame)
      return const Size(390, 844);
    } else if (width > Breakpoints.mobile && width <= Breakpoints.smallTablet) {
      // Small tablet
      return const Size(768, 1024);
    } else if (width > Breakpoints.smallTablet && width <= Breakpoints.laptop) {
      // Large tablet / Small laptop
      return const Size(1024, 768);
    } else if (width > Breakpoints.laptop && width <= Breakpoints.desktop) {
      // Desktop
      return const Size(1440, 1024);
    } else {
      // Large desktop
      return const Size(1920, 1080);
    }
  }
}
