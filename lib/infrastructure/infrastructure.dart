import 'package:sprinter/domain/usecases/activity.dart';
import 'package:sprinter/domain/usecases/authentication.dart';
import 'package:sprinter/domain/usecases/impl/activity_use_case.dart';
import 'package:sprinter/domain/usecases/impl/authentication_use_case.dart';
import 'package:sprinter/domain/usecases/impl/settings_use_case.dart';
import 'package:sprinter/domain/usecases/impl/user_use_case.dart';
import 'package:sprinter/domain/usecases/product.dart';
import 'package:sprinter/domain/usecases/impl/product_use_case.dart';
import 'package:sprinter/domain/usecases/settings.dart';
import 'package:sprinter/domain/usecases/user.dart';
import 'package:sprinter/infrastructure/repositories/impl/activity_repository.dart';
import 'package:sprinter/infrastructure/repositories/impl/authentication_repository.dart';
import 'package:sprinter/infrastructure/repositories/impl/product_repository.dart';
import 'package:sprinter/infrastructure/repositories/impl/settings_repository.dart';
import 'package:sprinter/infrastructure/repositories/impl/user_repository.dart';
import 'package:sprinter/infrastructure/storage/impl/secure_storage.dart';
import 'package:sprinter/infrastructure/storage/impl/shared_preferences_storage.dart';

/// Global instance for the authentication use case.
late final AuthenticationUseCase authenticationUseCase;

/// Global instance for the product use case.
late final ProductUseCase productUseCase;

/// Global instance for the activity use case.
late final ActivityUseCase activityUseCase;

/// Global instance for the user use case.
late final UserUseCase userUseCase;

/// Global instance for the settings use case.
late final SettingsUseCase settingsUseCase;

/// Initializes the application use cases.
void initialize() {
  // App storage
  final secureStorage = newSecureStorage();
  final sharedPreferencesStorage = newSharedPreferencesStorage();

  // Repositories
  final authenticationRepository = newAuthenticationRepository(secureStorage);
  final productsRepository = newProductRepository(secureStorage);
  final activityRepository = newActivityRepository(secureStorage);
  final userRepository = newUserRepository(secureStorage);
  final settingsRepository = newSettingsRepository(sharedPreferencesStorage);

  // Use cases
  authenticationUseCase = newAuthenticationUseCase(authenticationRepository);
  productUseCase = newProductUseCase(productsRepository);
  activityUseCase = newActivityUseCase(activityRepository);
  userUseCase = newUserUseCase(userRepository);
  settingsUseCase = newSettingsUseCase(settingsRepository);
}
