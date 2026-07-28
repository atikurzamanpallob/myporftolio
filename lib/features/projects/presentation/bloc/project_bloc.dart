import 'dart:async';

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
    on<FetchProjectDetails>(fetchProjectDetails);
    on<FetchProjectInfo>(fetchProjectInfo);
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

  Future<void> fetchProjectDetails(
    FetchProjectDetails event,
    Emitter<ProjectState> emit,
  ) async {
    final result = await projectData.getProjectDetails(
      projectId: event.projectId,
    );
    result.fold(
      (failure) {
        emit(state.copyWith(error: failure.message));
      },
      (projectDetails) {
        emit(state.copyWith(projectDetails: projectDetails));
      },
    );
  }

  Future<void> fetchProjectInfo(
    FetchProjectInfo event,
    Emitter<ProjectState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final result = await projectData.getProjectInfo(projectId: event.projectId);
    result.fold(
      (failure) {
        emit(state.copyWith(isLoading: false, error: failure.message));
      },
      (project) {
        emit(state.copyWith(isLoading: false, projectItem: project));
      },
    );
  }
}
