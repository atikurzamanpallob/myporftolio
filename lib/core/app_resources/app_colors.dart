import 'package:flutter/material.dart';

/// Centralized color palette matching the Figma design.
class AppColors {
  AppColors._();

  // Backgrounds
  static const Color background = Color(0xFF000818); // main page background
  static const Color navBackground = Color(0xFF000818); // top nav bar (darker)
  static const Color cardBackground = Color(
    0xFF0F2340,
  ); // about / service cards
  static const Color heroCircleBackground = Color(0xFF12294A);

  // Accents
  static const Color primaryBlue = Color(
    0xFF2E9BFA,
  ); // "Flutter" highlight + active nav
  static const Color accentGreen = Color(
    0xFF29E0A6,
  ); // "Flutter Developer" subtitle + stat numbers
  static const Color iconCircleBorder = Color(0xFF1E4066);
  static const Color iconCircleFill = Color(0xFF0F2A4D);
  static const Color starYellow = Color(0xFFF4EE58);

  // Text
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Color(0xFFB8C4D9);
  static const Color textMuted = Color(0xFF8A96AC);

  // Borders / dividers
  static const Color divider = Color(0xFF23375A);
  static const Color buttonBorder = Color(0xFFFFFFFF);
}
