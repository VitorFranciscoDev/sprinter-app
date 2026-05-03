import 'package:sprinter/domain/entities/entity_result.dart';
import 'package:sprinter/domain/entities/entity_user.dart';
import 'package:sprinter/domain/errors/authentication_error.dart';
import 'package:sprinter/domain/rules/authentication_rules.dart';
import 'package:sprinter/domain/usecases/authentication_interface.dart';

import '../../../infrastructure/repositories/authentication_interface.dart';

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
    final emailValid = AuthenticationRules.validateEmail(credentials.email);
    if (emailValid is Failure) {
      return emailValid;
    }

    final passwordValid = AuthenticationRules.validateEmail(credentials.email);
    if (passwordValid is Failure) {
      return passwordValid;
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
