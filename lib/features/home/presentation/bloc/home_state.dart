import 'package:equatable/equatable.dart';
import 'package:myportfolioapp/features/home/domain/entity/contact_info.dart';
import 'package:myportfolioapp/features/home/domain/entity/home_info.dart';

abstract class HomeState extends Equatable {}

class InfoLoading extends HomeState {
  @override
  List<Object?> get props => [];
}

class InfoLoaded extends HomeState {
  final HomeInfo? homeInfo;
  InfoLoaded(this.homeInfo);
  @override
  List<Object?> get props => [homeInfo];
  InfoLoaded copyWith({
    required List<ContactInfo> contacts,
    HomeInfo? homeInfo,
  }) {
    return InfoLoaded(homeInfo ?? this.homeInfo);
  }
}

class ContactLoading extends HomeState {
  @override
  List<Object?> get props => [];
}

class ContactLoaded extends HomeState {
  final List<ContactInfo>? contacts;
  ContactLoaded(this.contacts);
  @override
  List<Object?> get props => [contacts];
  ContactLoaded copyWith({required List<ContactInfo> contacts}) {
    return ContactLoaded(contacts);
  }
}

class Failed extends HomeState {
  final String? message;
  Failed(this.message);
  @override
  List<Object?> get props => [message];
}
