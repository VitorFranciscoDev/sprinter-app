import 'package:flutter/material.dart';

/// Base class representing authentication-related errors
sealed class AuthenticationError {
  /// Standard constructor
  const AuthenticationError();
}

/// Represents an authentication failure caused by invalid user credentials
@immutable
final class InvalidCredentials extends AuthenticationError {
  /// Standard constructor
  const InvalidCredentials(this.message);

  /// Human-readable explanation of the credential failure
  final String message;
}

/// Represents an uncategorized authentication error
@immutable
final class UnknownAuthenticationError extends AuthenticationError {
  /// Standard constructor
  const UnknownAuthenticationError(this.message);

  /// Human-readable description of the error
  final String message;
}

/// Represents an invalid email error
@immutable
final class InvalidEmailError extends AuthenticationError {
  /// Standard constructor
  const InvalidEmailError(this.message);

  /// Human-readable description of the error
  final String message;
}

/// Represents an invalid password error
@immutable
final class InvalidPasswordError extends AuthenticationError {
  /// Standard constructor
  const InvalidPasswordError(this.message);

  /// Human-readable description of the error
  final String message;
}