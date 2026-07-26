import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:myportfolioapp/core/app_resources/app_fonts.dart';

import '../themes/app_colors.dart';
import 'field_label.dart';
import 'label_field.dart';

class LabeledDateField extends StatelessWidget {
  final String label;
  final String hint;
  final bool required;
  final DateTime? selectedDate;
  final ValueChanged<DateTime> onDateSelected;
  final DateTime? firstDate;
  final DateTime? lastDate;

  const LabeledDateField({
    super.key,
    required this.label,
    required this.hint,
    required this.onDateSelected,
    this.required = false,
    this.selectedDate,
    this.firstDate,
    this.lastDate,
  });

  String _formatDate(DateTime date) {
    return DateFormat("dd MMM yyyy").format(date);
  }

  Future<void> _pickDate(
    BuildContext context,
    FormFieldState<DateTime?> field,
  ) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime(1900),
      lastDate: lastDate ?? DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: AppColors.accentBlueLight,
              onPrimary: Colors.white,
              surface: AppColors.field,
              onSurface: AppColors.textPrimary,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      field.didChange(picked);
      onDateSelected(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FieldLabel(label: label, required: required),
        const SizedBox(height: 8),
        FormField<DateTime?>(
          validator: (value) {
            if (required) {
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
              InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () {
                  _pickDate(context, field);
                },
                child: InputDecorator(
                  decoration: buildInputDecoration(
                    hint,
                    hasError: field.hasError,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        selectedDate != null
                            ? _formatDate(selectedDate!)
                            : hint,
                        style: TextStyle(
                          color: selectedDate != null
                              ? AppColors.textPrimary
                              : AppColors.textMuted,
                          fontSize: selectedDate != null ? 14 : 13.5,
                        ),
                      ),
                      const Icon(
                        Icons.calendar_today_outlined,
                        size: 18,
                        color: AppColors.textMuted,
                      ),
                    ],
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
