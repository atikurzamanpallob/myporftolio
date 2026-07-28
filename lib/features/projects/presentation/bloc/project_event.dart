import 'package:equatable/equatable.dart';

class ProjectEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchProjects extends ProjectEvent {}

class ProjectFilterEvent extends ProjectEvent {
  final int currentOption;
  ProjectFilterEvent({this.currentOption = -1});
}

class FetchProjectDetails extends ProjectEvent {
  final int projectId;
  FetchProjectDetails({required this.projectId});
}

class FetchProjectInfo extends ProjectEvent {
  final int projectId;
  FetchProjectInfo({required this.projectId});
}
