import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sprinter/domain/usecases/authentication_interface.dart';
import 'package:sprinter/domain/usecases/impl/authentication_use_case.dart';
import 'package:sprinter/infrastructure/repositories/impl/authentication_repository.dart';
import 'package:sprinter/infrastructure/repositories/webservices/authentication_web_service.dart';

late final AuthenticationUseCase authenticationUseCase;

void initialize() {
  // Instances for login with external platforms
  final firebaseAuth = FirebaseAuth.instance;
  final googleSignIn = GoogleSignIn.instance;

  // Web services
  final authenticationWS = AuthenticationWS();

  // Secure storage
  final secureStorage= FlutterSecureStorage();
  // Repositories
  final authenticationRepository = newAuthenticationRepository(
    authenticationWS,
    firebaseAuth,
    googleSignIn,
    secureStorage,
  );

  // Use cases
  authenticationUseCase = newAuthenticationUseCase(authenticationRepository);
}
