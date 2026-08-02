import 'package:fpdart/fpdart.dart';
import 'package:myportfolioapp/core/errors/failures.dart';
import 'package:myportfolioapp/features/dashboard/domain/entity/tech_add_entity.dart';
import 'package:myportfolioapp/features/projects/data/datasource/project_datasource.dart';
import 'package:myportfolioapp/features/projects/domain/entity/project_add_item.dart';
import 'package:myportfolioapp/features/projects/domain/entity/project_details.dart';
import 'package:myportfolioapp/features/projects/domain/entity/project_item.dart';
import 'package:myportfolioapp/features/projects/domain/entity/project_tech_stack.dart';
import 'package:myportfolioapp/features/projects/domain/repository/project_repository.dart';

class ProjectRepositoryImpl extends ProjectRepository {
  ProjectRemoteDatasource remote;
  ProjectLocalDatasource local;
  ProjectRepositoryImpl(this.remote, this.local);
  @override
  Future<Either<Failure, bool>> addProject({
    required ProjectAddItem models,
  }) async {
    try {
      return Right(await remote.addProject(model: models));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProjectItem>>> getProject() async {
    try {
      return Right(await remote.getProjects());
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> addTechStacks({
    required List<TechAddEntity> techList,
  }) async {
    try {
      return Right(await remote.addTechStacks(techStacks: techList));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProjectTechStack>>> getTechStacks() async {
    try {
      return Right(await remote.getTechStacks());
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProjectDetails>> getProjectDetails({
    required int projectId,
  }) async {
    try {
      return Right(await remote.getProjectDetails(projectId: projectId));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProjectItem>> getProjectInfo({
    required int projectId,
  }) async {
    try {
      return Right(await remote.getProjectInfo(projectId: projectId));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
