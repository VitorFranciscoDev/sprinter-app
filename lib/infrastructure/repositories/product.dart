import 'package:sprinter/domain/entities/entity_product.dart';

import '../../domain/entities/entity_result.dart';
import '../../domain/entities/errors/product_error.dart';

/// Contract for product related actions
abstract class ProductRepository {
  /// Get a list of products from the data source
  Future<Result<List<Product>, ProductError>> listPaginatedProducts(int cursor);
}
