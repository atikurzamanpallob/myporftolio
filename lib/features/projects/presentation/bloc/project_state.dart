import 'package:equatable/equatable.dart';
import 'package:myportfolioapp/features/projects/domain/entity/project_item.dart';

class ProjectState extends Equatable {
  final List<ProjectItem>? projects;
  final List<ProjectItem> filtered;
  final int currentFilter;
  final bool? isLoading;
  final String? error;
  const ProjectState({
    this.projects,
    required this.filtered,
    this.isLoading,
    this.error,
    this.currentFilter = -1,
  });

  ProjectState copyWith({
    List<ProjectItem>? projects,
    List<ProjectItem>? filtered,
    int? currentFilter,
    bool? isLoading,
    String? error,
  }) {
    return ProjectState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      filtered: filtered ?? this.filtered,
      currentFilter: currentFilter ?? this.currentFilter,
      projects: projects ?? this.projects,
    );
  }

  @override
  List<Object?> get props => [
    projects,
    filtered,
    currentFilter,
    isLoading,
    error,
  ];
}
