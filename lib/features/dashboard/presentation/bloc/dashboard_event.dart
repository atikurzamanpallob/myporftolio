import 'package:equatable/equatable.dart';
import 'package:myportfolioapp/features/blogs/domain/entity/blog_add_item.dart';
import 'package:myportfolioapp/features/dashboard/domain/entity/tech_add_entity.dart';
import 'package:myportfolioapp/features/projects/domain/entity/project_add_item.dart';

class DashboardEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddProjectEvent extends DashboardEvent {
  final ProjectAddItem model;
  AddProjectEvent({required this.model});
}

class AddBlogEvent extends DashboardEvent {
  final BlogAddItem item;
  AddBlogEvent({required this.item});
}

class CategoryFetchEvent extends DashboardEvent {}

class AddTechEvent extends DashboardEvent {
  final List<TechAddEntity> techList;
  AddTechEvent({required this.techList});
}

class FetchTechStacksEvent extends DashboardEvent {}
