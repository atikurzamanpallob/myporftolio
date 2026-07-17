import 'package:fpdart/fpdart.dart';
import 'package:myportfolioapp/features/projects/data/models/project_item_models.dart';
import 'package:myportfolioapp/features/projects/domain/entity/project_item.dart';
import 'package:myportfolioapp/features/projects/domain/repository/project_repository.dart';

import '../../../../core/errors/failures.dart';

class ProjectData {
  ProjectRepository repository;
  ProjectData(this.repository);

  Future<Either<Failure, List<ProjectItem>>> getProjects() async {
    return repository.getProject();
  }

  Future<Either<Failure, bool>> addProject({
    required ProjectItemModels models,
  }) async {
    return repository.addProject(models: models);
  }
}
