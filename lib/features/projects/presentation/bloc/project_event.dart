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
