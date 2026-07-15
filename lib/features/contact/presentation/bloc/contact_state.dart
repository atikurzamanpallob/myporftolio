import 'package:equatable/equatable.dart';

import '../../../home/domain/entity/contact_info.dart';

class ContactState extends Equatable {
  final List<ContactInfo>? contacts;
  final bool? status;
  final String? error;
  final bool? isLoadingContacts;
  final bool? isEmailSending;
  final bool? isEmailSent;

  const ContactState({
    this.contacts,
    this.error,
    this.status,
    this.isLoadingContacts,
    this.isEmailSending,
    this.isEmailSent,
  });
  ContactState copyWith({
    List<ContactInfo>? contacts,
    String? error,
    bool? status,
    bool? isLoadingContacts,
    bool? isEmailSending,
    bool? isEmailSent,
  }) {
    return ContactState(
      contacts: contacts ?? this.contacts,
      error: error,
      status: status ?? this.status,
      isLoadingContacts: isLoadingContacts ?? this.isLoadingContacts,
      isEmailSending: isEmailSending ?? this.isEmailSending,
      isEmailSent: isEmailSent ?? this.isEmailSent,
    );
  }

  @override
  List<Object?> get props => [
    contacts,
    error,
    status,
    isEmailSending,
    isEmailSent,
  ];
}
