import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myportfolioapp/core/common/custom_form_filed.dart';
import 'package:myportfolioapp/core/themes/app_colors.dart';
import 'package:myportfolioapp/features/dashboard/domain/entity/key_feature_entity.dart';
import 'package:myportfolioapp/features/dashboard/presentation/widgets/section_widget.dart';

class KeyFeatureWidget extends StatelessWidget {
  final List<KeyFeatureEntity> keyFeatures;
  final Function onAdd;
  final Function(int) onRemove;
  const KeyFeatureWidget({
    super.key,
    required this.keyFeatures,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: "Key Features",
      onAdd: () {
        onAdd();
      },
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: keyFeatures.length,
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
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: CustomFormFiled(
                          hints: "feature title-${index + 1}",
                          controller: keyFeatures[index].title,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        flex: 5,
                        child: CustomFormFiled(
                          hints: "feature description-${index + 1}",
                          controller: keyFeatures[index].value,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 4,
                  right: 4,
                  child: GestureDetector(
                    onTap: () => onRemove(index),
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
