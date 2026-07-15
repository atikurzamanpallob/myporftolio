import 'package:equatable/equatable.dart';

class ContactEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ContactInfoEvent extends ContactEvent {}

class ContactEmailSendEvent extends ContactEvent {
  final String name;
  final String email;
  final String subject;
  final String message;
  ContactEmailSendEvent({
    required this.name,
    required this.email,
    required this.message,
    required this.subject,
  });
}
