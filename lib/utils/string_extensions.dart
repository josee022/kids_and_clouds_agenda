import 'package:flutter/material.dart';
import '../models/event.dart';

extension EventCategoryExtension on EventCategory {
  String get localizedName {
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
      case EventCategory.medication:
        return 'Medicación';
      case EventCategory.development:
        return 'Desarrollo';
      default:
        return 'Otro';
    }
  }

  IconData get icon {
    switch (this) {
      case EventCategory.food:
        return Icons.restaurant;
      case EventCategory.nap:
        return Icons.bedtime;
      case EventCategory.activity:
        return Icons.brush;
      case EventCategory.bathroom:
        return Icons.wc;
      case EventCategory.observation:
        return Icons.visibility;
      case EventCategory.medication:
        return Icons.medication;
      case EventCategory.development:
        return Icons.child_care;
      default:
        return Icons.note;
    }
  }
}

extension DateTimeExtension on DateTime {
  String formatTime() {
    String hour = this.hour.toString().padLeft(2, '0');
    String minute = this.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }
}
