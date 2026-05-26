import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:sprinter/infrastructure/repositories/utils/standard_http_request.dart';

class ProductWS {
  Future<http.Response> getPaginatedProducts() async {
    return StandardHttpRequest.standardGetRequest(
      endpoint: 'api/products',
      token: '',
    );
  }
}
