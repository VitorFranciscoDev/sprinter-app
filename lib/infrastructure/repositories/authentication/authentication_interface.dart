import '../../../domain/entities/entity_result.dart';
import '../../../domain/entities/entity_user.dart';
import '../../../domain/entities/errors/authentication_error.dart';

abstract class AuthenticationRepository {
  /// Attempts to do login in the app
  Future<Result<void, AuthenticationError>> attemptLogin(
    UserCredentials credentials,
  );
}
