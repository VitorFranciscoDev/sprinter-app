import 'package:sprinter/domain/entities/entity_activity.dart';
import 'package:sprinter/domain/entities/entity_result.dart';
import 'package:sprinter/domain/entities/errors/activity_error.dart';
import 'package:sprinter/domain/usecases/activity.dart';
import 'package:sprinter/infrastructure/repositories/activity.dart';

ActivityUseCase newActivityUseCase(ActivityRepository repository) {
  return _ActivityUseCase(repository);
}

class _ActivityUseCase implements ActivityUseCase {
  const _ActivityUseCase(this._activityRepository);

  final ActivityRepository _activityRepository;

  @override
  Future<Result<void, ActivityError>> startActivity(ActivityType type) async {
    return await _activityRepository.startActivity(type);
  }

  @override
  Future<Result<void, ActivityError>> endActivity(NewActivity activity) async {
    return await _activityRepository.endActivity(activity);
  }

  @override
  Future<Result<NewActivity?, ActivityError>> checkIfHasCurrentActivity(
    int userID,
  ) async {
    return await _activityRepository.checkIfHasCurrentActivity(userID);
  }
}
