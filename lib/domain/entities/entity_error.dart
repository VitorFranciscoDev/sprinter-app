import 'package:flutter/material.dart';

/// Represents an error response returned from the backend
@immutable
final class ErrorResponse {
  /// Standard constructor
  const ErrorResponse({required this.code, required this.message});

  /// An error code returned by the backend (e.g. "BAD_REQUEST").
  final String code;

  /// A human-readable explanation of the error.
  final String message;

  /// Returns an ErrorResponse from a given JSON
  factory ErrorResponse.fromJSON(Map<String, dynamic> json) {
    return ErrorResponse(code: json['code'], message: json['message']);
  }
}
