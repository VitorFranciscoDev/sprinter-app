import 'dart:async';
import 'dart:convert';

import 'package:sprinter/domain/entities/errors/entity_error.dart';
import 'package:sprinter/domain/entities/entity_result.dart';
import 'package:sprinter/domain/entities/entity_user.dart';
import 'package:sprinter/infrastructure/infrastructure.dart';
import 'package:sprinter/infrastructure/repositories/utils/standard_http_request.dart';
import 'package:sprinter/infrastructure/storage/keys.dart';

import '../../../domain/entities/errors/authentication_error.dart';
import '../authentication.dart';

AuthenticationRepository newAuthenticationRepository() {
  return _AuthenticationRepository();
}

class _AuthenticationRepository implements AuthenticationRepository {
  const _AuthenticationRepository();

  @override
  Future<Result<void, AuthenticationError>> attemptLogin(
    UserCredentials credentials,
  ) async {
    final response = await standardPostRequest(
      endpoint: '/auth/login',
      json: credentials.toJSON(),
    );
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

    await secureStorage.writeString(
      key: StorageKeys.currentUser,
      value: body['token'],
    );
    return Result.success(null);
  }

  @override
  Future<Result<void, AuthenticationError>> getUserFromToken() async {
    final response = await standardGetRequest(endpoint: '/auth/me');
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

    await secureStorage.writeJSON(key: StorageKeys.currentUser, value: body);
    return Result.success(null);
  }

  @override
  Future<Result<void, AuthenticationError>> attemptRegister(
    UserCredentials credentials,
  ) async {
    final response = await standardPostRequest(
      endpoint: '/auth/register',
      json: credentials.toJSON(),
    );
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

    await secureStorage.writeString(
      key: StorageKeys.authToken,
      value: body['token'],
    );
    return Result.success(null);
  }

  @override
  Future<Result<void, AuthenticationError>> attemptCompleteRegister(
    UserInformation information,
  ) async {
    final response = await standardPostRequest(
      endpoint: '/auth/completeRegister',
      json: information.toJSON(),
    );
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

    return Result.success(null);
  }
}
