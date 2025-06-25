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
    Child(
      id: '4',
      name: 'Carlos Sánchez',
      photoUrl: 'https://robohash.org/carlitos222?set=set5&size=150x150',
      age: 4,
    ),
    Child(
      id: '5',
      name: 'Elena Navarro',
      photoUrl: 'https://robohash.org/elenita333?set=set5&size=150x150',
      age: 1,
    ),
    Child(
      id: '6',
      name: 'Daniel Gómez',
      photoUrl: 'https://robohash.org/danny444?set=set5&size=150x150',
      age: 5,
    ),
  ];

  // Eventos simulados (ordenados por tiempo - más antiguos primero)
  static final List<Event> events = [
    // Eventos más antiguos
    Event(
      id: 'e18',
      childId: '6',
      category: EventCategory.activity,
      time: DateTime.now().subtract(Duration(hours: 3, minutes: 15)),
      description: 'Actividad de pre-escritura',
    ),
    Event(
      id: 'e1',
      childId: '1',
      category: EventCategory.food,
      time: DateTime.now().subtract(Duration(hours: 3)),
      description: 'Desayuno: Cereales y fruta',
    ),
    Event(
      id: 'e14',
      childId: '5',
      category: EventCategory.food,
      time: DateTime.now().subtract(Duration(hours: 2, minutes: 50)),
      description: 'Biberón 150ml',
    ),
    Event(
      id: 'e11',
      childId: '4',
      category: EventCategory.activity,
      time: DateTime.now().subtract(Duration(hours: 2, minutes: 30)),
      description: 'Clase de música con instrumentos',
    ),
    Event(
      id: 'e25',
      childId: '1',
      category: EventCategory.medication,
      time: DateTime.now().subtract(Duration(hours: 2, minutes: 25)),
      description: 'Administración de medicamento para alergia estacional',
    ),
    Event(
      id: 'e6',
      childId: '2',
      category: EventCategory.food,
      time: DateTime.now().subtract(Duration(hours: 2, minutes: 15)),
      description: 'Almuerzo: Pollo con verduras',
    ),
    Event(
      id: 'e15',
      childId: '5',
      category: EventCategory.bathroom,
      time: DateTime.now().subtract(Duration(hours: 2, minutes: 20)),
      description: 'Cambio de pañal',
    ),
    Event(
      id: 'e2',
      childId: '1',
      category: EventCategory.activity,
      time: DateTime.now().subtract(Duration(hours: 2)),
      description: 'Clase de pintura con acuarelas',
    ),
    Event(
      id: 'e19',
      childId: '6',
      category: EventCategory.food,
      time: DateTime.now().subtract(Duration(hours: 2)),
      description: 'Almuerzo: comió todo sin problemas',
    ),
    Event(
      id: 'e24',
      childId: '6',
      category: EventCategory.medication,
      time: DateTime.now().subtract(Duration(hours: 1, minutes: 50)),
      description: 'Aplicación de crema para dermatitis en brazos',
    ),
    Event(
      id: 'e12',
      childId: '4',
      category: EventCategory.food,
      time: DateTime.now().subtract(Duration(hours: 1, minutes: 45)),
      description: 'Merienda: Sándwich y zumo',
    ),
    Event(
      id: 'e16',
      childId: '5',
      category: EventCategory.nap,
      time: DateTime.now().subtract(Duration(hours: 1, minutes: 40)),
      description: 'Siesta de 2 horas',
    ),
    Event(
      id: 'e4',
      childId: '2',
      category: EventCategory.nap,
      time: DateTime.now().subtract(Duration(hours: 1, minutes: 30)),
      description: 'Siesta de 45 minutos',
    ),
    Event(
      id: 'e10',
      childId: '3',
      category: EventCategory.activity,
      time: DateTime.now().subtract(Duration(hours: 1, minutes: 15)),
      description: 'Juegos con bloques de construcción',
    ),
    Event(
      id: 'e5',
      childId: '2',
      category: EventCategory.bathroom,
      time: DateTime.now().subtract(Duration(hours: 1)),
      description: 'Cambio de pañal',
    ),
    Event(
      id: 'e13',
      childId: '4',
      category: EventCategory.nap,
      time: DateTime.now().subtract(Duration(minutes: 55)),
      description: 'No quiso dormir la siesta',
    ),
    Event(
      id: 'e23',
      childId: '5',
      category: EventCategory.development,
      time: DateTime.now().subtract(Duration(minutes: 50)),
      description: 'Primer intento de sostener la cabeza por sí misma',
    ),
    Event(
      id: 'e8',
      childId: '3',
      category: EventCategory.food,
      time: DateTime.now().subtract(Duration(minutes: 45)),
      description: 'Merienda: Yogur con galletas',
    ),
    Event(
      id: 'e7',
      childId: '2',
      category: EventCategory.observation,
      time: DateTime.now().subtract(Duration(minutes: 40)),
      description: 'Estuvo inquieto durante la hora de lectura',
    ),
    Event(
      id: 'e22',
      childId: '3',
      category: EventCategory.development,
      time: DateTime.now().subtract(Duration(minutes: 38)),
      description: 'Ha logrado reconocer todas las formas geométricas básicas',
    ),
    Event(
      id: 'e20',
      childId: '6',
      category: EventCategory.observation,
      time: DateTime.now().subtract(Duration(minutes: 35)),
      description: 'Ha ayudado a organizar los juguetes',
    ),
    Event(
      id: 'e9',
      childId: '3',
      category: EventCategory.observation,
      time: DateTime.now().subtract(Duration(minutes: 30)),
      description: 'Estuvo muy participativa en la actividad de grupo',
    ),
    Event(
      id: 'e17',
      childId: '5',
      category: EventCategory.observation,
      time: DateTime.now().subtract(Duration(minutes: 20)),
      description: 'Sonríe y responde a estímulos con movimientos',
    ),
    Event(
      id: 'e21',
      childId: '4',
      category: EventCategory.medication,
      time: DateTime.now().subtract(Duration(minutes: 18)),
      description: 'Administración de antipirético por temperatura de 37.5°C',
    ),
    // Evento más reciente
    Event(
      id: 'e3',
      childId: '1',
      category: EventCategory.bathroom,
      time: DateTime.now().subtract(Duration(minutes: 15)),
      description: 'Lavado de manos antes del almuerzo',
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
