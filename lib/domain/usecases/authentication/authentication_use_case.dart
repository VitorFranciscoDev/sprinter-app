import 'package:email_validator/email_validator.dart';
import 'package:sprinter/domain/entities/entity_result.dart';
import 'package:sprinter/domain/entities/entity_user.dart';
import 'package:sprinter/domain/entities/errors/authentication_error.dart';
import 'package:sprinter/domain/usecases/authentication/authentication_interface.dart';
import 'package:sprinter/infrastructure/repositories/authentication/authentication_interface.dart';

AuthenticationUseCase newAuthenticationUseCase(
  AuthenticationRepository authenticationRepository,
) {
  return _AuthenticationUseCase(authenticationRepository);
}

class _AuthenticationUseCase implements AuthenticationUseCase {
  const _AuthenticationUseCase(this._authenticationRepository);

  final AuthenticationRepository _authenticationRepository;

  @override
  Future<Result<void, AuthenticationError>> signInWithEmailAndPassword(
    UserCredentials credentials,
  ) async {
    if (!EmailValidator.validate(credentials.email)) {
      return Result.failure(InvalidEmailError('invalid email'));
    }

    if (credentials.password.length < 8) {
      return Result.failure(InvalidPasswordError('invalid password'));
    }

    return await _authenticationRepository.signInWithEmailAndPassword(
      credentials,
    );
  }

  @override
  Future<Result<void, AuthenticationError>> signInWithGoogle() async {
    return await _authenticationRepository.signInWithGoogle();
  }

  @override
  Future<Result<void, AuthenticationError>> signInWithApple() async {
    return await _authenticationRepository.signInWithApple();
  }

  @override
  Future<Result<void, AuthenticationError>> signOut() async {
    return await _authenticationRepository.signOut();
  }
}
