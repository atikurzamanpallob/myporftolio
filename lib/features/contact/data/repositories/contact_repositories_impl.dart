import 'package:fpdart/fpdart.dart';
import 'package:myportfolioapp/core/errors/failures.dart';
import 'package:myportfolioapp/features/contact/data/datasource/contact_datasource.dart';
import 'package:myportfolioapp/features/contact/domain/repositories/contact_repository.dart';

class ContactRepositoryImpl implements ContactRepository {
  ContactDataSource contactDataSource;
  ContactRepositoryImpl(this.contactDataSource);

  @override
  Future<Either<Failure, bool>> sendEmail({
    required String name,
    required String subject,
    required String email,
    required String message,
  }) async {
    try {
      return Right(
        await contactDataSource.sendEmail(
          name: name,
          email: email,
          subject: subject,
          message: message,
        ),
      );
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
