import 'package:flutter/foundation.dart';

/// Defines the Product information
@immutable
final class Product {
  /// Standard constructor
  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.imageURL,
    required this.price,
    required this.stock,
  });

  /// Unique identifier for the product
  final String id;

  /// Name of the product
  final String name;

  /// Description of the product
  final String description;

  /// Image of the product
  final String imageURL;

  /// Price of the product
  final double price;

  /// Stock of the product
  final int stock;

  /// Returns a Product from a given JSON
  factory Product.fromJSON(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imageURL: json['imageURL'],
      price: json['price'],
      stock: json['stock'],
    );
  }
}
