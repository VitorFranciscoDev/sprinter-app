import 'package:sprinter/domain/usecases/authentication.dart';
import 'package:sprinter/domain/usecases/impl/authentication_use_case.dart';
import 'package:sprinter/domain/usecases/product.dart';
import 'package:sprinter/domain/usecases/impl/product_use_case.dart';
import 'package:sprinter/infrastructure/repositories/impl/authentication_repository.dart';
import 'package:sprinter/infrastructure/repositories/impl/product_repository.dart';
import 'package:sprinter/infrastructure/storage/impl/secure_storage.dart';
import 'package:sprinter/infrastructure/storage/impl/shared_preferences_storage.dart';
import 'package:sprinter/infrastructure/storage/storage.dart';

late final AppStorage secureStorage;
late final AppStorage sharedPreferencesStorage;

late final AuthenticationUseCase authenticationUseCase;
late final ProductUseCase productUseCase;

void initialize() {
  // App storage
  secureStorage = newSecureStorage();
  sharedPreferencesStorage = newSharedPreferencesStorage();

  // Repositories
  final authenticationRepository = newAuthenticationRepository();
  final productsRepository = newProductRepository();

  // Use cases
  authenticationUseCase = newAuthenticationUseCase(authenticationRepository);
  productUseCase = newProductUseCase(productsRepository);
}
