import 'package:sprinter/domain/entities/entity_result.dart';
import 'package:sprinter/domain/entities/entity_user.dart';
import 'package:sprinter/domain/entities/errors/user_error.dart';

/// Contract for user data operations
abstract class UserRepository {
  /// Get the user information from storage
  Future<Result<User, UserError>> getUserInformation();
}
