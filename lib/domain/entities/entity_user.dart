import 'package:flutter/material.dart';

@immutable
final class UserCredentials {
  /// Standard constructor
  const UserCredentials({required this.email, required this.password});

  /// Email of the user
  final String email;

  /// Password of the user
  final String password;

  /// Returns JSON from [UserCredentials]
  Map<String, dynamic> toJSON() {
    return {'email': email, 'password': password};
  }
}
