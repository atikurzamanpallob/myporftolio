import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolioapp/core/app_resources/app_constants.dart';
import 'package:myportfolioapp/core/common/description_field.dart';
import 'package:myportfolioapp/core/common/label_field.dart';
import 'package:myportfolioapp/core/common/labled_dropdown.dart';
import 'package:myportfolioapp/features/dashboard/domain/entity/category_list.dart';
import 'package:myportfolioapp/features/dashboard/domain/entity/description_elements.dart';

import '../../../../core/app_resources/app_colors.dart';
import '../../../../core/common/glass_card.dart';
import '../../../../core/common/screen_shot_preview.dart';
import 'section_widget.dart';

class ElementAddWindow extends StatefulWidget {
  final Function(DescriptionItem) onAddElement;
  const ElementAddWindow({super.key, required this.onAddElement});

  @override
  State<ElementAddWindow> createState() => _ElementAddWindowState();
}

class _ElementAddWindowState extends State<ElementAddWindow> {
  Category? selected;
  var textController = TextEditingController();
  var widthController = TextEditingController(text: "0");
  var heightController = TextEditingController(text: "0");
  PlatformFile? file;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return GlassCard(
      child: Container(
        height: height * 0.8,
        width: width * 0.6,
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),

        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              "Add Elements",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            SizedBox(height: 20.h),
            ResponsiveFieldRow(
              children: [
                LabeledDropdown(
                  label: "Select Type",
                  hint: "Select Widget Type",
                  categoryList: widgetsCategory,
                  onSelected: (selected) {
                    setState(() {
                      this.selected = selected;
                    });
                  },
                ),
                SizedBox(width: 400.w),
              ],
            ),
            SizedBox(height: 20.h),
            getInputWidget(selected?.id ?? 0),
            SizedBox(height: 20.h),
            SizedBox(
              width: double.infinity,
              height: 50.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(10.r),
                  ),
                ),
                onPressed: () {
                  widget.onAddElement(
                    DescriptionItem(
                      type: selected?.id ?? 2,
                      text: textController.text,
                      file: file,
                      height: double.parse(heightController.text),
                      width: double.parse(widthController.text),
                    ),
                  );
                  Navigator.pop(context);
                },
                child: Text(
                  "Add Item",
                  style: TextStyle(color: AppColors.textPrimary),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getInputWidget(int categoryId) {
    switch (categoryId) {
      case AppConstants.Heading:
        return DescriptionField(
          label: "Heading",
          hints: "Enter",
          maxLines: 5,
          minLines: 5,
          hasLimit: false,
          controller: textController,
        );
      case AppConstants.Body:
        return DescriptionField(
          label: "Body",
          hints: "Enter",
          maxLines: 5,
          minLines: 5,
          hasLimit: false,
          controller: textController,
        );
      case AppConstants.Spacer:
        return ResponsiveFieldRow(
          children: [
            LabeledField(
              label: "Height",
              hint: "1",
              controller: heightController,
            ),
          ],
        );

      case AppConstants.Image:
        return Column(
          children: [
            ResponsiveFieldRow(
              children: [
                LabeledField(
                  label: "Width",
                  hint: "20",
                  controller: widthController,
                ),
                LabeledField(
                  label: "Height",
                  hint: "20",
                  controller: heightController,
                ),
              ],
            ),
            const SizedBox(height: 16),
            ScreenshotThumbnailGrid(
              files: file != null ? [file!] : [],
              column: 1,
            ),
            const SizedBox(height: 16),
            _outlinedIconButton(
              'Add Image',
              Icons.add,
              fullWidth: true,
              onTap: () async {
                FilePickerResult? results = await FilePicker.pickFiles(
                  allowMultiple: false,
                  type: FileType.custom,
                  withData: true,
                  allowedExtensions: ['jpg', 'jpeg', 'png'],
                );
                results?.files.forEach((element) {
                  setState(() {
                    file = element;
                  });
                });
              },
            ),
          ],
        );
      case AppConstants.DartCode:
        return DescriptionField(
          label: "Code",
          hints: "Enter your dart code",
          controller: textController,
          minLines: 8,
          maxLines: 8,
          hasLimit: false,
        );

      case AppConstants.JsCode:
        return DescriptionField(
          label: "Code",
          hints: "Enter your javascript code",
          controller: textController,
          minLines: 8,
          maxLines: 8,
          hasLimit: false,
        );
      default:
        return SizedBox.shrink();
    }
  }

  Widget _outlinedIconButton(
    String label,
    IconData icon, {
    required VoidCallback onTap,
    bool fullWidth = false,
  }) {
    final button = OutlinedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, size: 16, color: AppColors.accentBlueLight),
      label: Text(
        label,
        style: const TextStyle(
          color: AppColors.accentBlueLight,
          fontWeight: FontWeight.w600,
        ),
      ),
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: AppColors.accentBlueLight),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
    return fullWidth ? SizedBox(width: double.infinity, child: button) : button;
  }
}
