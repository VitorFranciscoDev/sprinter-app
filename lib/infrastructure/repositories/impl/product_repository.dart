import 'dart:convert';

import 'package:sprinter/domain/entities/entity_error.dart';
import 'package:sprinter/domain/entities/entity_product.dart';
import 'package:sprinter/infrastructure/repositories/products.dart';
import 'package:sprinter/infrastructure/repositories/webservices/product_web_service.dart';

ProductRepository newProductsRepository(ProductWS productWS) {
  return _ProductRepository(productWS);
}

class _ProductRepository implements ProductRepository {
  const _ProductRepository(this._productWS);

  final ProductWS _productWS;

  @override
  Future<List<Product>> getPaginatedProducts(StandardFilter filter) async {
    final response = await _productWS.getPaginatedProducts(filter);
    final body = jsonDecode(response.body);

    if (response.statusCode != 200) {
      final errorResponse = ErrorResponse.fromJSON(body);

      switch (errorResponse.code) {
        case 'INTERNAL_SERVER_ERROR':
          throw Exception('INTERNAL_SERVER_ERROR');
        case 'BAD_REQUEST':
          throw Exception('BAD_REQUEST');
        case 'NOT_FOUND':
          throw Exception('NOT_FOUND');
        case 'INVALID_CREDENTIALS':
          throw Exception('INVALID_CREDENTIALS');
        default:
          throw Exception('INTERNAL_SERVER_ERROR');
      }
    }

    final products = (body as List)
        .map((item) => Product.fromJSON(item as Map<String, dynamic>))
        .toList();

    return products;
  }
}
