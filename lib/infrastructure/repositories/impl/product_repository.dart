import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sprinter/build_flags.dart';
import 'package:sprinter/domain/entities/entity_error.dart';
import 'package:sprinter/domain/entities/entity_product.dart';
import 'package:sprinter/infrastructure/repositories/product.dart';
import 'package:sprinter/infrastructure/storage/keys.dart';
import 'package:sprinter/infrastructure/storage/storage.dart';

import '../../../domain/entities/entity_result.dart';
import '../../../domain/entities/errors/product_error.dart';
import '../../../logger.dart';

ProductRepository newProductRepository(AppStorage storage) {
  return _ProductRepository(storage);
}

class _ProductRepository implements ProductRepository {
  const _ProductRepository(this._storage);

  final AppStorage _storage;

  @override
  Future<Result<List<Product>, ProductError>> listPaginatedProducts(
    int cursor,
  ) async {
    final params = {"cursor": cursor.toString()};

    try {
      final url = Uri.https(BuildFlags.baseURL, '/api/product/list', params);
      final token = await _storage.readString(StorageKeys.authToken);

      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      final body = jsonDecode(response.body);

      if (response.statusCode != 200) {
        final errorResponse = ErrorResponse.fromJSON(body);

        return switch (errorResponse.code) {
          'INTERNAL_SERVER_ERROR' => Result.failure(.internalServerError),
          'BAD_REQUEST' => Result.failure(.badRequestError),
          _ => Result.failure(.internalServerError),
        };
      }

      return .success(body.map((product) => Product.fromJSON(product)).toList());
    } catch (e, stackTrace) {
      logger.e(
        "failed to list paginated products",
        error: e,
        stackTrace: stackTrace,
      );
      return .failure(.internalServerError);
    }
  }
}
