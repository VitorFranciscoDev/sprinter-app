import 'package:sprinter/domain/entities/entity_result.dart';
import 'package:sprinter/domain/entities/entity_user.dart';
import 'package:sprinter/domain/entities/errors/user_error.dart';
import 'package:sprinter/infrastructure/repositories/user.dart';
import 'package:sprinter/infrastructure/storage/keys.dart';
import 'package:sprinter/infrastructure/storage/storage.dart';

UserRepository newUserRepository(AppStorage storage) {
    return _UserRepostiory(storage: storage);
}

class _UserRepostiory implements UserRepository {
  _UserRepostiory({required this._storage});

  final AppStorage _storage;
  @override
  Future<Result<User, UserError>> getUserInformation() async {
    Map<String, dynamic>? data = await _storage.readJSON(StorageKeys.userKey);
    if (data == null) {
      return Result.failure(UserError.notFoundError);
    }
    User user = User.fromJSON(data);
    return Result.success(user);
  }
}
