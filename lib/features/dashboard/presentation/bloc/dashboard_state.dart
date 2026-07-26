import 'package:equatable/equatable.dart';
import 'package:myportfolioapp/features/dashboard/domain/entity/category_list.dart';
import 'package:myportfolioapp/features/projects/domain/entity/project_tech_stack.dart';

class DashboardState extends Equatable {
  final bool? isLoading;
  final bool? isCategoryLoading;
  final List<Category>? category;
  final List<ProjectTechStack>? techStacks;
  final String? error;
  const DashboardState({
    this.isLoading,
    this.isCategoryLoading,
    this.error,
    this.category,
    this.techStacks,
  });

  DashboardState copyWith({
    bool? isLoading,
    bool? isCategoryLoading,
    String? error,
    List<Category>? category,
    List<ProjectTechStack>? techStacks,
  }) {
    return DashboardState(
      isLoading: isLoading ?? this.isLoading,
      isCategoryLoading: isCategoryLoading ?? this.isCategoryLoading,
      error: error ?? this.error,
      category: category ?? this.category,
      techStacks: techStacks ?? this.techStacks,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    isCategoryLoading,
    error,
    category,
    techStacks,
  ];
}
