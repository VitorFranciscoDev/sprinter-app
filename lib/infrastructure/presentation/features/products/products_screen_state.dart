import 'package:flutter/material.dart';
import 'package:sprinter/domain/entities/entity_product.dart';
import 'package:sprinter/domain/entities/entity_result.dart';
import 'package:sprinter/domain/errors/product_error.dart';
import 'package:sprinter/infrastructure/infrastructure.dart';

class ProductsScreenState with ChangeNotifier {
  /// Defines the loading state of Products Screen
  var loading = false;

  /// Defines if the request returned an error
  ProductError? error;

  /// List of products
  List<Product> products = [];

  /// Current filter for pagination and sorting
  late StandardFilter _filter;

  ProductsScreenState() {
    _filter = StandardFilter.standard();
  }

  /// Gets the current filter
  StandardFilter get filter => _filter;

  /// Updates the filter and get the products
  void updateFilter(StandardFilter newFilter) {
    _filter = newFilter;
    getPaginatedProducts();
  }

  /// Get products with the current filter
  Future<void> getPaginatedProducts() async {
    loading = true;
    error = null;
    notifyListeners();

    final response = await productUseCase.getPaginatedProducts(_filter);

    if (response is Failure<List<Product>, ProductError>) {
      error = response.error;
    }

    final result = response as Success<List<Product>, ProductError>;
    products = result.value;

    loading = false;
    notifyListeners();
  }
}
