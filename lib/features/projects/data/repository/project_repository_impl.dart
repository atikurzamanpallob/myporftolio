import 'package:fpdart/fpdart.dart';
import 'package:myportfolioapp/core/errors/failures.dart';
import 'package:myportfolioapp/features/projects/data/datasource/project_datasource.dart';
import 'package:myportfolioapp/features/projects/domain/entity/project_add_item.dart';
import 'package:myportfolioapp/features/projects/domain/entity/project_item.dart';
import 'package:myportfolioapp/features/projects/domain/repository/project_repository.dart';

class ProjectRepositoryImpl extends ProjectRepository {
  ProjectDatasource datasource;
  ProjectRepositoryImpl(this.datasource);
  @override
  Future<Either<Failure, bool>> addProject({
    required ProjectAddItem models,
  }) async {
    try {
      return Right(await datasource.addProject(model: models));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProjectItem>>> getProject() async {
    try {
      return Right(await datasource.getProjects());
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
