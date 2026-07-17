import 'package:fpdart/fpdart.dart';
import 'package:myportfolioapp/core/errors/failures.dart';
import 'package:myportfolioapp/features/projects/data/models/project_item_models.dart';
import 'package:myportfolioapp/features/projects/domain/entity/project_item.dart';

abstract class ProjectRepository {
  Future<Either<Failure, List<ProjectItem>>> getProject();
  Future<Either<Failure, bool>> addProject({required ProjectItemModels models});
}
