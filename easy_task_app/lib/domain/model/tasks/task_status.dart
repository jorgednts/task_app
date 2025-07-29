import 'package:flutter/material.dart';
import 'package:internationalization/internationalization.dart';

enum EasyTaskStatus {
  toDo,
  inProgress,
  done;

  factory EasyTaskStatus.valueOf(String status) {
    switch (status) {
      case 'toDo':
        return toDo;
      case 'inProgress':
        return inProgress;
      case 'done':
        return done;
      default:
        throw ArgumentError('Invalid status: $status');
    }
  }

  String translated(AppIntl appIntl) {
    switch (this) {
      case toDo:
        return appIntl.tasks_status_to_do;
      case inProgress:
        return appIntl.tasks_status_in_progress;
      case done:
        return appIntl.tasks_status_done;
    }
  }

  Color color(ColorScheme colorScheme) {
    switch (this) {
      case toDo:
        return colorScheme.tertiary;
      case inProgress:
        return colorScheme.primary;
      case done:
        return colorScheme.primary.withValues(alpha: 0.5);
    }
  }
}
