import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myportfolioapp/features/dashboard/presentation/bloc/dashboard_event.dart';
import 'package:myportfolioapp/features/dashboard/presentation/bloc/dashboard_state.dart';
import 'package:myportfolioapp/features/projects/domain/usecase/project_data.dart';

class DashBoardBloc extends Bloc<DashboardEvent, DashboardState> {
  ProjectData projectData;
  DashBoardBloc(this.projectData) : super(DashboardState());
}
