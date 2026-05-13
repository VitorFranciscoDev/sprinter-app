import 'package:http/http.dart' as http;

import '../../../domain/entities/entity_user.dart';
import '../utils/standard_http_request.dart';

class AuthenticationWS {
  Future<http.Response> attemptLogin(UserCredentials credentials) async {
    return await StandardHttpRequest.standardPostRequest(
      endpoint: 'api/auth/login',
      json: credentials.toJSON(),
    );
  }

  Future<http.Response> getUserFromToken(String token) async {
    return await StandardHttpRequest.standardGetRequest(
      endpoint: 'api/auth/me',
      token: token,
    );
  }

  Future<http.Response> attemptRegister(UserCredentials credentials) async {
    return await StandardHttpRequest.standardPostRequest(
      endpoint: 'api/auth/register',
      json: credentials.toJSON(),
    );
  }

  Future<http.Response> completeRegister(UserInformation informations) async {
    return await StandardHttpRequest.standardPostRequest(
      endpoint: 'api/auth/completeRegistration',
      json: informations.toJSON(),
    );
  }
}
