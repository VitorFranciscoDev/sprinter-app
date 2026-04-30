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
  Future<Result<void, AuthenticationError>> attemptLogin(
    UserCredentials credentials,
  ) async {
    return await _authenticationRepository.attemptLogin(credentials);
  }
}
