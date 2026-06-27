import '../../../domain/entities/entity_result.dart';
import '../../../domain/entities/entity_user.dart';
import '../../domain/entities/errors/authentication_error.dart';

/// Defines the contract for authentication data operations
abstract class AuthenticationRepository {
  /// Attempts to do login in the app with email and password
  Future<Result<void, AuthenticationError>> attemptLogin(
    UserCredentials credentials,
  );

  /// Attempts to register the user with the given credentials
  Future<Result<void, AuthenticationError>> attemptRegister(
    UserCredentials credentials,
  );
}
