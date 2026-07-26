import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myportfolioapp/core/common/custom_form_filed.dart';
import 'package:myportfolioapp/core/themes/app_colors.dart';
import 'package:myportfolioapp/core/themes/responsive_size.dart';
import 'package:myportfolioapp/features/dashboard/domain/entity/tech_add_entity.dart';
import 'package:myportfolioapp/features/dashboard/presentation/bloc/dashboard_event.dart';
import 'package:myportfolioapp/features/dashboard/presentation/widgets/section_widget.dart';

import '../../../../core/common/common_dialog.dart';
import '../bloc/dashboard_bloc.dart';
import '../bloc/dashboard_state.dart';
import '../widgets/progress_window.dart';

class AddOptionPage extends StatefulWidget {
  const AddOptionPage({super.key});

  @override
  State<AddOptionPage> createState() => _AddOptionPageState();
}

class _AddOptionPageState extends State<AddOptionPage> {
  List<TechAddEntity> techs = [];
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashBoardBloc, DashboardState>(
      listener: (context, state) {
        if (state.isLoading == true) {
          CommonDialog(child: ProgressWindow(), context: context);
        }
        if (state.isLoading == false) {
          techs.clear();
          Navigator.pop(context);
          setState(() {});
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
                      Form(
                        key: formKey,
                        child: SectionCard(
                          title: "Add Techstacks",
                          submit: () {
                            if (formKey.currentState?.validate() ?? false) {
                              if (techs.isNotEmpty) {
                                context.read<DashBoardBloc>().add(
                                  AddTechEvent(techList: techs),
                                );
                              }
                            }
                          },
                          onAdd: () async {
                            FilePickerResult? results =
                                await FilePicker.pickFiles(
                                  allowMultiple: true,
                                  type: FileType.custom,
                                  withData: true,
                                  allowedExtensions: ['svg'],
                                );
                            if (results?.files.isNotEmpty ?? false) {
                              setState(() {
                                results?.files.forEach((file) {
                                  techs.add(
                                    TechAddEntity(
                                      controller: TextEditingController(),
                                      icon: file,
                                    ),
                                  );
                                });
                              });
                            }
                          },
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisExtent: 100.h,

                                  crossAxisCount: context.isDesktop
                                      ? 4
                                      : context.isTablet
                                      ? 3
                                      : 1,
                                ),
                            shrinkWrap: true,
                            itemCount: techs.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Stack(
                                  alignment: .topRight,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(10.0),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              5,
                                            ),
                                            border: Border.all(
                                              width: 0.2,
                                              color: AppColors.textPrimary,
                                            ),
                                          ),
                                          child: SvgPicture.memory(
                                            techs[index].icon!.bytes!,
                                            width: 35.r,
                                            height: 35.r,
                                          ),
                                        ),
                                        SizedBox(width: 10.w),
                                        Expanded(
                                          child: CustomFormFiled(
                                            controller: techs[index].controller,

                                            hints: "Write",
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            techs.removeAt(index);
                                          });
                                        },
                                        icon: Icon(
                                          Icons.close,
                                          color: AppColors.danger,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
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
}
