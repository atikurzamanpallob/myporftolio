import 'package:flutter/material.dart';

import '../../../../core/app_resources/app_icons.dart';

class TrustBadge {
  const TrustBadge({
    required this.iconAsset,
    required this.title,
    required this.description,
    required this.accentColor,
  });

  final String iconAsset;
  final String title;
  final String description;
  final Color accentColor;
}

class ContactInfoItem {
  const ContactInfoItem({
    required this.iconAsset,
    required this.label,
    required this.value,
  });

  final String iconAsset;
  final String label;
  final String value;
}

const List<TrustBadge> kTrustBadges = [
  TrustBadge(
    iconAsset: AppIcons.lightening,
    title: 'Fast Response',
    description: 'Usually I reply within 24 hours',
    accentColor: Color(0xFFFFD200),
  ),
  TrustBadge(
    iconAsset: AppIcons.communication,
    title: 'Clear Communication',
    description: 'I believe in transparency and regular updates',
    accentColor: Color(0xFF48B1DD),
  ),
  TrustBadge(
    iconAsset: AppIcons.quality,
    title: 'Quality Work',
    description: "I'm committed to deliver the best results",
    accentColor: Color(0xFF647EFF),
  ),
];

List<String> icons = [
  AppIcons.github,
  AppIcons.linkedin,
  AppIcons.hackerrank,
  AppIcons.email,
  AppIcons.phone,
  AppIcons.whatsapp,
  AppIcons.location,
];
