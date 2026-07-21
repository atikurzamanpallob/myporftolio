import 'package:fpdart/fpdart.dart';
import 'package:myportfolioapp/core/errors/failures.dart';
import 'package:myportfolioapp/features/dashboard/domain/entity/category_list.dart';
import 'package:myportfolioapp/features/dashboard/domain/repository/category_respository.dart';
import 'package:myportfolioapp/features/projects/domain/entity/project_add_item.dart';
import 'package:myportfolioapp/features/projects/domain/usecase/project_data.dart';

class DashboardData {
  ProjectData projectData;
  CategoryRespository repository;
  DashboardData({required this.projectData, required this.repository});

  Future<Either<Failure, bool>> addProject(ProjectAddItem model) async {
    return projectData.repository.addProject(models: model);
  }

  Future<Either<Failure, List<Category>>> getCategoryList() async {
    return repository.getCategoryList();
  }
}
