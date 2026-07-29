import 'package:flutter/material.dart';
import 'package:myportfolioapp/core/themes/app_colors.dart';

import 'label_field.dart';

class CustomFormFiled extends StatelessWidget {
  final TextEditingController controller;
  final String hints;
  final Function(String)? onChanged;
  const CustomFormFiled({
    super.key,
    required this.controller,
    required this.hints,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 1,
      minLines: 1,
      onChanged: onChanged,
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
