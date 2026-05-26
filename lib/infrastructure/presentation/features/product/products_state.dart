import 'package:flutter/material.dart';
import 'package:sprinter/domain/entities/entity_product.dart';
import 'package:sprinter/domain/entities/entity_result.dart';
import 'package:sprinter/domain/errors/product_error.dart';
import 'package:sprinter/infrastructure/infrastructure.dart';

/// Represents the state for Products Screen
class ProductsState with ChangeNotifier {
  /// Standard constructor
  ProductsState();

  /// Defines the loading state of Products Screen
  var loading = false;

  /// Defines if the request returned an error
  ProductError? error;

  /// List of products
  List<Product> products = [];

  /// Get products with the current filter
  Future<void> getPaginatedProducts() async {
    loading = true;
    error = null;
    notifyListeners();

    final response = await productUseCase.getPaginatedProducts();
    if (response is Failure<List<Product>, ProductError>) {
      error = response.error;
    }
    products = response as List<Product>;

    loading = false;
    notifyListeners();
  }
}
