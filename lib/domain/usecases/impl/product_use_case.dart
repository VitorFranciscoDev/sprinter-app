import 'package:sprinter/domain/entities/entity_product.dart';
import 'package:sprinter/domain/entities/entity_result.dart';
import 'package:sprinter/domain/errors/product_error.dart';
import 'package:sprinter/domain/usecases/product.dart';

import '../../../infrastructure/repositories/products.dart';

ProductUseCase newProductUseCase(ProductRepository productsRepository) {
  return _ProductUseCase(productsRepository);
}

class _ProductUseCase implements ProductUseCase {
  const _ProductUseCase(this._productRepository);

  final ProductRepository _productRepository;

  @override
  Future<Result<List<Product>, ProductError>> getPaginatedProducts(
    StandardFilter filter,
  ) async {
      final products = await _productRepository.getPaginatedProducts(filter);
      return Success(products);
  }
}
