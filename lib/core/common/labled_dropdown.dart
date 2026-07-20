import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/dashboard/domain/entity/category_list.dart';
import '../app_resources/app_colors.dart';
import '../app_resources/app_fonts.dart';
import 'field_label.dart';

class LabeledDropdown extends StatefulWidget {
  final String? label;
  final String hint;
  final bool required;
  final List<Category> categoryList;
  final Function(Category?) onSelected;

  const LabeledDropdown({
    super.key,
    this.label,
    required this.hint,
    this.required = false,
    required this.categoryList,
    required this.onSelected,
  });

  @override
  State<LabeledDropdown> createState() => _LabeledDropdownState();
}

class _LabeledDropdownState extends State<LabeledDropdown> {
  Category? _value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          FieldLabel(label: widget.label!, required: widget.required),
          const SizedBox(height: 8),
        ],
        FormField<Category?>(
          validator: (value) {
            if (widget.required) {
              if (value == null) {
                return "This field is required";
              } else {
                return null;
              }
            } else {
              return null;
            }
          },
          builder: (field) => Column(
            crossAxisAlignment: .start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  color: AppColors.field,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: field.hasError
                        ? AppColors.danger
                        : AppColors.fieldBorder,
                    width: 0.5,
                  ),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<Category?>(
                    value: _value,
                    isExpanded: true,
                    hint: Text(
                      widget.hint,
                      style: const TextStyle(
                        color: AppColors.textMuted,
                        fontSize: 13.5,
                      ),
                    ),
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColors.textMuted,
                    ),
                    dropdownColor: AppColors.card,
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 14,
                    ),
                    items: widget.categoryList
                        .map(
                          (category) => DropdownMenuItem(
                            value: category,
                            child: Text(category.name),
                          ),
                        )
                        .toList(),
                    onChanged: (v) {
                      setState(() => _value = v);
                      field.didChange(v);
                      widget.onSelected(v);
                    },
                  ),
                ),
              ),
              field.hasError
                  ? Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        field.errorText ?? "",
                        style: TextStyle(
                          color: AppColors.danger,
                          fontSize: 12.sp,
                          fontFamily: AppFonts.inter,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ],
    );
  }
}
