import 'package:sprinter/domain/entities/entity_product.dart';
import 'package:sprinter/domain/entities/entity_result.dart';
import 'package:sprinter/domain/usecases/product.dart';

import '../../../infrastructure/repositories/product.dart';
import '../../entities/errors/product_error.dart';

ProductUseCase newProductUseCase(ProductRepository productRepository) {
  return _ProductUseCase(productRepository);
}

class _ProductUseCase implements ProductUseCase {
  const _ProductUseCase(this._productRepository);

  final ProductRepository _productRepository;

  @override
  Future<Result<List<Product>, ProductError>> getPaginatedProducts() async {
      return await _productRepository.listPaginatedProducts();
  }
}
