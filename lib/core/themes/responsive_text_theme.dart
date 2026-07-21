import 'package:flutter/material.dart';

extension ResponsiveTextTheme on BuildContext {
  TextTheme get fontStyle {
    final theme = Theme.of(this).textTheme;
    final width = MediaQuery.sizeOf(this).width;

    double factor;

    if (width >= 1440) {
      factor = 1;
    } else if (width >= 834) {
      factor = width / 834;
    } else {
      factor = width / 390;
    }

    TextStyle? scale(TextStyle? style) {
      if (style == null) return null;
      return style.copyWith(
        fontSize: style.fontSize! * factor.clamp(0.85, 1.2),
      );
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
