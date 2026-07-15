import 'package:fpdart/fpdart.dart';
import 'package:myportfolioapp/features/contact/domain/repositories/contact_repository.dart';
import 'package:myportfolioapp/features/home/domain/repository/home_repository.dart';

import '../../../../core/errors/failures.dart';
import '../../../home/domain/entity/contact_info.dart';

class ContactData {
  ContactRepository contactRepository;
  HomeRepository homeRepository;
  ContactData(this.contactRepository, this.homeRepository);

  Future<Either<Failure, List<ContactInfo>?>> getContactInfo() async {
    return await homeRepository.getContactInfo();
  }

  Future<Either<Failure, bool>> sendEmail({
    required String name,
    required String subject,
    required String email,
    required String message,
  }) async {
    return await contactRepository.sendEmail(
      name: name,
      subject: subject,
      email: email,
      message: message,
    );
  }
}
