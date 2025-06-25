enum EventCategory {
  food,
  nap,
  activity,
  bathroom,
  observation,
  medication,
  development
}

class Event {
  final String id;
  final String childId;
  final EventCategory category;
  final DateTime time;
  final String description;

  Event({
    required this.id,
    required this.childId,
    required this.category,
    required this.time,
    required this.description,
  });
}
