import 'package:equatable/equatable.dart';
import 'package:myportfolioapp/features/projects/domain/entity/project_details.dart';
import 'package:myportfolioapp/features/projects/domain/entity/project_item.dart';

class ProjectState extends Equatable {
  final List<ProjectItem>? projects;
  final List<ProjectItem> filtered;
  final ProjectItem? projectItem;
  final ProjectDetails? projectDetails;
  final int currentFilter;
  final bool? isLoading;
  final String? error;
  const ProjectState({
    this.projects,
    required this.filtered,
    this.projectItem,
    this.projectDetails,
    this.isLoading,
    this.error,
    this.currentFilter = -1,
  });

  ProjectState copyWith({
    List<ProjectItem>? projects,
    List<ProjectItem>? filtered,
    ProjectItem? projectItem,
    ProjectDetails? projectDetails,
    int? currentFilter,
    bool? isLoading,
    String? error,
  }) {
    return ProjectState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      filtered: filtered ?? this.filtered,
      projectItem: projectItem ?? this.projectItem,
      projectDetails: projectDetails ?? this.projectDetails,
      currentFilter: currentFilter ?? this.currentFilter,
      projects: projects ?? this.projects,
    );
  }

  @override
  List<Object?> get props => [
    projects,
    filtered,
    projectItem,
    projectDetails,
    currentFilter,
    isLoading,
    error,
  ];
}
