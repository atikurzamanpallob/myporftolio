import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myportfolioapp/features/contact/domain/usecase/contact_data.dart';
import 'package:myportfolioapp/features/contact/presentation/bloc/contact_event.dart';
import 'package:myportfolioapp/features/contact/presentation/bloc/contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final ContactData contactData;
  ContactBloc(this.contactData) : super(ContactState()) {
    on<ContactInfoEvent>(getContactList);
    on<ContactEmailSendEvent>(sendEmail);
    add(ContactInfoEvent());
  }

  Future getContactList(
    ContactInfoEvent event,
    Emitter<ContactState> emit,
  ) async {
    emit(state.copyWith(isLoadingContacts: true));

    final result = await contactData.getContactInfo();

    result.fold(
      (failure) {
        emit(state.copyWith(isLoadingContacts: false, error: failure.message));
      },
      (contacts) {
        emit(state.copyWith(isLoadingContacts: false, contacts: contacts));
      },
    );
  }

  Future sendEmail(
    ContactEmailSendEvent event,
    Emitter<ContactState> emit,
  ) async {
    emit(state.copyWith(isEmailSending: true));
    final result = await contactData.sendEmail(
      name: event.name,
      subject: event.subject,
      email: event.email,
      message: event.message,
    );

    result.fold(
      (failure) {
        emit(state.copyWith(isEmailSending: false, error: failure.message));
      },
      (status) {
        emit(state.copyWith(isEmailSending: false, isEmailSent: status));
      },
    );
  }
}
