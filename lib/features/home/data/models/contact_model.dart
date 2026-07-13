import 'package:myportfolioapp/features/home/domain/entity/contact_info.dart';

class ContactModel extends ContactInfo {
  ContactModel({
    required super.id,
    required super.contactType,
    required super.contactValue,
  });

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
      id: json['id'],
      contactType: json['contact_type'],
      contactValue: json['contact_value'],
    );
  }
  ContactModel toEntity() => ContactModel(
    id: id,
    contactType: contactType,
    contactValue: contactValue,
  );
}
