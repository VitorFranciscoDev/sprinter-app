import 'package:sprinter/domain/entities/entity_product.dart';
import 'package:sprinter/domain/entities/entity_result.dart';

import '../errors/product_error.dart';

/// Defines the contract for product-related business logic
abstract class ProductUseCase {
  /// Fetches a list of products with optional filtering and pagination
  Future<Result<List<Product>, ProductError>> getPaginatedProducts(
    StandardFilter filter,
  );
}
