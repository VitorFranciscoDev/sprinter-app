import 'package:flutter/material.dart';

sealed class AuthenticationError {
  const AuthenticationError();
}

@immutable
final class InvalidCredentials extends AuthenticationError {
  const InvalidCredentials(this.message);

  final String message;
}

@immutable
final class UnknownAuthenticationError extends AuthenticationError {
  const UnknownAuthenticationError(this.message);

  final String message;
}