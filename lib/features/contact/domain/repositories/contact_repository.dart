import 'package:fpdart/fpdart.dart';
import 'package:myportfolioapp/core/errors/failures.dart';

abstract class ContactRepository {
  Future<Either<Failure, bool>> sendEmail({
    required String name,
    required String subject,
    required String email,
    required String message,
  });
}
