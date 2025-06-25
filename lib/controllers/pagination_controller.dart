import '../models/event.dart';

class PaginationController {
  final List<Event> allEvents;
  final int eventsPerPage;
  final int currentPage;

  const PaginationController({
    required this.allEvents,
    required this.eventsPerPage,
    required this.currentPage,
  });

  // Número total de páginas
  int get totalPages => (allEvents.length / eventsPerPage).ceil();
  
  // Índice inicial de elementos en la página actual
  int get startIndex => currentPage * eventsPerPage;
  
  // Índice final de elementos en la página actual
  int get endIndex => (startIndex + eventsPerPage < allEvents.length) 
      ? startIndex + eventsPerPage 
      : allEvents.length;
  
  // Subconjunto de eventos para la página actual
  List<Event> get paginatedEvents => allEvents.isEmpty 
      ? [] 
      : allEvents.sublist(startIndex, endIndex);
  
  // Validar si la página actual está dentro del rango válido
  bool isCurrentPageValid() => totalPages > 0 ? currentPage < totalPages : true;
}
