import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myportfolioapp/features/projects/domain/entity/project_tech_stack.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/responsive_size.dart';
import '../../../../core/themes/responsive_text_theme.dart';
import 'section_widget.dart';

class TechStacksPreview extends StatefulWidget {
  final String title;
  final List<ProjectTechStack>? techs;
  final Function(int)? onRemove;
  final Function()? onAdd;
  final bool isSelection;
  final Function(List<ProjectTechStack> list)? onSelected;
  const TechStacksPreview({
    super.key,
    required this.title,
    required this.techs,
    this.onRemove,
    this.onAdd,
    this.onSelected,
    this.isSelection = false,
  });

  @override
  State<TechStacksPreview> createState() => _TechStacksPreviewState();
}

class _TechStacksPreviewState extends State<TechStacksPreview> {
  List<ProjectTechStack> selectedStacks = [];
  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: widget.title,
      onAdd: widget.onAdd,
      child: Column(
        children: [
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 100.h,

              crossAxisCount: context.isDesktop
                  ? widget.onRemove != null
                        ? 3
                        : 4
                  : context.isTablet
                  ? 3
                  : 1,
            ),
            shrinkWrap: true,
            itemCount: widget.techs?.length ?? 0,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  alignment: .topRight,
                  children: [
                    Row(
                      children: [
                        widget.isSelection
                            ? Row(
                                children: [
                                  SizedBox(width: 10.w),
                                  Checkbox(
                                    value: selectedStacks
                                        .where(
                                          (e) =>
                                              e.id == widget.techs?[index].id,
                                        )
                                        .isNotEmpty,
                                    onChanged: (v) {
                                      if (v ?? false) {
                                        selectedStacks.add(
                                          widget.techs![index],
                                        );
                                      } else {
                                        selectedStacks.removeWhere(
                                          (e) =>
                                              e.id == widget.techs?[index].id,
                                        );
                                      }
                                      setState(() {});
                                    },
                                  ),
                                ],
                              )
                            : SizedBox.shrink(),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              width: 0.2,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          child: SvgPicture.network(
                            widget.techs?[index].iconUrl ?? "",
                            width: 35.r,
                            height: 35.r,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Text(
                            widget.techs?[index].name ?? "",
                            style: context.fontStyle.bodyMedium,
                          ),
                        ),
                        widget.onRemove != null
                            ? Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: IconButton(
                                  onPressed: () {
                                    widget.onRemove!(index);
                                  },
                                  icon: Icon(
                                    Icons.close,
                                    color: AppColors.danger,
                                  ),
                                ),
                              )
                            : SizedBox.shrink(),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
          widget.isSelection && widget.onSelected != null
              ? Column(
                  children: [
                    SizedBox(height: 10),
                    InkWell(
                      onTap: () {
                        widget.onSelected!(selectedStacks);
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            width: 0.5,
                            color: AppColors.primaryBlue,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: .min,
                          children: [
                            Text(
                              "Add Selected",
                              style: const TextStyle(
                                color: AppColors.textPrimary,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: 10),
                            Icon(Icons.done, color: AppColors.primaryBlue),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
