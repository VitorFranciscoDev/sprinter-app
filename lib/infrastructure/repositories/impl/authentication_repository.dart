import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:sprinter/domain/entities/entity_error.dart';
import 'package:sprinter/domain/entities/entity_result.dart';
import 'package:sprinter/domain/entities/entity_user.dart';
import 'package:sprinter/infrastructure/storage/storage_keys_interface.dart';

import '../../../domain/errors/authentication_error.dart';
import '../authentication_interface.dart';
import '../webservices/authentication_web_service.dart';

AuthenticationRepository newAuthenticationRepository(
  AuthenticationWS authenticationWS,
  FlutterSecureStorage storage,
) {
  return _AuthenticationRepository(
    authenticationWS,
    storage,
  );
}

class _AuthenticationRepository implements AuthenticationRepository {
  const _AuthenticationRepository(
    this._authenticationWS,
    this._storage,
  );

  final AuthenticationWS _authenticationWS;
  final  FlutterSecureStorage _storage;

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

    final body = jsonDecode(response.body);
    await _storage.write(key: StorageKeys.authToken, value: body['token']);

    return Result.success(null);
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
}
