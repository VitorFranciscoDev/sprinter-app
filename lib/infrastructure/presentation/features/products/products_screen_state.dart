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
    _filter = const StandardFilter();
  }

  /// Gets the current filter
  StandardFilter get filter => _filter;

  /// Updates the filter and fetches products
  void updateFilter(StandardFilter newFilter) {
    _filter = newFilter;
    fetchProducts();
  }

  /// Fetches products with the current filter
  Future<void> fetchProducts() async {
    loading = true;
    error = null;
    notifyListeners();

    final response = await productUseCase.fetchProducts(_filter);

    if (response is Success<List<Product>, ProductError>) {
      products = response.value;
    } else {
      final failure = response as Failure<List<Product>, ProductError>;
      error = failure.error;
    }

    loading = false;
    notifyListeners();
  }
}
