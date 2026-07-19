import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolioapp/core/app_resources/app_colors.dart';
import 'package:myportfolioapp/core/common/common_dialog.dart';
import 'package:myportfolioapp/core/common/labled_date_field.dart';
import 'package:myportfolioapp/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:myportfolioapp/features/dashboard/presentation/bloc/dashboard_state.dart';
import 'package:myportfolioapp/features/dashboard/presentation/widgets/progress_window.dart';

import '../../../../core/common/description_field.dart';
import '../../../../core/common/label_field.dart' hide buildInputDecoration;
import '../../../../core/common/labled_dropdown.dart';
import '../../../../core/common/screen_shot_preview.dart';
import '../../domain/entity/category_list.dart';
import '../widgets/section_widget.dart';

class AddBlogPage extends StatefulWidget {
  const AddBlogPage({super.key});

  @override
  State<AddBlogPage> createState() => _AddBlogPageState();
}

class _AddBlogPageState extends State<AddBlogPage> {
  List<PlatformFile> files = [];
  Category? category;

  var titleController = TextEditingController();
  var indexController = TextEditingController();
  var shortDescriptionController = TextEditingController();
  var readController = TextEditingController();
  DateTime? selectedDate;
  void clear() {
    setState(() {
      category = null;
      indexController.clear();
      titleController.clear();
      shortDescriptionController.clear();
      files.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isNarrow = width < 1000;

    return BlocConsumer<DashBoardBloc, DashboardState>(
      listener: (context, state) {
        if (state.isLoading == true) {
          CommonDialog(child: ProgressWindow(), context: context);
        }
        if (state.isLoading == false) {
          Navigator.pop(context);
          clear();
        }
      },
      builder: (context, state) {
        return Expanded(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(32, 24, 32, 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHeader(context, isNarrow),
                      const SizedBox(height: 24),
                      isNarrow
                          ? _buildStackedLayout()
                          : _buildTwoColumnLayout(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context, bool isNarrow) {
    final titleBlock = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Create New Blogs',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 28,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );

    final actions = Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        _ghostButton('Cancel', onTap: () {}),
        _primaryButton('Publish', Icons.send_outlined, onTap: () {}),
      ],
    );

    if (isNarrow) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [titleBlock, const SizedBox(height: 16), actions],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: titleBlock),
        actions,
      ],
    );
  }

  Widget _buildTwoColumnLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 2, child: _buildLeftColumn()),
        const SizedBox(width: 24),
        Expanded(flex: 1, child: _buildRightColumn()),
      ],
    );
  }

  Widget _buildStackedLayout() {
    return Column(
      children: [
        _buildLeftColumn(),
        const SizedBox(height: 24),
        _buildRightColumn(),
      ],
    );
  }

  Widget _buildLeftColumn() {
    return Column(
      children: [
        SectionCard(
          child: Column(
            children: [
              ResponsiveFieldRow(
                children: [
                  LabeledField(
                    label: 'Title',
                    required: true,
                    hint: 'e.g. How I create a portfolio with flutter',
                    controller: titleController,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ResponsiveFieldRow(
                children: [
                  DescriptionField(
                    minLines: 2,
                    controller: shortDescriptionController,
                    hints: "Short summary about the blog",
                  ),
                ],
              ),

              ResponsiveFieldRow(
                children: [
                  BlocBuilder<DashBoardBloc, DashboardState>(
                    builder: (context, state) {
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          LabeledDropdown(
                            label: 'Blog Type',
                            categoryList: state.category ?? [],
                            onSelected: (category) {
                              setState(() {
                                this.category = category;
                              });
                            },
                            required: true,
                            hint: 'Select Blog Type',
                          ),
                          (state.isCategoryLoading ?? false)
                              ? CircularProgressIndicator()
                              : const SizedBox.shrink(),
                        ],
                      );
                    },
                  ),
                  LabeledField(
                    label: 'Order Index',
                    hint: '0',
                    controller: indexController,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ResponsiveFieldRow(
                children: [
                  LabeledDateField(
                    label: 'Pick Date',
                    hint: "eg. 12 July 2026",
                    selectedDate: selectedDate,
                    onDateSelected: (date) {
                      setState(() {
                        selectedDate = date;
                      });
                    },
                  ),
                  LabeledField(
                    label: 'Read Time',
                    hint: '10 minutes read',
                    controller: readController,
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        SectionCard(child: Column(children: [
            
          ],
        )),
      ],
    );
  }

  Widget _buildRightColumn() {
    return Column(
      children: [
        SectionCard(
          title: 'Thumbnails',
          child: Column(
            children: [
              ScreenshotThumbnailGrid(files: files, column: 1),
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
                  files = results?.files ?? [];
                  setState(() {});
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _ghostButton(String label, {required VoidCallback onTap}) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.textSecondary,
        side: const BorderSide(color: AppColors.fieldBorder),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
    );
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

  Widget _primaryButton(
    String label,
    IconData icon, {
    required VoidCallback onTap,
  }) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, size: 16, color: Colors.white),
      label: Text(
        label,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.accentBlue,
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 0,
      ),
    );
  }
}
