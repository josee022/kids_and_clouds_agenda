import 'package:flutter_test/flutter_test.dart';
import 'package:kids_and_clouds_agenda/models/event.dart';
import 'package:kids_and_clouds_agenda/services/mock_data_service.dart';

void main() {
  group('MockDataService Tests', () {
    
    test('getFilteredEvents retorna todos los eventos cuando no hay filtros', () {
      final allEvents = MockDataService.getFilteredEvents();
      final expectedTotal = MockDataService.events.length;
      
      expect(allEvents.length, equals(expectedTotal));
    });
    
    test('getFilteredEvents filtra correctamente por childId', () {
      const String childId = '1'; // Ana García
      final filteredEvents = MockDataService.getFilteredEvents(childId: childId);
      
      // Verificamos que todos los eventos retornados sean de Ana García
      expect(
        filteredEvents.every((event) => event.childId == childId),
        isTrue,
        reason: 'Todos los eventos deben pertenecer al niño con ID $childId'
      );
      
      // También verificamos que hayamos obtenido todos los eventos de Ana García
      final expectedCount = MockDataService.events
          .where((event) => event.childId == childId)
          .length;
      
      expect(filteredEvents.length, equals(expectedCount));
    });
    
    test('getFilteredEvents filtra correctamente por categoría', () {
      final category = EventCategory.food; // Alimentación
      final filteredEvents = MockDataService.getFilteredEvents(category: category);
      
      // Verificamos que todos los eventos retornados sean de alimentación
      expect(
        filteredEvents.every((event) => event.category == category),
        isTrue,
        reason: 'Todos los eventos deben ser de la categoría $category'
      );
      
      // También verificamos que hayamos obtenido todos los eventos de alimentación
      final expectedCount = MockDataService.events
          .where((event) => event.category == category)
          .length;
      
      expect(filteredEvents.length, equals(expectedCount));
    });
    
    test('getFilteredEvents combina filtros de niño y categoría correctamente', () {
      const String childId = '2'; // Pablo Martínez
      final category = EventCategory.nap; // Siesta
      
      final filteredEvents = MockDataService.getFilteredEvents(
        childId: childId,
        category: category,
      );
      
      // Verificamos que los eventos cumplan ambas condiciones
      expect(
        filteredEvents.every(
          (event) => event.childId == childId && event.category == category
        ),
        isTrue,
        reason: 'Todos los eventos deben pertenecer al niño con ID $childId y categoría $category'
      );
      
      // Contamos manualmente para verificar
      final expectedCount = MockDataService.events
          .where((event) => event.childId == childId && event.category == category)
          .length;
      
      expect(filteredEvents.length, equals(expectedCount));
    });
    
    test('getFilteredEvents retorna lista vacía cuando no hay coincidencias', () {
      // Buscamos una combinación que sabemos no existe
      const String childId = '6'; // Daniel Gómez
      final category = EventCategory.bathroom; // Baño
      
      final filteredEvents = MockDataService.getFilteredEvents(
        childId: childId,
        category: category,
      );
      
      expect(filteredEvents, isEmpty);
    });
  });
}
