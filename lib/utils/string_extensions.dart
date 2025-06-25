import '../models/event.dart';

extension EventCategoryExtension on EventCategory {
  String get name {
    switch (this) {
      case EventCategory.food:
        return 'Alimentación';
      case EventCategory.nap:
        return 'Siestas';
      case EventCategory.activity:
        return 'Actividades';
      case EventCategory.bathroom:
        return 'Deposiciones';
      case EventCategory.observation:
        return 'Observaciones';
      default:
        return 'Otro';
    }
  }

  String get icon {
    switch (this) {
      case EventCategory.food:
        return '🍽️';
      case EventCategory.nap:
        return '💤';
      case EventCategory.activity:
        return '🎨';
      case EventCategory.bathroom:
        return '🚽';
      case EventCategory.observation:
        return '👀';
      default:
        return '📝';
    }
  }
}

extension DateTimeExtension on DateTime {
  String get formattedTime {
    String hour = this.hour.toString().padLeft(2, '0');
    String minute = this.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }
}
