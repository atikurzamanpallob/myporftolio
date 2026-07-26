import 'package:flutter/material.dart';

extension ResponsiveSize on BuildContext {
  static const double mobileMax = 700;
  static const double tabletMax = 1100;

  bool get isMobile {
    return MediaQuery.sizeOf(this).width < mobileMax;
  }

  bool get isTablet {
    final w = MediaQuery.sizeOf(this).width;
    return w >= mobileMax && w < tabletMax;
  }

  bool get isDesktop {
    return MediaQuery.sizeOf(this).width >= tabletMax;
  }
}
