import 'package:flutter/material.dart';

import '../../../../core/app_resources/app_colors.dart';
import '../../../../core/common/field_label.dart';
import 'section_widget.dart';

class ChipInputField extends StatefulWidget {
  final String hint;
  final String title;
  final List<String> items;
  final void Function(int index) onRemove;
  final void Function(String value) onAdd;

  const ChipInputField({
    super.key,
    required this.hint,
    required this.title,
    required this.items,
    required this.onRemove,
    required this.onAdd,
  });

  @override
  State<ChipInputField> createState() => _ChipInputFieldState();
}

class _ChipInputFieldState extends State<ChipInputField> {
  final _controller = TextEditingController();

  void _submit(String value) {
    final v = value.trim();
    if (v.isNotEmpty) {
      widget.onAdd(v);
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FieldLabel(label: "Tech Stacks", required: true),
        const SizedBox(height: 8),
        TextField(
          controller: _controller,
          onSubmitted: _submit,
          style: const TextStyle(color: AppColors.textPrimary, fontSize: 14),
          decoration: buildInputDecoration(widget.hint),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (int i = 0; i < widget.items.length; i++)
              _Chip(label: widget.items[i], onRemove: () => widget.onRemove(i)),
          ],
        ),
      ],
    );
  }
}

class _Chip extends StatelessWidget {
  final String label;
  final VoidCallback onRemove;
  const _Chip({required this.label, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.chipBg,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: AppColors.fieldBorder),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 12.5,
            ),
          ),
          const SizedBox(width: 6),
          GestureDetector(
            onTap: onRemove,
            child: const Icon(
              Icons.close,
              size: 13,
              color: AppColors.textMuted,
            ),
          ),
        ],
      ),
    );
  }
}
