import 'package:flutter/material.dart';

/// Represents the application user
@immutable
final class User {
  /// Standard constructor
  const User({required this.id, required this.name, required this.email});

  /// Unique identifier for the user
  final int id;

  /// Name of the user
  final String name;

  /// Email of the user
  final String email;

  /// Returns a [User] from the given JSON
  factory User.fromJSON(Map<String, dynamic> json) {
    return User(id: json['id'], name: json['name'], email: json['email']);
  }
}

/// Represents the user credentials for authentication actions
@immutable
final class UserCredentials {
  /// Standard constructor
  const UserCredentials({required this.email, required this.password, this.name});
  /// Email of the user
  final String email;

  /// Password of the user
  final String password;

  /// Name of the user
  final String? name;


  /// Returns JSON from [UserCredentials]
  Map<String, dynamic> toJSON() {
    return {'email': email, 'password': password};
  }
}
