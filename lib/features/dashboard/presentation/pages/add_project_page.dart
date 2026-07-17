import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolioapp/core/app_resources/app_colors.dart';
import 'package:myportfolioapp/core/common/common_dialog.dart';
import 'package:myportfolioapp/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:myportfolioapp/features/dashboard/presentation/bloc/dashboard_event.dart';
import 'package:myportfolioapp/features/dashboard/presentation/bloc/dashboard_state.dart';
import 'package:myportfolioapp/features/dashboard/presentation/widgets/progress_window.dart';
import 'package:myportfolioapp/features/projects/domain/entity/project_add_item.dart';

import '../widgets/section_widget.dart';

class AddProjectPage extends StatefulWidget {
  const AddProjectPage({super.key});

  @override
  State<AddProjectPage> createState() => _AddProjectPageState();
}

class _AddProjectPageState extends State<AddProjectPage> {
  List<String> technologies = [];
  List<PlatformFile> files = [];
  int option = -1;
  var descriptionController = TextEditingController();
  var projectNameController = TextEditingController();
  var projectLinkController = TextEditingController();
  var indexController = TextEditingController();
  var companyName = TextEditingController();

  void clear() {
    setState(() {
      projectNameController.clear();
      descriptionController.clear();
      projectLinkController.clear();
      option = -1;
      technologies = [];
      indexController.clear();
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
          'Add New Project',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 28,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'Fill in the details below to showcase your work.',
          style: TextStyle(color: AppColors.textSecondary, fontSize: 14),
        ),
      ],
    );

    final actions = Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        _ghostButton('Cancel', onTap: () {}),
        _primaryButton(
          'Publish Project',
          Icons.send_outlined,
          onTap: () {
            if (projectNameController.text.isNotEmpty) {
              if (option != -1) {
                if (projectLinkController.text.isNotEmpty) {
                  if (indexController.text.isNotEmpty) {
                    if (companyName.text.isNotEmpty) {
                      if (descriptionController.text.isNotEmpty) {
                        if (technologies.isNotEmpty) {
                          if (files.isNotEmpty) {
                            context.read<DashBoardBloc>().add(
                              AddProjectEvent(
                                model: ProjectAddItem(
                                  index: int.parse(indexController.text),
                                  name: projectNameController.text,
                                  type: option,
                                  company: companyName.text,
                                  description: descriptionController.text,
                                  link: projectLinkController.text,
                                  technology: technologies,
                                  files: files,
                                ),
                              ),
                            );
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          },
        ),
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
          title: 'Basic Information',
          child: Column(
            children: [
              ResponsiveFieldRow(
                children: [
                  LabeledField(
                    label: 'Project Title',
                    required: true,
                    hint: 'e.g. Shoply – E-commerce Mobile App',
                    controller: projectNameController,
                  ),
                  LabeledDropdown(
                    label: 'Project Type',

                    onSelected: (option) {
                      setState(() {
                        this.option = option;
                      });
                    },
                    required: true,
                    hint: 'Select project type',
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ResponsiveFieldRow(
                children: [
                  LabeledField(
                    label: 'Project Link',
                    hint: 'https://yourproject.com',
                    controller: projectLinkController,
                  ),
                  LabeledField(
                    label: 'Order Index',
                    hint: '0',
                    controller: indexController,
                  ),
                  LabeledField(
                    label: 'Associated With',
                    hint: 'eg. Personal',
                    controller: companyName,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ResponsiveFieldRow(
                children: [
                  _ShortDescriptionField(controller: descriptionController),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        SectionCard(
          title: 'Technologies Used',
          child: ChipInputField(
            hint: 'Add technologies and press Enter...',
            items: technologies,
            onRemove: (i) => setState(() => technologies.removeAt(i)),
            onAdd: (v) => setState(() => technologies.add(v)),
          ),
        ),
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
              const ScreenshotDropZone(),
              const SizedBox(height: 16),
              ScreenshotThumbnailGrid(files: files),
              const SizedBox(height: 16),
              _outlinedIconButton(
                'Add Images',
                Icons.add,
                fullWidth: true,
                onTap: () async {
                  FilePickerResult? results = await FilePicker.pickFiles(
                    allowMultiple: true,
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

class _ShortDescriptionField extends StatefulWidget {
  final TextEditingController controller;
  const _ShortDescriptionField({required this.controller});

  @override
  State<_ShortDescriptionField> createState() => _ShortDescriptionFieldState();
}

class _ShortDescriptionFieldState extends State<_ShortDescriptionField> {
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
