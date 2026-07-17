import 'package:equatable/equatable.dart';

class DashboardState extends Equatable {
  final bool? isLoading;
  final String? error;
  const DashboardState({this.isLoading, this.error});

  DashboardState copyWith({bool? isLoading, String? error}) {
    return DashboardState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [isLoading, error];
}
