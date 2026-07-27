import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolioapp/core/common/custom_outlined_button.dart';
import 'package:myportfolioapp/core/common/screen_shot_preview.dart';
import 'package:myportfolioapp/core/themes/app_colors.dart';
import 'package:myportfolioapp/core/common/common_dialog.dart';
import 'package:myportfolioapp/features/dashboard/domain/entity/category_list.dart';
import 'package:myportfolioapp/features/dashboard/domain/entity/key_feature_entity.dart';
import 'package:myportfolioapp/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:myportfolioapp/features/dashboard/presentation/bloc/dashboard_state.dart';
import 'package:myportfolioapp/features/dashboard/presentation/widgets/key_feature_widget.dart';
import 'package:myportfolioapp/features/dashboard/presentation/widgets/progress_window.dart';
import 'package:myportfolioapp/features/dashboard/presentation/widgets/solution_approach_widget.dart';
import 'package:myportfolioapp/features/dashboard/presentation/widgets/tech_stacks_preview.dart';
import 'package:myportfolioapp/features/projects/domain/entity/project_tech_stack.dart';

import '../../../../core/common/description_field.dart';
import '../../../../core/common/label_field.dart';
import '../../../../core/common/labled_dropdown.dart';
import '../../../../core/common/thumbnail_preview.dart';
import '../../../projects/domain/entity/project_add_item.dart';
import '../bloc/dashboard_event.dart';
import '../widgets/section_widget.dart';

class AddProjectPage extends StatefulWidget {
  const AddProjectPage({super.key});

  @override
  State<AddProjectPage> createState() => _AddProjectPageState();
}

class _AddProjectPageState extends State<AddProjectPage> {
  List<PlatformFile> files = [], screenShots = [];
  List<KeyFeatureEntity> keyFeatures = [];
  List<TextEditingController> solutions = [];
  Category? category;
  var descriptionController = TextEditingController();
  var overviewController = TextEditingController();
  var projectNameController = TextEditingController();
  var projectLinkController = TextEditingController();
  var projectPlatformController = TextEditingController();
  var projectRoleController = TextEditingController();
  var problemController = TextEditingController();
  var indexController = TextEditingController();
  var companyName = TextEditingController();
  var formKey = GlobalKey<FormState>();

  void clear() {
    setState(() {
      projectNameController.clear();
      descriptionController.clear();
      projectLinkController.clear();
      projectPlatformController.clear();
      projectRoleController.clear();
      overviewController.clear();
      category = null;
      techStacks = [];
      indexController.clear();
      files.clear();
    });
  }

  List<ProjectTechStack> techStacks = [], mainList = [];

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
        mainList = state.techStacks ?? [];
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
    if (isNarrow) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [titleBlock(), const SizedBox(height: 16), actions()],
      );
    } else {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: titleBlock()),
          actions(),
        ],
      );
    }
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

  Widget titleBlock() {
    return Column(
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
  }

  Widget actions() {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        _ghostButton('Cancel', onTap: () {}),
        _primaryButton(
          'Publish Project',
          Icons.send_outlined,
          onTap: () {
            if (formKey.currentState?.validate() ?? false) {
              if (techStacks.isNotEmpty && files.isNotEmpty) {
                context.read<DashBoardBloc>().add(
                  AddProjectEvent(
                    model: ProjectAddItem(
                      index: int.parse(indexController.text),
                      name: projectNameController.text,
                      type: category?.id ?? 1,
                      company: companyName.text,
                      description: descriptionController.text,
                      link: projectLinkController.text,
                      technology: techStacks,
                      files: files,
                    ),
                  ),
                );
              } else {}
            }
          },
        ),
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
        Form(
          key: formKey,
          child: SectionCard(
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
                      categoryList: dashboardProjectOptions,
                      onSelected: (category) {
                        setState(() {
                          this.category = category;
                        });
                      },
                      required: true,
                      hint: 'Select project type',
                    ),
                    LabeledField(
                      label: 'Role',
                      hint: 'eg. Developer',
                      controller: projectRoleController,
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
                      label: 'Platform',
                      hint: 'eg. Android, IOS , Web',
                      controller: projectPlatformController,
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
                    DescriptionField(
                      label: "Short Description",
                      hints: "write here..",
                      minLines: 2,
                      maxLines: 2,
                      controller: descriptionController,
                    ),
                  ],
                ),
                ResponsiveFieldRow(
                  children: [
                    DescriptionField(
                      label: "Add Overview",
                      hints: "write here..",
                      hasLimit: false,
                      controller: overviewController,
                      minLines: 4,
                      maxLines: 4,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20.h),
        TechStacksPreview(
          title: "Techstacks",
          techs: techStacks,

          onAdd: () {
            CommonDialog(
              child: TechStacksPreview(
                isSelection: true,
                onSelected: (list) {
                  setState(() {
                    techStacks = list;
                  });
                },
                title: "Select",
                techs: mainList,
              ),
              context: context,
            );
          },
          onRemove: (i) {
            setState(() {
              techStacks.removeAt(i);
            });
          },
        ),
        SizedBox(height: 20.h),
        KeyFeatureWidget(
          onRemove: (i) {
            setState(() {
              keyFeatures.removeAt(i);
            });
          },
          onAdd: () {
            setState(() {
              keyFeatures.add(
                KeyFeatureEntity(
                  title: TextEditingController(),
                  value: TextEditingController(),
                ),
              );
            });
          },
          keyFeatures: keyFeatures,
        ),
        SizedBox(height: 20.h),
        SolutionApproachWidget(
          solution: solutions,
          onAdd: () {
            setState(() {
              solutions.add(TextEditingController());
            });
          },
          onRemove: (index) {
            setState(() {
              solutions.removeAt(index);
            });
          },
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
            crossAxisAlignment: .center,
            children: [
              ThumbnailPreview(files: files),
              const SizedBox(height: 16),
              CustomOutlinedButton(
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
                label: "Add Images",
                iconData: Icons.add_photo_alternate_outlined,
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        SectionCard(
          title: 'Screenshots',
          child: Column(
            crossAxisAlignment: .center,
            children: [
              ScreenShotPreview(files: screenShots),
              const SizedBox(height: 16),
              CustomOutlinedButton(
                onTap: () async {
                  FilePickerResult? results = await FilePicker.pickFiles(
                    allowMultiple: true,
                    type: FileType.custom,
                    withData: true,
                    allowedExtensions: ['jpg', 'jpeg', 'png'],
                  );
                  screenShots = results?.files ?? [];
                  setState(() {});
                },
                label: "Add Images",
                iconData: Icons.screenshot,
              ),
            ],
          ),
        ),
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
