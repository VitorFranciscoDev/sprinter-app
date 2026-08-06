import '../entities/entity_activity.dart';
import '../entities/entity_result.dart';
import '../entities/errors/activity_error.dart';

/// Defines the contract for activity related actions.
abstract class ActivityUseCase {
  /// Starts a new activity with the given type.
  Future<Result<void, ActivityError>> startActivity(ActivityType type);

  /// Ends the current activity.
  Future<Result<void, ActivityError>> endActivity(NewActivity activity);

  /// Checks if the user has an current activity when he logs in the application.
  Future<Result<NewActivity?, ActivityError>> checkIfHasCurrentActivity(int userID);
}