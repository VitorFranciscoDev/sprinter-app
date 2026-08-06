import 'package:flutter/cupertino.dart';

/// Represents the possible types of activity.
enum ActivityType {
  /// Represents an "walking" activity.
  walking,

  /// Represents an "running" activity.
  running,

  /// Represents an "cycling" activity.
  cycling;

  @override
  String toString() {
    return switch (this) {
      .walking => 'Walk',
      .running => 'Run',
      .cycling => 'Cycling',
    };
  }
}

/// Represents a new activity created by the user.
@immutable
final class NewActivity {
  /// Standard constructor.
  const NewActivity({required this.activityType, required this.startDate});

  /// The type for the activity made.
  final ActivityType activityType;

  /// The date the activity started.
  final DateTime startDate;

  /// Transforms an [NewActivity] in a JSON.
  Map<String, dynamic> toJSON() {
    return {'activity_type': activityType, 'start_date': startDate};
  }
}
