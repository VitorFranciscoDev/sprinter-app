import 'package:sprinter/domain/entities/entity_result.dart';
import 'package:sprinter/domain/entities/entity_user.dart';
import 'package:sprinter/domain/errors/authentication_error.dart';
import 'package:sprinter/domain/rules/authentication_rules.dart';
import 'package:sprinter/domain/usecases/authentication.dart';

import '../../../infrastructure/repositories/authentication.dart';

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
    final credentialsValid=AuthenticationRules.validateLogin(credentials);
    if(credentialsValid is Failure){
      return credentialsValid;
    }

    return await _authenticationRepository.attemptLogin(credentials);
  }
  
  @override
  Future<Result<void, AuthenticationError>> attemptRegister(
    UserCredentials credentials,
    ) async {
    final credentialsValid=AuthenticationRules.validateRegister(credentials);
    if(credentialsValid is Failure){
      return credentialsValid;
    }

    return await _authenticationRepository.attemptRegister(credentials);

  }
}
