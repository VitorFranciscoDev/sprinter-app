import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:sprinter/infrastructure/infrastructure.dart';
import 'package:sprinter/infrastructure/storage/keys.dart';
import 'package:sprinter/infrastructure/storage/storage.dart';

import '../../../build_flags.dart';

Future<http.Response> standardGetRequest({
  required String endpoint,
  bool needsAuth = true,
}) async {
  final client = SentryHttpClient();
  final url = Uri.parse('${BuildFlags.baseURL}/$endpoint');
  String? token;

  if (needsAuth) {
    token = await secureStorage.readString(StorageKeys.authToken);
  }

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

Future<http.Response> standardPostRequest({
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
