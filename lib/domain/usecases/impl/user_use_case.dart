import 'package:sprinter/domain/entities/entity_result.dart';
import 'package:sprinter/domain/entities/entity_user.dart';
import 'package:sprinter/domain/entities/errors/user_error.dart';
import 'package:sprinter/domain/usecases/user.dart';
import 'package:sprinter/infrastructure/repositories/user.dart';

UserUseCase newUserUseCase(UserRepository userRepository) {
  return _UserUseCase(userRepository);
}

class _UserUseCase implements UserUseCase {
  const _UserUseCase(this._userRepository);
  
  final UserRepository _userRepository;

  @override
  Future<Result<User, UserError>> getUserInformation() async {
    return await _userRepository.getUserInformation();
  }
}
