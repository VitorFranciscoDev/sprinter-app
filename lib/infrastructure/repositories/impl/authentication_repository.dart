import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sprinter/build_flags.dart';
import 'package:sprinter/domain/entities/entity_error.dart';
import 'package:sprinter/domain/entities/entity_result.dart';
import 'package:sprinter/domain/entities/entity_user.dart';
import 'package:sprinter/infrastructure/storage/keys.dart';
import 'package:sprinter/infrastructure/storage/storage.dart';

import '../../../domain/entities/errors/authentication_error.dart';
import '../../../logger.dart';
import '../authentication.dart';

AuthenticationRepository newAuthenticationRepository(AppStorage storage) {
  return _AuthenticationRepository(storage);
}

class _AuthenticationRepository implements AuthenticationRepository {
  const _AuthenticationRepository(this._storage);

  final AppStorage _storage;

  @override
  Future<Result<void, AuthenticationError>> attemptLogin(
    UserCredentials credentials,
  ) async {
    try {
      final url = Uri.parse('${BuildFlags.baseURL}/auth/login');

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(credentials.toJSON()),
      );
      final body = jsonDecode(response.body);

      if (response.statusCode != 200) {
        final errorResponse = ErrorResponse.fromJSON(body);

        return switch (errorResponse.code) {
          'INTERNAL_SERVER_ERROR' => .failure(.internalServerError),
          'BAD_REQUEST' => .failure(.badRequestError),
          'NOT_FOUND' => .failure(.notFoundError),
          'INVALID_CREDENTIALS' => .failure(.invalidCredentialsError),
          _ => .failure(.internalServerError),
        };
      }

      await _storage.writeString(
        key: StorageKeys.authToken,
        value: body['token'],
      );
      await _getUserFromToken();

      return .success(null);
    } catch (e, stackTrace) {
      logger.e("failed to login", error: e, stackTrace: stackTrace);
      return .failure(.internalServerError);
    }
  }

  Future<Result<void, AuthenticationError>> _getUserFromToken() async {
    try {
      final url = Uri.parse('${BuildFlags.baseURL}/auth/me');
      final token = _storage.readString(StorageKeys.authToken);

      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      final body = jsonDecode(response.body);

      if (response.statusCode != 200) {
        final errorResponse = ErrorResponse.fromJSON(body);

        return switch (errorResponse.code) {
          'INTERNAL_SERVER_ERROR' => .failure(.internalServerError),
          'BAD_REQUEST' => .failure(.badRequestError),
          'NOT_FOUND' => .failure(.notFoundError),
          _ => .failure(.internalServerError),
        };
      }

      await _storage.writeJSON(key: StorageKeys.currentUser, value: body);
      return .success(null);
    } catch (e, stackTrace) {
      logger.e(
        "failed to get user from token",
        error: e,
        stackTrace: stackTrace,
      );
      return .failure(.internalServerError);
    }
  }

  @override
  Future<Result<void, AuthenticationError>> attemptRegister(
    UserCredentials credentials,
  ) async {
    try {
      final url = Uri.parse('${BuildFlags.baseURL}/auth/register');

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(credentials.toJSON()),
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

      await _storage.writeString(
        key: StorageKeys.authToken,
        value: body['token'],
      );
      await _getUserFromToken();

      return .success(null);
    } catch (e, stackTrace) {
      logger.e("failed to register", error: e, stackTrace: stackTrace);
      return .failure(.internalServerError);
    }
  }
}
