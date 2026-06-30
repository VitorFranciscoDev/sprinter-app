import 'package:sprinter/domain/entities/entity_result.dart';
import 'package:sprinter/domain/entities/entity_user.dart';
import 'package:sprinter/domain/entities/errors/user_error.dart';
import 'package:sprinter/infrastructure/repositories/user.dart';
import 'package:sprinter/infrastructure/storage/keys.dart';
import 'package:sprinter/infrastructure/storage/storage.dart';

UserRepository newUserRepository(AppStorage storage) {
  return _UserRepository(storage);
}

class _UserRepository implements UserRepository {
  const _UserRepository(this._storage);

  final AppStorage _storage;

  @override
  Future<Result<User, UserError>> getUserInformation() async {
    final user = await _storage.readJSON(StorageKeys.userKey);
    if (user == null) {
      return .failure(UserError.notFoundError);
    }

    return .success(User.fromJSON(user));
  }
}
