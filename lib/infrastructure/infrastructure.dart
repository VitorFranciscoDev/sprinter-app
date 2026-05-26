import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sprinter/domain/usecases/authentication.dart';
import 'package:sprinter/domain/usecases/impl/authentication_use_case.dart';
import 'package:sprinter/domain/usecases/product.dart';
import 'package:sprinter/domain/usecases/impl/product_use_case.dart';
import 'package:sprinter/infrastructure/repositories/impl/authentication_repository.dart';
import 'package:sprinter/infrastructure/repositories/impl/product_repository.dart';
import 'package:sprinter/infrastructure/repositories/webservices/authentication_web_service.dart';
import 'package:sprinter/infrastructure/repositories/webservices/product_web_service.dart';

late final AuthenticationUseCase authenticationUseCase;
late final ProductUseCase productUseCase;

void initialize() {
  // Secure storage
  final storage= FlutterSecureStorage();

  // Web services
  final authenticationWS = AuthenticationWS();
  final productWS = ProductWS();

  // Repositories
  final authenticationRepository = newAuthenticationRepository(
    authenticationWS,
    storage,
  );
  final productsRepository = newProductRepository(productWS);

  // Use cases
  authenticationUseCase = newAuthenticationUseCase(authenticationRepository);
  productUseCase = newProductUseCase(productsRepository);
}
