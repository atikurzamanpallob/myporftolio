import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myportfolioapp/features/projects/domain/entity/project_item.dart';
import 'package:myportfolioapp/features/projects/domain/usecase/project_data.dart';
import 'package:myportfolioapp/features/projects/presentation/bloc/project_event.dart';
import 'package:myportfolioapp/features/projects/presentation/bloc/project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  ProjectData projectData;
  ProjectBloc(this.projectData) : super(ProjectState(filtered: [])) {
    on<FetchProjects>(fetchProjects);
    on<ProjectFilterEvent>(filterProject);
    add(FetchProjects());
  }

  Future fetchProjects(FetchProjects event, Emitter<ProjectState> emit) async {
    emit(state.copyWith(isLoading: true));
    final result = await projectData.getProjects();
    result.fold(
      (failure) {
        emit(state.copyWith(isLoading: false, error: failure.message));
      },
      (projects) {
        emit(
          state.copyWith(
            isLoading: false,
            projects: projects,
            filtered: projects,
          ),
        );
      },
    );
  }

  Future filterProject(
    ProjectFilterEvent event,
    Emitter<ProjectState> emit,
  ) async {
    List<ProjectItem> filteredProjects = [];
    if (event.currentOption == -1) {
      emit(
        state.copyWith(
          filtered: state.projects,
          currentFilter: event.currentOption,
        ),
      );
    } else {
      filteredProjects =
          state.projects
              ?.where((project) => project.type == event.currentOption)
              .toList() ??
          [];
      emit(
        state.copyWith(
          filtered: filteredProjects,
          currentFilter: event.currentOption,
        ),
      );
    }
  }
}
