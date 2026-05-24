import 'package:sprinter/domain/entities/entity_product.dart';
import 'package:sprinter/domain/entities/entity_result.dart';
import 'package:sprinter/domain/errors/product_error.dart';
import 'package:sprinter/domain/usecases/product.dart';

import '../../../infrastructure/repositories/products.dart';

ProductUseCase newProductUseCase(ProductsRepository productsRepository) {
  return _ProductUseCase(productsRepository);
}

class _ProductUseCase implements ProductUseCase {
  const _ProductUseCase(this._productsRepository);

  final ProductsRepository _productsRepository;

  @override
  Future<Result<List<Product>, ProductError>> fetchProducts(
    StandardFilter filter,
  ) async {
    try {
      final products = await _productsRepository.fetchProducts(filter);
      return Result.success(products);
    } catch (e) {
      return Result.failure(.internalServerError);
    }
  }
}
