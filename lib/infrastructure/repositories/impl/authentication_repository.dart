import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:sprinter/domain/entities/entity_error.dart';
import 'package:sprinter/domain/entities/entity_result.dart';
import 'package:sprinter/domain/entities/entity_user.dart';

import '../../../domain/errors/authentication_error.dart';
import '../authentication_interface.dart';
import '../webservices/authentication_web_service.dart';

AuthenticationRepository newAuthenticationRepository(
  AuthenticationWS authenticationWS,
  FirebaseAuth firebaseAuth,
  GoogleSignIn googleSignIn,
) {
  return _AuthenticationRepository(
    authenticationWS,
    firebaseAuth,
    googleSignIn,
  );
}

class _AuthenticationRepository implements AuthenticationRepository {
  const _AuthenticationRepository(
    this._authenticationWS,
    this._firebaseAuth,
    this._googleSignIn,
  );

  final AuthenticationWS _authenticationWS;
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  @override
  Future<Result<void, AuthenticationError>> signInWithEmailAndPassword(
    UserCredentials credentials,
  ) async {
    final response = await _authenticationWS.signInWithEmailAndPassword(
      credentials,
    );

    if (response.statusCode != 200) {
      final errorResponse = ErrorResponse.fromJSON(jsonDecode(response.body));

      return switch (errorResponse.code) {
        'INTERNAL_SERVER_ERROR' => Result.failure(.internalServerError),
        'BAD_REQUEST' => Result.failure(.badRequestError),
        'NOT_FOUND' => Result.failure(.notFoundError),
        'INVALID_CREDENTIALS' => Result.failure(.invalidCredentialsError),
        _ => Result.failure(.internalServerError),
      };
    }

    return Result.success(null);
  }

  @override
  Future<Result<void, AuthenticationError>> signInWithGoogle() async {
    try {
      // Triggers the authentication flow
      final googleUser = await _googleSignIn.authenticate();

      // Creates a new credential from idToken
      final credential = GoogleAuthProvider.credential(
        idToken: googleUser.authentication.idToken,
      );

      // Sign in on firebase with the given credential
      await _firebaseAuth.signInWithCredential(credential);
      return Result.success(null);
    } on Exception catch (e) {
      unawaited(Sentry.captureException(e));
      rethrow;
    }
  }

  /// Generates a cryptographically secure random nonce string
  String _generateNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(
      length,
      (_) => charset[random.nextInt(charset.length)],
    ).join();
  }

  /// Returns the SHA-256 hash of a string.
  String _sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  @override
  Future<Result<void, AuthenticationError>> signInWithApple() async {
    // Generate a secure nonce to prevent replay attacks
    final rawNonce = _generateNonce();
    final hashedNonce = _sha256ofString(rawNonce);

    // Trigger the Apple Sign-In flow
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: hashedNonce,
    );

    // Create an OAuthCredential from the Apple credential
    final oauthCredential = OAuthProvider(
      'apple.com',
    ).credential(idToken: appleCredential.identityToken, rawNonce: rawNonce);

    // Sign in to Firebase
    final userCredential = await _firebaseAuth.signInWithCredential(
      oauthCredential,
    );

    // Apple only sends the name on the FIRST sign-in.
    // We must update the Firebase profile manually.
    await userCredential.user?.updateDisplayName(
      '${appleCredential.givenName} ${appleCredential.familyName ?? ''}'.trim(),
    );

    return Result.success(null);
  }

  @override
  Future<Result<void, AuthenticationError>> signOut() async {
    await _firebaseAuth.signOut();
    return Result.success(null);
  }
}
