import 'package:myportfolioapp/features/skills/domain/entity/skill_item.dart';

class SkillCategory {
  SkillCategory({
    required this.iconAsset,
    required this.title,
    required this.items,
  });

  final String iconAsset;
  final String title;
  final List<SkillItem> items;
}
