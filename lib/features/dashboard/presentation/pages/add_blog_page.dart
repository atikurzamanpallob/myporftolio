import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolioapp/core/themes/app_colors.dart';
import 'package:myportfolioapp/core/common/common_dialog.dart';
import 'package:myportfolioapp/core/common/labled_date_field.dart';
import 'package:myportfolioapp/core/utils/time_formatter.dart';
import 'package:myportfolioapp/features/blogs/domain/entity/blog_add_item.dart';
import 'package:myportfolioapp/features/dashboard/domain/entity/description_elements.dart';
import 'package:myportfolioapp/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:myportfolioapp/features/dashboard/presentation/bloc/dashboard_event.dart';
import 'package:myportfolioapp/features/dashboard/presentation/bloc/dashboard_state.dart';
import 'package:myportfolioapp/features/dashboard/presentation/widgets/description_card.dart';
import 'package:myportfolioapp/features/dashboard/presentation/widgets/element_add_window.dart';
import 'package:myportfolioapp/features/dashboard/presentation/widgets/progress_window.dart';

import '../../../../core/app_resources/app_fonts.dart';
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
  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var indexController = TextEditingController();
  var shortDescriptionController = TextEditingController();
  var readController = TextEditingController();
  List<DescriptionItem> listItems = [];
  DateTime? selectedDate;
  void clear() {
    setState(() {
      category = null;
      indexController.clear();
      titleController.clear();
      listItems.clear();
      selectedDate = null;
      readController.clear();
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
                  child: Form(
                    key: formKey,
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
        _primaryButton(
          'Publish',
          Icons.send_outlined,
          onTap: () {
            if (formKey.currentState?.validate() ?? false) {
              if (listItems.isNotEmpty) {
                context.read<DashBoardBloc>().add(
                  AddBlogEvent(
                    item: BlogAddItem(
                      index: int.parse(indexController.text),
                      categoryId: category!.id,
                      categoryName: category!.name,
                      title: titleController.text,
                      shortDescription: shortDescriptionController.text,
                      thumbnail: files.first,
                      date: TimeFormatter.getFormattedDate(
                        selectedDate ?? DateTime.now(),
                      ),
                      readTime: "${readController.text} minutes read",
                      descriptionItems: listItems,
                    ),
                  ),
                );
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
                    isRequired: true,
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
                    required: true,
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
                    required: true,
                    selectedDate: selectedDate,
                    onDateSelected: (date) {
                      setState(() {
                        selectedDate = date;
                      });
                    },
                  ),
                  LabeledField(
                    label: 'Read Time (minutes)',
                    hint: '10',
                    required: true,
                    controller: readController,
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        SectionCard(
          onAdd: () {
            CommonDialog(
              context: context,
              child: ElementAddWindow(
                onAddElement: (element) {
                  setState(() {
                    listItems.add(element);
                  });
                },
              ),
            );
          },
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: listItems.length,
            itemBuilder: (context, index) {
              return DescriptionCard(element: listItems[index]);
            },
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
          child: FormField<int>(
            validator: (value) {
              if (value == null) {
                return "This field is required";
              } else {
                return null;
              }
            },
            builder: (field) => Column(
              crossAxisAlignment: .start,
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
                    if (files.isNotEmpty) {
                      field.didChange(1);
                    }
                    setState(() {});
                  },
                ),
                field.hasError
                    ? Text(
                        field.errorText ?? "",
                        style: TextStyle(
                          color: AppColors.danger,
                          fontSize: 12.sp,
                          fontFamily: AppFonts.inter,
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ],
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
