import 'package:sprinter/domain/entities/entity_result.dart';
import 'package:sprinter/domain/entities/entity_user.dart';
import 'package:sprinter/domain/entities/errors/authentication_error.dart';

abstract class AuthenticationUseCase {
  /// Attempts to do login in the app
  Future<Result<void, AuthenticationError>> attemptLogin(UserCredentials credentials);
}