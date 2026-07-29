import 'package:fpdart/fpdart.dart';
import 'package:myportfolioapp/core/errors/failures.dart';
import 'package:myportfolioapp/features/dashboard/domain/entity/tech_add_entity.dart';
import 'package:myportfolioapp/features/projects/domain/entity/project_add_item.dart';
import 'package:myportfolioapp/features/projects/domain/entity/project_details.dart';
import 'package:myportfolioapp/features/projects/domain/entity/project_item.dart';
import 'package:myportfolioapp/features/projects/domain/entity/project_tech_stack.dart';

abstract class ProjectRepository {
  Future<Either<Failure, List<ProjectItem>>> getProject();
  Future<Either<Failure, bool>> addProject({required ProjectAddItem models});
  Future<Either<Failure, bool>> addTechStacks({
    required List<TechAddEntity> techList,
  });
  Future<Either<Failure, List<ProjectTechStack>>> getTechStacks();
  Future<Either<Failure, ProjectItem>> getProjectInfo({required int projectId});
  Future<Either<Failure, ProjectDetails>> getProjectDetails({
    required int projectId,
  });
}
