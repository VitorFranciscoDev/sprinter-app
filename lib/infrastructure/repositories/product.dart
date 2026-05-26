import 'package:sprinter/domain/entities/entity_product.dart';

import '../../domain/entities/entity_result.dart';
import '../../domain/errors/product_error.dart';

abstract class ProductRepository {
  /// Get a list of products from the data source
  Future<Result<List<Product>, ProductError>> getPaginatedProducts();
}