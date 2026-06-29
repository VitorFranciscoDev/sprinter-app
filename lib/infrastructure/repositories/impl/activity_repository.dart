import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sprinter/domain/entities/entity_activity.dart';
import 'package:sprinter/domain/entities/entity_result.dart';
import 'package:sprinter/domain/entities/errors/activity_error.dart';
import 'package:sprinter/infrastructure/repositories/activity.dart';
import 'package:sprinter/infrastructure/storage/storage.dart';

import '../../../build_flags.dart';
import '../../../domain/entities/entity_error.dart';
import '../../../logger.dart';
import '../../storage/keys.dart';

ActivityRepository newActivityRepository(AppStorage storage) {
  return _ActivityRepository(storage);
}

class _ActivityRepository implements ActivityRepository {
  const _ActivityRepository(this._storage);

  final AppStorage _storage;

  @override
  Future<Result<void, ActivityError>> startActivity(ActivityType type) async {
    try {
      final url = Uri.parse('${BuildFlags.baseURL}/api/activity/start');
      final token = _storage.readString(StorageKeys.authToken);

      final response = await http.post(
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
          'INTERNAL_SERVER_ERROR' => Result.failure(.internalServerError),
          'BAD_REQUEST' => Result.failure(.badRequestError),
          _ => Result.failure(.internalServerError),
        };
      }

      return .success(null);
    } catch (e, stackTrace) {
      logger.e("failed to start activity", error: e, stackTrace: stackTrace);
      return .failure(.internalServerError);
    }
  }

  @override
  Future<Result<void, ActivityError>> endActivity(Activity activity) async {
    try {
      final url = Uri.parse('${BuildFlags.baseURL}/api/activity/end');
      final token = _storage.readString(StorageKeys.authToken);

      final response = await http.post(
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
          'INTERNAL_SERVER_ERROR' => Result.failure(.internalServerError),
          'BAD_REQUEST' => Result.failure(.badRequestError),
          _ => Result.failure(.internalServerError),
        };
      }

      return .success(null);
    } catch (e, stackTrace) {
      logger.e("failed to end activity", error: e, stackTrace: stackTrace);
      return .failure(.internalServerError);
    }
  }

  @override
  Future<Result<Activity?, ActivityError>> checkIfHasCurrentActivity(
    int userID,
  ) async {
    try {
      final url = Uri.parse(
        '${BuildFlags.baseURL}/api/activity/current/$userID',
      );
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
          'INTERNAL_SERVER_ERROR' => Result.failure(.internalServerError),
          'BAD_REQUEST' => Result.failure(.badRequestError),
          _ => Result.failure(.internalServerError),
        };
      }

      return .success(null);
    } catch (e, stackTrace) {
      logger.e(
        "failed to check if has current activity",
        error: e,
        stackTrace: stackTrace,
      );
      return .failure(.internalServerError);
    }
  }
}
