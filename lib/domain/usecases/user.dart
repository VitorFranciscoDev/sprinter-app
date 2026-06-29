import 'package:sprinter/domain/entities/entity_result.dart';
import 'package:sprinter/domain/entities/entity_user.dart';
import 'package:sprinter/domain/entities/errors/user_error.dart';

/// Defines the contract for user-related business logic
abstract class UserUseCase {
  /// Get the user information from the storage
  Future<Result<User, UserError>> getUserInformation();
}
