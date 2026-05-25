/// Defines the Product entity and related classes for the application.
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

  /// Image URL of the product
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

// Standard filter class for product listing, including sorting, pagination, etc.
class StandardFilter {
  /// Standard constructor for a listing, such as sorting, orderBy, limit and page
  const StandardFilter({
    required this.orderBy,
    required this.orderDirection,
    required this.limit,
    required this.page,
  });

  /// Default constructor for a listing, such as sorting, orderBy, limit and page
  factory StandardFilter.standard() {
    return StandardFilter(
      orderBy: 'createdAt',
      orderDirection: 'desc',
      limit: 20,
      page: 1,
    );
  }

  /// Field for sorting results
  final String orderBy;

  /// Sort direction (ascending or descending)
  final String orderDirection;

  /// Maximum number of results per page
  final int limit;

  /// Page number to be returned
  final int page;

  Map<String, String> toQueryParams() {
    return {
      'orderBy': orderBy,
      'orderDirection': orderDirection,
      'limit': limit.toString(),
      'page': page.toString(),
    };
  }
}
