import '../models/child.dart';
import '../models/event.dart';

class MockDataService {
  // Lista de niños simulados
  static final List<Child> children = [
    Child(
      id: '1',
      name: 'Ana García',
      photoUrl: 'https://robohash.org/anita123?set=set5&size=150x150',
      age: 3,
    ),
    Child(
      id: '2',
      name: 'Pablo Martínez',
      photoUrl: 'https://robohash.org/pablito456?set=set5&size=150x150',
      age: 4,
    ),
    Child(
      id: '3',
      name: 'Lucía Rodríguez',
      photoUrl: 'https://robohash.org/lucita789?set=set5&size=150x150',
      age: 2,
    ),
  ];

  // Eventos simulados
  static final List<Event> events = [
    // Eventos para Ana
    Event(
      id: 'e1',
      childId: '1',
      category: EventCategory.food,
      time: DateTime.now().subtract(Duration(hours: 3)),
      description: 'Desayuno: Cereales y fruta',
    ),
    Event(
      id: 'e2',
      childId: '1',
      category: EventCategory.activity,
      time: DateTime.now().subtract(Duration(hours: 2)),
      description: 'Clase de pintura con acuarelas',
    ),
    
    // Eventos para Pablo
    Event(
      id: 'e3',
      childId: '2',
      category: EventCategory.nap,
      time: DateTime.now().subtract(Duration(hours: 1, minutes: 30)),
      description: 'Siesta de 45 minutos',
    ),
    Event(
      id: 'e4',
      childId: '2',
      category: EventCategory.bathroom,
      time: DateTime.now().subtract(Duration(hours: 1)),
      description: 'Cambio de pañal',
    ),
    
    // Eventos para Lucía
    Event(
      id: 'e5',
      childId: '3',
      category: EventCategory.food,
      time: DateTime.now().subtract(Duration(minutes: 45)),
      description: 'Merienda: Yogur con galletas',
    ),
    Event(
      id: 'e6',
      childId: '3',
      category: EventCategory.observation,
      time: DateTime.now().subtract(Duration(minutes: 30)),
      description: 'Estuvo muy participativa en la actividad de grupo',
    ),
  ];

  // Método para obtener todos los eventos
  static List<Event> getAllEvents() {
    return events;
  }

  // Método para obtener eventos filtrados por niño
  static List<Event> getEventsByChildId(String? childId) {
    if (childId == null) return events;
    return events.where((event) => event.childId == childId).toList();
  }

  // Método para obtener eventos filtrados por categoría
  static List<Event> getEventsByCategory(EventCategory? category) {
    if (category == null) return events;
    return events.where((event) => event.category == category).toList();
  }

  // Método para obtener eventos filtrados por niño y categoría
  static List<Event> getEventsByChildAndCategory(String? childId, EventCategory? category) {
    List<Event> filteredEvents = events;
    
    if (childId != null) {
      filteredEvents = filteredEvents.where((event) => event.childId == childId).toList();
    }
    
    if (category != null) {
      filteredEvents = filteredEvents.where((event) => event.category == category).toList();
    }
    
    return filteredEvents;
  }
  
  // Método para obtener eventos filtrados (interfaz más moderna)
  static List<Event> getFilteredEvents({String? childId, EventCategory? category}) {
    return getEventsByChildAndCategory(childId, category);
  }

  // Método para obtener un niño por su ID
  static Child getChildById(String id) {
    return children.firstWhere((child) => child.id == id);
  }
}
