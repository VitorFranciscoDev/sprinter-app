import 'dart:convert';

import 'package:sprinter/domain/entities/entity_error.dart';
import 'package:sprinter/domain/entities/entity_product.dart';
import 'package:sprinter/infrastructure/repositories/product.dart';
import 'package:sprinter/infrastructure/repositories/webservices/product_web_service.dart';

import '../../../domain/entities/entity_result.dart';
import '../../../domain/errors/product_error.dart';

ProductRepository newProductRepository(ProductWS productWS) {
  return _ProductRepository(productWS);
}

class _ProductRepository implements ProductRepository {
  const _ProductRepository(this._productWS);

  final ProductWS _productWS;

  @override
  Future<Result<List<Product>, ProductError>> getPaginatedProducts() async {
    final response = await _productWS.getPaginatedProducts();
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
