import 'package:equatable/equatable.dart';
import 'package:myportfolioapp/features/blogs/domain/entity/blog_add_item.dart';
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
