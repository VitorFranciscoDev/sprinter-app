/// Represents the possible types of activity.
enum ActivityType {
  walking,
  running,
  cycling,
}

/// Represents an activity made by the user.
final class Activity {
  /// Standard constructor.
  const Activity({
    required this.id,
    required this.type,
  });

  /// Unique identifier for the activity.
  final int id;

  /// The type for the activity made.
  final ActivityType type;
}