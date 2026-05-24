import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:sentry_flutter/sentry_flutter.dart';

import '../../../build_flags.dart';
import '../../../domain/entities/entity_product.dart';

class ProductWS {
  /// Fetches a list of products with optional filtering and pagination
  Future<http.Response> fetchProducts(StandardFilter filter) async {
    final client = http.Client();
    
    // Build URL with query parameters
    final queryParams = {
      'orderBy': filter.orderBy,
      'orderDirection': filter.orderDirection,
      'limit': filter.limit.toString(),
      'page': filter.page.toString(),
    };
    
    final url = Uri.parse('${BuildFlags.baseURL}/api/products')
        .replace(queryParameters: queryParams);

    try {
      return client.get(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
      );
    } on Exception catch (e) {
      unawaited(Sentry.captureException(e));
      rethrow;
    } finally {
      client.close();
    }
  }
}