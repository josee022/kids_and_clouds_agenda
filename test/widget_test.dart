// Widget tests para la aplicación Kids&Clouds Agenda
// Pruebas unitarias sencillas para componentes individuales de la UI

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kids_and_clouds_agenda/models/event.dart';
import 'package:kids_and_clouds_agenda/widgets/agenda/pagination_info_bar.dart';

void main() {
  group('Kids&Clouds Widget Tests', () {
    // Test para PaginationInfoBar - Widget que muestra información sobre la paginación
    testWidgets('PaginationInfoBar muestra el número total de eventos', (WidgetTester tester) async {
      const int totalEvents = 25;
      const int startIndex = 0;
      const int endIndex = 5;
      
      // Construir el widget PaginationInfoBar
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Center(
              child: PaginationInfoBar(
                totalEvents: totalEvents,
                startIndex: startIndex,
                endIndex: endIndex,
              ),
            ),
          ),
        ),
      );
      
      // Verificar que el widget muestra el texto esperado
      expect(find.text('25 eventos'), findsOneWidget);
      expect(find.text('Mostrando 1-5 de 25'), findsOneWidget);
    });
    
    // Test para el modelo Event - Verifica las propiedades de un evento
    test('Event model tiene todas las propiedades requeridas', () {
      final event = Event(
        id: '1',
        childId: '2',
        category: EventCategory.food,
        time: DateTime(2023, 5, 10, 12, 30),
        description: 'Prueba de descripción',
      );
      
      expect(event.id, equals('1'));
      expect(event.childId, equals('2'));
      expect(event.category, equals(EventCategory.food));
      expect(event.time, equals(DateTime(2023, 5, 10, 12, 30)));
      expect(event.description, equals('Prueba de descripción'));
    });
    
    // Test para verificar que todas las categorías estén definidas
    test('EventCategory tiene todas las categorías requeridas', () {
      expect(EventCategory.values.length, equals(7));
      expect(EventCategory.values, contains(EventCategory.food));
      expect(EventCategory.values, contains(EventCategory.nap));
      expect(EventCategory.values, contains(EventCategory.activity));
      expect(EventCategory.values, contains(EventCategory.bathroom));
      expect(EventCategory.values, contains(EventCategory.observation));
      expect(EventCategory.values, contains(EventCategory.medication));
      expect(EventCategory.values, contains(EventCategory.development));
    });
  });
}
