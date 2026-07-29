import 'package:fpdart/fpdart.dart';
import 'package:myportfolioapp/core/errors/failures.dart';
import 'package:myportfolioapp/features/dashboard/domain/entity/category_list.dart';
import 'package:myportfolioapp/features/dashboard/domain/repository/category_respository.dart';
import 'package:myportfolioapp/features/projects/domain/entity/project_add_item.dart';
import 'package:myportfolioapp/features/projects/domain/usecase/project_data.dart';

import '../../../projects/domain/entity/project_tech_stack.dart';
import '../entity/tech_add_entity.dart';

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

  Future<Either<Failure, List<ProjectTechStack>>> getTechStacks() async {
    return projectData.getTechStacks();
  }

  Future<Either<Failure, bool>> addtechStacks({
    required List<TechAddEntity> list,
  }) async {
    return projectData.addtechStacks(list: list);
  }
}
