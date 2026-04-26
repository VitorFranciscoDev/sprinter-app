import 'package:sprinter/domain/entities/entity_result.dart';
import 'package:sprinter/domain/entities/entity_user.dart';
import 'package:sprinter/domain/entities/errors/authentication_error.dart';
import 'package:sprinter/domain/usecases/authentication/authentication_interface.dart';

AuthenticationUseCase newAuthenticationUseCase() {
  return _AuthenticationUseCase();
}

class _AuthenticationUseCase implements AuthenticationUseCase {
  @override
  Future<Result<void, AuthenticationError>> attemptLogin(UserCredentials credentials) {
    throw UnimplementedError();
  }
}
