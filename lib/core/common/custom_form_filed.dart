import 'package:flutter/material.dart';
import 'package:myportfolioapp/core/themes/app_colors.dart';

import 'label_field.dart';

class CustomFormFiled extends StatelessWidget {
  final TextEditingController controller;
  final String hints;
  const CustomFormFiled({
    super.key,
    required this.controller,
    required this.hints,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 1,
      minLines: 1,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "This field is required";
        } else {
          return null;
        }
      },

      controller: controller,
      style: const TextStyle(color: AppColors.textPrimary, fontSize: 14),
      decoration: buildInputDecoration(hints),
    );
  }
}
