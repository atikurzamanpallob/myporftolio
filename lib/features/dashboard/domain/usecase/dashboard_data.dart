import 'package:fpdart/fpdart.dart';
import 'package:myportfolioapp/core/errors/failures.dart';
import 'package:myportfolioapp/features/projects/domain/entity/project_add_item.dart';
import 'package:myportfolioapp/features/projects/domain/usecase/project_data.dart';

class DashboardData {
  ProjectData projectData;
  DashboardData({required this.projectData});

  Future<Either<Failure, bool>> addProject(ProjectAddItem model) async {
    return projectData.repository.addProject(models: model);
  }
}
