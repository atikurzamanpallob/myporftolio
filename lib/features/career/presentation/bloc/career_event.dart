import 'package:equatable/equatable.dart';

class CareerEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CertificateFetchEvent extends CareerEvent {}

class ExperienceFetchEvent extends CareerEvent {}
