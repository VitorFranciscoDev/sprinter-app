import 'package:sprinter/domain/entities/entity_result.dart';
import 'package:sprinter/domain/entities/entity_user.dart';

import '../errors/authentication_error.dart';

/// Defines the contract for authentication-related business logic
abstract class AuthenticationUseCase {
  /// Attempts to do login in the app with email and password
  Future<Result<void, AuthenticationError>> signInWithEmailAndPassword(
    UserCredentials credentials,
  );

  /// Attempts to do login in the app with google account
  Future<Result<void, AuthenticationError>> signInWithGoogle();

  /// Attempts to do login in the app with apple account
  Future<Result<void, AuthenticationError>> signInWithApple();

  /// Attempts to sign out of the app
  Future<Result<void, AuthenticationError>> signOut();
}
