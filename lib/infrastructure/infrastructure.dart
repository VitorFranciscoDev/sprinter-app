import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sprinter/domain/usecases/authentication_interface.dart';
import 'package:sprinter/domain/usecases/impl/authentication_use_case.dart';
import 'package:sprinter/infrastructure/repositories/impl/authentication_repository.dart';
import 'package:sprinter/infrastructure/repositories/webservices/authentication_web_service.dart';

late final AuthenticationUseCase authenticationUseCase;

void initialize() {
  // Secure storage
  final storage= FlutterSecureStorage();

  // Web services
  final authenticationWS = AuthenticationWS();

  // Repositories
  final authenticationRepository = newAuthenticationRepository(
    authenticationWS,
    storage,
  );

  // Use cases
  authenticationUseCase = newAuthenticationUseCase(authenticationRepository);
}
