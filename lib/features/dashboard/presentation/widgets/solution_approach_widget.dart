import 'package:flutter/material.dart';
import 'package:myportfolioapp/core/common/custom_form_filed.dart';
import 'package:myportfolioapp/core/themes/app_colors.dart';
import 'package:myportfolioapp/features/dashboard/presentation/widgets/section_widget.dart';

class SolutionApproachWidget extends StatelessWidget {
  final List<TextEditingController> solution;
  final Function onAdd;
  final Function(int) onRemove;
  const SolutionApproachWidget({
    super.key,
    required this.solution,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: "Solution & Approach",
      onAdd: () {
        onAdd();
      },
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: solution.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 0.5,
                      color: AppColors.primaryBlue,
                    ),
                  ),
                  child: CustomFormFiled(
                    hints: "Solution-${index + 1}",
                    controller: solution[index],
                  ),
                ),

                Positioned(
                  top: 4,
                  right: 4,
                  child: GestureDetector(
                    onTap: () {
                      onRemove(index);
                    },
                    child: Container(
                      width: 18,
                      height: 18,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: Colors.black87,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.close,
                        size: 12,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
