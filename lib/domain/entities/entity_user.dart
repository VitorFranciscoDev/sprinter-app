import 'package:flutter/foundation.dart';

/// Represents the application user
@immutable
final class User {
  /// Standard constructor
  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.username,
    required this.biography,
    required this.imageURL,
  });

  /// Unique identifier for the user
  final int id;

  /// Name of the user
  final String name;

  /// Email of the user
  final String email;

  /// Username of the user profile
  final String username;

  /// Biography of the user profile
  final String biography;

  /// Profile picture of the user
  final String imageURL;

  /// Returns a [User] from the given JSON
  factory User.fromJSON(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      username: json['username'],
      biography: json['biography'],
      imageURL: json['imageURL'],
    );
  }

  Map<String, dynamic> toJSON() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'username': username,
      'biography': biography,
      'imageURL': imageURL,
    };
  }
}

/// Represents the user credentials for authentication actions
@immutable
final class UserCredentials {
  /// Standard constructor
  const UserCredentials({
    this.name,
    required this.email,
    required this.password,
  });

  /// Name of the user
  final String? name;

  /// Email of the user
  final String email;

  /// Password of the user
  final String password;

  /// Returns JSON from [UserCredentials]
  Map<String, dynamic> toJSON() {
    return {'name': name, 'email': email, 'password': password};
  }
}
