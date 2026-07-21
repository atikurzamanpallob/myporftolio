import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../themes/app_colors.dart';
import '../app_resources/app_fonts.dart';
import 'field_label.dart';

class LabeledField extends StatelessWidget {
  final String label;
  final String hint;
  final bool required;
  final int maxLines;
  final TextEditingController controller;
  const LabeledField({
    super.key,
    required this.label,
    required this.hint,
    this.required = true,
    required this.controller,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FieldLabel(label: label, required: required),
        const SizedBox(height: 8),
        TextFormField(
          maxLines: maxLines,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "This field is required";
            } else {
              return null;
            }
          },
          controller: controller,
          style: const TextStyle(color: AppColors.textPrimary, fontSize: 14),
          decoration: buildInputDecoration(hint),
        ),
      ],
    );
  }
}

InputDecoration buildInputDecoration(String hint, {bool hasError = false}) {
  return InputDecoration(
    hintText: hint,
    hintStyle: const TextStyle(color: AppColors.textMuted, fontSize: 13.5),
    filled: true,
    fillColor: AppColors.field,

    errorStyle: TextStyle(
      color: AppColors.danger,
      fontSize: 12.sp,
      fontFamily: AppFonts.inter,
    ),

    contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: hasError ? AppColors.danger : AppColors.fieldBorder,
        width: 0.5,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: hasError ? AppColors.danger : AppColors.fieldBorder,
        width: 0.5,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: AppColors.danger, width: 0.5),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: AppColors.accentBlueLight,
        width: 0.5,
      ),
    ),
  );
}
