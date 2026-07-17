import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myportfolioapp/features/dashboard/domain/usecase/dashboard_data.dart';
import 'package:myportfolioapp/features/dashboard/presentation/bloc/dashboard_event.dart';
import 'package:myportfolioapp/features/dashboard/presentation/bloc/dashboard_state.dart';

class DashBoardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardData dashboardData;
  DashBoardBloc(this.dashboardData) : super(DashboardState()) {
    on<AddProjectEvent>(addProject);
  }

  Future<void> addProject(
    AddProjectEvent event,
    Emitter<DashboardState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    final result = await dashboardData.addProject(event.model);
    result.fold(
      (failure) {
        emit(state.copyWith(isLoading: false, error: failure.message));
      },
      (status) {
        emit(state.copyWith(isLoading: false));
      },
    );
    emit(state.copyWith(isLoading: false));
  }
}
