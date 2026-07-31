import '../../../../core/app_resources/app_icons.dart';
import '../../domain/entity/soft_skill.dart';

const List<SoftSkill> kSoftSkills = [
  SoftSkill(
    iconAsset: AppIcons.skillCommunication,
    title: 'Communication',
    description: 'Clear & effective communications',
  ),
  SoftSkill(
    iconAsset: AppIcons.skillTeamwork,
    title: 'Teamwork',
    description: 'Collaborative & a great team player',
  ),
  SoftSkill(
    iconAsset: AppIcons.skillTimeManagement,
    title: 'Time Management',
    description: 'Complete task, project before deadline',
  ),
  SoftSkill(
    iconAsset: AppIcons.skillAdapt,
    title: 'Adaptability',
    description: 'Quick to learn and adapt to new challenges',
  ),
  SoftSkill(
    iconAsset: AppIcons.skillProblem,
    title: 'Problem Solving',
    description: 'Analytical thinking and finding the right solution',
  ),
];
