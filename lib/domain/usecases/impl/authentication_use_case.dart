import 'package:sprinter/domain/entities/entity_result.dart';
import 'package:sprinter/domain/entities/entity_user.dart';
import 'package:sprinter/domain/usecases/authentication.dart';

import '../../../infrastructure/repositories/authentication.dart';
import '../../entities/errors/authentication_error.dart';
import '../rules/authentication_rules.dart';

AuthenticationUseCase newAuthenticationUseCase(
  AuthenticationRepository authenticationRepository,
) {
  return _AuthenticationUseCase(authenticationRepository);
}

class _AuthenticationUseCase implements AuthenticationUseCase {
  const _AuthenticationUseCase(this._authenticationRepository);

  final AuthenticationRepository _authenticationRepository;

  @override
  Future<Result<void, AuthenticationError>> attemptLogin(
    UserCredentials credentials,
  ) async {
    final validCredentials = AuthenticationRules.validateLogin(credentials);
    if (validCredentials is Failure) {
      return validCredentials;
    }

    return await _authenticationRepository.attemptLogin(credentials);
  }

  @override
  Future<Result<void, AuthenticationError>> attemptRegister(
    UserCredentials credentials,
  ) async {
    final validCredentials = AuthenticationRules.validateRegister(credentials);
    if (validCredentials is Failure) {
      return validCredentials;
    }

    return await _authenticationRepository.attemptRegister(credentials);
  }

  @override
  Future<Result<void, AuthenticationError>> completeRegister(
    UserInformation information,
  ) async {
    final validInformation = AuthenticationRules.validateCompleteRegister(
      information,
    );
    if (validInformation is Failure) {
      return validInformation;
    }

    return await _authenticationRepository.attemptCompleteRegister(information);
  }
}
