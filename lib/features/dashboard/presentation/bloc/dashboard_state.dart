import 'package:equatable/equatable.dart';
import 'package:myportfolioapp/features/dashboard/domain/entity/category_list.dart';

class DashboardState extends Equatable {
  final bool? isLoading;
  final bool? isCategoryLoading;
  final List<Category>? category;
  final String? error;
  const DashboardState({
    this.isLoading,
    this.isCategoryLoading,
    this.error,
    this.category,
  });

  DashboardState copyWith({
    bool? isLoading,
    bool? isCategoryLoading,
    String? error,
    List<Category>? category,
  }) {
    return DashboardState(
      isLoading: isLoading ?? this.isLoading,
      isCategoryLoading: isCategoryLoading ?? this.isCategoryLoading,
      error: error ?? this.error,
      category: category ?? this.category,
    );
  }

  @override
  List<Object?> get props => [isLoading, isCategoryLoading, error, category];
}
