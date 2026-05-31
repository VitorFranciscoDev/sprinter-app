import 'package:sprinter/domain/entities/entity_result.dart';
import 'package:sprinter/domain/entities/entity_user.dart';

import '../entities/errors/authentication_error.dart';


/// Defines the contract for authentication-related business logic
abstract class AuthenticationUseCase {
  /// Attempts to do login in the app with email and password
  Future<Result<void, AuthenticationError>> attemptLogin(
    UserCredentials credentials,
  );

  /// Attempts to register the user in the app with the given credentials
  Future<Result<void, AuthenticationError>> attemptRegister(
    UserCredentials credentials,
  );

  /// Attempts to complete the register of the user with the given information
  Future<Result<void, AuthenticationError>> completeRegister(
    UserInformation information,
  );
}
