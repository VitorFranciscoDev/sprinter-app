import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:sprinter/infrastructure/repositories/utils/standard_http_request.dart';

import '../../../domain/entities/entity_product.dart';

class ProductWS {
  /// Get a list of products with optional filtering and pagination
  Future<http.Response> getPaginatedProducts(StandardFilter filter) async {
   return StandardHttpRequest.standardGetRequest(
    endpoint: 'api/products',
    filter: filter,
  );
  }
}