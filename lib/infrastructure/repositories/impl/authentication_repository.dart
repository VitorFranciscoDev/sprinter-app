import 'dart:async';
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sprinter/domain/entities/entity_error.dart';
import 'package:sprinter/domain/entities/entity_result.dart';
import 'package:sprinter/domain/entities/entity_user.dart';

import '../../../domain/errors/authentication_error.dart';
import '../authentication.dart';
import '../webservices/authentication_web_service.dart';

const _authToken = 'auth_token';
const _currentUser = 'current_user';

AuthenticationRepository newAuthenticationRepository(
  AuthenticationWS authenticationWS,
  FlutterSecureStorage storage,
) {
  return _AuthenticationRepository(authenticationWS, storage);
}

class _AuthenticationRepository implements AuthenticationRepository {
  const _AuthenticationRepository(this._authenticationWS, this._storage);

  final AuthenticationWS _authenticationWS;
  final FlutterSecureStorage _storage;

  @override
  Future<Result<void, AuthenticationError>> attemptLogin(
    UserCredentials credentials,
  ) async {
    final response = await _authenticationWS.attemptLogin(credentials);
    final body = jsonDecode(response.body);

    if (response.statusCode != 200) {
      final errorResponse = ErrorResponse.fromJSON(body);

      return switch (errorResponse.code) {
        'INTERNAL_SERVER_ERROR' => Result.failure(.internalServerError),
        'BAD_REQUEST' => Result.failure(.badRequestError),
        'NOT_FOUND' => Result.failure(.notFoundError),
        'INVALID_CREDENTIALS' => Result.failure(.invalidCredentialsError),
        _ => Result.failure(.internalServerError),
      };
    }

    await _storage.write(key: _authToken, value: body['token']);
    return Result.success(null);
  }

  @override
  Future<Result<void, AuthenticationError>> getUserFromToken(
    String token,
  ) async {
    final response = await _authenticationWS.getUserFromToken(token);
    final body = jsonDecode(response.body);

    if (response.statusCode != 200) {
      final errorResponse = ErrorResponse.fromJSON(body);

      return switch (errorResponse.code) {
        'INTERNAL_SERVER_ERROR' => Result.failure(.internalServerError),
        'BAD_REQUEST' => Result.failure(.badRequestError),
        'NOT_FOUND' => Result.failure(.notFoundError),
        _ => Result.failure(.internalServerError),
      };
    }

    await _storage.write(key: _currentUser, value: body);
    return Result.success(null);
  }
  
  @override
  Future<Result<void, AuthenticationError>> attemptRegister(
    UserCredentials credentials,
    ) async {
       final response = await _authenticationWS.attemptLogin(credentials);
    final body = jsonDecode(response.body);

    if (response.statusCode != 200) {
      final errorResponse = ErrorResponse.fromJSON(body);

      return switch (errorResponse.code) {
        'INTERNAL_SERVER_ERROR' => Result.failure(.internalServerError),
        'BAD_REQUEST' => Result.failure(.badRequestError),
        'NOT_FOUND' => Result.failure(.notFoundError),
        'INVALID_CREDENTIALS' => Result.failure(.invalidCredentialsError),
        _ => Result.failure(.internalServerError),
      };
    }

    await _storage.write(key: _authToken, value: body['token']);
    return Result.success(null);
  }
}
