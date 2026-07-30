import 'package:flutter/material.dart';
import 'package:myportfolioapp/core/constants/break_points.dart';

extension ResponsiveTextTheme on BuildContext {
  TextTheme get fontStyle {
    final theme = Theme.of(this).textTheme;
    final width = MediaQuery.sizeOf(this).width;
    double factor;

    if (width < Breakpoints.mobile) {
      factor = 0.85;
    } else if (width < Breakpoints.smallTablet) {
      factor = 0.95;
    } else if (width < Breakpoints.laptop) {
      factor = 1.05;
    } else if (width < Breakpoints.desktop) {
      factor = 1.15;
    } else {
      factor = 1.25;
    }

    TextStyle? scale(TextStyle? style) {
      if (style == null) return null;
      return style.copyWith(fontSize: style.fontSize! * factor);
    }

    return theme.copyWith(
      displayLarge: scale(theme.displayLarge),
      displayMedium: scale(theme.displayMedium),
      displaySmall: scale(theme.displaySmall),
      headlineLarge: scale(theme.headlineLarge),
      headlineMedium: scale(theme.headlineMedium),
      headlineSmall: scale(theme.headlineSmall),
      titleLarge: scale(theme.titleLarge),
      titleMedium: scale(theme.titleMedium),
      titleSmall: scale(theme.titleSmall),
      bodyLarge: scale(theme.bodyLarge),
      bodyMedium: scale(theme.bodyMedium),
      bodySmall: scale(theme.bodySmall),
      labelLarge: scale(theme.labelLarge),
      labelMedium: scale(theme.labelMedium),
      labelSmall: scale(theme.labelSmall),
    );
  }
}
