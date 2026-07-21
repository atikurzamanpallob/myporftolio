import 'package:flutter/material.dart';

import '../app_resources/app_colors.dart';

class FieldLabel extends StatelessWidget {
  final String label;
  final bool required;
  const FieldLabel({super.key, required this.label, this.required = false});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          color: AppColors.textPrimary,
          fontSize: 13.5,
          fontWeight: FontWeight.w500,
        ),
        children: [
          TextSpan(text: label),
          if (required)
            const TextSpan(
              text: ' *',
              style: TextStyle(color: AppColors.danger),
            ),
        ],
      ),
    );
  }
}
