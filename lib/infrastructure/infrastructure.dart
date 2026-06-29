import 'package:sprinter/domain/usecases/authentication.dart';
import 'package:sprinter/domain/usecases/impl/authentication_use_case.dart';
import 'package:sprinter/domain/usecases/impl/user_use_case.dart';
import 'package:sprinter/domain/usecases/product.dart';
import 'package:sprinter/domain/usecases/impl/product_use_case.dart';
import 'package:sprinter/domain/usecases/user.dart';
import 'package:sprinter/infrastructure/repositories/impl/authentication_repository.dart';
import 'package:sprinter/infrastructure/repositories/impl/product_repository.dart';
import 'package:sprinter/infrastructure/repositories/impl/user_repositroy.dart';
import 'package:sprinter/infrastructure/storage/impl/secure_storage.dart';

late final AuthenticationUseCase authenticationUseCase;
late final ProductUseCase productUseCase;
late final UserUseCase userUseCase;

void initialize() {
  // App storage
  final secureStorage = newSecureStorage();

  // Repositories
  final authenticationRepository = newAuthenticationRepository(secureStorage);
  final productsRepository = newProductRepository(secureStorage);
  final userRepository = newUserRepository(secureStorage);

  // Use cases
  authenticationUseCase = newAuthenticationUseCase(authenticationRepository);
  productUseCase = newProductUseCase(productsRepository);
  userUseCase = newUserUseCase(userRepository);
}
