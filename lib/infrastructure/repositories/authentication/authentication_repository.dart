import 'dart:async';
import 'dart:convert';

import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:sprinter/build_flags.dart';
import 'package:sprinter/domain/entities/entity_error.dart';
import 'package:sprinter/domain/entities/entity_result.dart';
import 'package:sprinter/domain/entities/entity_user.dart';
import 'package:sprinter/domain/entities/errors/authentication_error.dart';
import 'package:sprinter/infrastructure/repositories/authentication/authentication_interface.dart';

AuthenticationRepository newAuthenticationRepository() {
  return _AuthenticationRepository();
}

class _AuthenticationRepository implements AuthenticationRepository {
  @override
  Future<Result<void, AuthenticationError>> attemptLogin(
    UserCredentials credentials,
  ) async {
    final client = SentryHttpClient();
    final url = Uri.parse('$baseURL/api/auth/login');

    try {
      final response = await client.post(
        url,
        body: jsonEncode(credentials.toJSON()),
      );

      if (response.statusCode != 200) {
        final errorResponse = ErrorResponse.fromJSON(jsonDecode(response.body));

        final error = switch (errorResponse.code) {
          'INVALID_CREDENTIALS' => InvalidCredentials(errorResponse.message),
          _ => UnknownAuthenticationError(errorResponse.message),
        };

        return Result.failure(error);
      }

      return Result.success(null);
    } on Exception catch (e) {
      unawaited(Sentry.captureException(e));
      rethrow;
    } finally {
      client.close();
    }
  }
}
