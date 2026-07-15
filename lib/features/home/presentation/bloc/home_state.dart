import 'package:equatable/equatable.dart';

import '../../domain/entity/contact_info.dart';
import '../../domain/entity/home_info.dart';

class HomeState extends Equatable {
  final bool isLoadingInfo;
  final bool isLoadingContacts;

  final HomeInfo? homeInfo;
  final List<ContactInfo>? contacts;

  final String? error;

  const HomeState({
    this.isLoadingInfo = false,
    this.isLoadingContacts = false,
    this.homeInfo,
    this.contacts,
    this.error,
  });

  HomeState copyWith({
    bool? isLoadingInfo,
    bool? isLoadingContacts,
    HomeInfo? homeInfo,
    List<ContactInfo>? contacts,
    String? error,
  }) {
    return HomeState(
      isLoadingInfo: isLoadingInfo ?? this.isLoadingInfo,
      isLoadingContacts: isLoadingContacts ?? this.isLoadingContacts,
      homeInfo: homeInfo ?? this.homeInfo,
      contacts: contacts ?? this.contacts,
      error: error,
    );
  }

  @override
  List<Object?> get props => [
    isLoadingInfo,
    isLoadingContacts,
    homeInfo,
    contacts,
    error,
  ];
}
