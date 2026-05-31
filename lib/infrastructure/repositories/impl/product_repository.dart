import 'dart:convert';

import 'package:sprinter/domain/entities/errors/entity_error.dart';
import 'package:sprinter/domain/entities/entity_product.dart';
import 'package:sprinter/infrastructure/repositories/product.dart';
import 'package:sprinter/infrastructure/repositories/utils/standard_http_request.dart';

import '../../../domain/entities/entity_result.dart';
import '../../../domain/entities/errors/product_error.dart';

ProductRepository newProductRepository() {
  return _ProductRepository();
}

class _ProductRepository implements ProductRepository {
  const _ProductRepository();

  @override
  Future<Result<List<Product>, ProductError>> getPaginatedProducts() async {
    final response = await standardGetRequest(endpoint: '/product/list');
    final body = jsonDecode(response.body);

    if (response.statusCode != 200) {
      final errorResponse = ErrorResponse.fromJSON(body);

      return switch (errorResponse.code) {
        'INTERNAL_SERVER_ERROR' => Result.failure(.internalServerError),
        'BAD_REQUEST' => Result.failure(.badRequestError),
        _ => Result.failure(.internalServerError),
      };
    }

    return body.map((product) => Product.fromJSON(product)).toList();
  }
}
