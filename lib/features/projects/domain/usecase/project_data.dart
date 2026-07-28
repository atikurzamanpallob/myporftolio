import 'package:fpdart/fpdart.dart';
import 'package:myportfolioapp/features/dashboard/domain/entity/tech_add_entity.dart';
import 'package:myportfolioapp/features/projects/domain/entity/project_details.dart';
import 'package:myportfolioapp/features/projects/domain/entity/project_item.dart';
import 'package:myportfolioapp/features/projects/domain/entity/project_tech_stack.dart';
import 'package:myportfolioapp/features/projects/domain/repository/project_repository.dart';

import '../../../../core/errors/failures.dart';

class ProjectData {
  ProjectRepository repository;
  ProjectData(this.repository);

  Future<Either<Failure, List<ProjectItem>>> getProjects() async {
    return repository.getProject();
  }

  Future<Either<Failure, List<ProjectTechStack>>> getTechStacks() async {
    return repository.getTechStacks();
  }

  Future<Either<Failure, bool>> addtechStacks({
    required List<TechAddEntity> list,
  }) async {
    return repository.addTechStacks(techList: list);
  }

  Future<Either<Failure, ProjectItem>> getProjectInfo({
    required int projectId,
  }) async {
    return repository.getProjectInfo(projectId: projectId);
  }

  Future<Either<Failure, ProjectDetails>> getProjectDetails({
    required int projectId,
  }) async {
    return repository.getProjectDetails(projectId: projectId);
  }
}
