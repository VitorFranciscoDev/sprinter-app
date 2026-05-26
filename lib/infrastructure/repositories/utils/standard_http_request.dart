import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:sprinter/domain/entities/entity_product.dart';

import '../../../build_flags.dart';

final class StandardHttpRequest {
  static Future<http.Response> standardGetRequest({
    required String endpoint,
    String? token,
  }) async {
    final client = SentryHttpClient();
    final url = Uri.parse('${BuildFlags.baseURL}/$endpoint');

    try {
      return client.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          if (token != null) 'Authorization': 'Bearer $token',
        },
      );
    } on Exception catch (e) {
      unawaited(Sentry.captureException(e));
      rethrow;
    } finally {
      client.close();
    }
  }

  static Future<http.Response> standardPostRequest({
    required String endpoint,
    required Map<String, dynamic> json,
    String? token,
  }) async {
    final client = SentryHttpClient();
    final url = Uri.parse('${BuildFlags.baseURL}/$endpoint');

    try {
      return client.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          if (token != null) 'Authorization': 'Bearer $token',
        },
        body: jsonEncode(json),
      );
    } on Exception catch (e) {
      unawaited(Sentry.captureException(e));
      rethrow;
    } finally {
      client.close();
    }
  }
}
