import 'package:sprinter/domain/entities/entity_result.dart';
import 'package:sprinter/domain/entities/entity_user.dart';
import 'package:sprinter/domain/entities/errors/user_error.dart';
import 'package:sprinter/domain/usecases/user.dart';
import 'package:sprinter/infrastructure/repositories/user.dart';

UserUseCase newUserUseCase(UserRepository repository) {
  return _UserUseCase(repository: repository);
}

class _UserUseCase implements UserUseCase {
  _UserUseCase({required this._repository});
  
  final UserRepository _repository;

  @override
  Future<Result<User, UserError>> getUserInformation() async {
    return await _repository.getUserInformation();
  }
}
