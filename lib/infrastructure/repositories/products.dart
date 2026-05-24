import 'package:sprinter/domain/entities/entity_product.dart';

abstract class ProductsRepository {
  /// Fetches a list of products from the data source
  Future<List<Product>> fetchProducts(StandardFilter filter);
}