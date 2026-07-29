import '../../../../core/app_resources/app_icons.dart';
import '../../domain/entity/skill_category.dart';
import '../../domain/entity/skill_item.dart';

List<SkillCategory> kTechnicalSkills = [
  SkillCategory(
    iconAsset: AppIcons.skillLanguage,
    title: 'Languages',
    items: [
      SkillItem(name: 'Dart', level: 95),
      SkillItem(name: 'Java', level: 80),
      SkillItem(name: 'Kotlin', level: 80),
      SkillItem(name: 'C++', level: 70),
      SkillItem(name: 'Javascript', level: 75),
    ],
  ),
  SkillCategory(
    iconAsset: AppIcons.skillFramework,
    title: 'Frameworks',
    items: [
      SkillItem(name: 'Flutter', level: 90),
      SkillItem(name: 'Node', level: 79),
      SkillItem(name: 'Express', level: 78),
    ],
  ),
  SkillCategory(
    iconAsset: AppIcons.skillBackend,
    title: 'Backend',
    items: [
      SkillItem(name: 'Firebase', level: 85),
      SkillItem(name: 'REST API\'s', level: 95),
      SkillItem(name: 'Supabase', level: 80),
      SkillItem(name: 'Micro Service', level: 95),
    ],
  ),
  SkillCategory(
    iconAsset: AppIcons.skillDatabase,
    title: 'Database',
    items: [
      SkillItem(name: 'Firestore', level: 76),
      SkillItem(name: 'Hive', level: 88),
      SkillItem(name: 'Drift', level: 87),
      SkillItem(name: 'Mongo Db', level: 84),
      SkillItem(name: 'MySQL', level: 78),
    ],
  ),
  SkillCategory(
    iconAsset: AppIcons.skillState,
    title: 'State',
    items: [
      SkillItem(name: 'BloC', level: 94),
      SkillItem(name: 'Provider', level: 95),
      SkillItem(name: 'GetX', level: 89),
      SkillItem(name: 'RxDart', level: 78),
      SkillItem(name: 'Riverpod', level: 55),
    ],
  ),
  SkillCategory(
    iconAsset: AppIcons.skillTools,
    title: 'Tools',
    items: [
      SkillItem(name: 'Vs Code', level: 89),
      SkillItem(name: 'Android Studio', level: 87),
      SkillItem(name: 'XCode', level: 75),
      SkillItem(name: 'Figma', level: 65),
      SkillItem(name: 'Postman', level: 88),
    ],
  ),
  SkillCategory(
    iconAsset: AppIcons.skillTools,
    title: 'Technologies',
    items: [
      SkillItem(name: 'Git', level: 70),
      SkillItem(name: 'Code Magic', level: 75),
      SkillItem(name: 'Playstore', level: 80),
      SkillItem(name: 'Appstore', level: 70),
      SkillItem(name: 'Claude', level: 85),
      SkillItem(name: 'ChatGpt', level: 85),
    ],
  ),

  SkillCategory(
    iconAsset: AppIcons.skillOther,
    title: 'Other',
    items: [
      SkillItem(name: 'Clean Architecture', level: 74),
      SkillItem(name: 'MVVM', level: 85),
      SkillItem(name: 'Unit Test', level: 77),
      SkillItem(name: 'Widget Test', level: 70),
      SkillItem(name: 'Problem Solving', level: 80),
    ],
  ),
];
