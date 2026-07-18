import 'package:flutter/material.dart';

import '../app_resources/app_colors.dart';
import 'field_label.dart';
import 'label_field.dart';

class DescriptionField extends StatefulWidget {
  final TextEditingController controller;
  const DescriptionField({required this.controller, super.key});

  @override
  State<DescriptionField> createState() => DescriptionFieldState();
}

class DescriptionFieldState extends State<DescriptionField> {
  int _len = 0;
  static const _max = 400;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const FieldLabel(label: 'Short Description', required: true),
        const SizedBox(height: 8),
        TextField(
          controller: widget.controller,
          maxLength: _max,
          minLines: 1,
          maxLines: 4,
          onChanged: (v) => setState(() => _len = v.length),
          style: const TextStyle(color: AppColors.textPrimary, fontSize: 14),
          decoration: buildInputDecoration(
            'A short summary of the project',
          ).copyWith(counterText: ''),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            '$_len/$_max',
            style: const TextStyle(color: AppColors.textMuted, fontSize: 12),
          ),
        ),
      ],
    );
  }
}
