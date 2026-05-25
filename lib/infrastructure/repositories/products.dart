import 'package:sprinter/domain/entities/entity_product.dart';

abstract class ProductRepository {
  /// Get a list of products from the data source
  Future<List<Product>> getPaginatedProducts(StandardFilter filter);
}