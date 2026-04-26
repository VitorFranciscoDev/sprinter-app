import 'package:flutter/material.dart';

@immutable
final class ErrorResponse {
  const ErrorResponse({required this.code, required this.message});

  final String code;
  final String message;

  factory ErrorResponse.fromJSON(Map<String, dynamic> json) {
    return ErrorResponse(code: json['code'], message: json['message']);
  }
}
