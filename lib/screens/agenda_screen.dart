import 'package:flutter/material.dart';
import '../models/event.dart';
import '../services/mock_data_service.dart';
import '../widgets/agenda/category_menu.dart';
import '../widgets/agenda/event_card.dart';
import '../widgets/agenda/pagination_controls.dart';
import '../widgets/agenda/empty_state.dart';
import '../widgets/agenda/child_selector_header.dart';
import '../widgets/agenda/pagination_info_bar.dart';
import '../controllers/pagination_controller.dart';
import '../theme/app_theme.dart';

class AgendaScreen extends StatefulWidget {
  const AgendaScreen({super.key});

  @override
  State<AgendaScreen> createState() => _AgendaScreenState();
}

class _AgendaScreenState extends State<AgendaScreen> {
  String? selectedChildId;
  EventCategory? selectedCategory;
  
  // Variables para paginación
  int _currentPage = 0;
  final int _eventsPerPage = 5;

  @override
  Widget build(BuildContext context) {
    // Obtenemos eventos filtrados
    final allEvents = MockDataService.getFilteredEvents(
      childId: selectedChildId, 
      category: selectedCategory
    );
    
    // Controlador de paginación
    final paginationController = PaginationController(
      allEvents: allEvents,
      eventsPerPage: _eventsPerPage,
      currentPage: _currentPage,
    );
    
    // Validamos que la página actual esté dentro del rango válido
    if (!paginationController.isCurrentPageValid() && paginationController.totalPages > 0) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          _currentPage = paginationController.totalPages - 1;
        });
      });
    }
    
    // Obtenemos los eventos de la página actual
    final paginatedEvents = paginationController.paginatedEvents;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.primaryBlue,
        elevation: 0,
        title: Row(
          children: [
            Icon(Icons.calendar_today, color: Colors.white),
            SizedBox(width: 8),
            const Text(
              'Agenda diaria',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        // Sin acciones en el AppBar
      ),
      backgroundColor: AppTheme.backgroundLight,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header con selector de niño
            ChildSelectorHeader(
              selectedChildId: selectedChildId,
              onChildSelected: _onChildSelected,
            ),
            const SizedBox(height: 16),
            
            // Menú de categorías
            CategoryMenu(
              selectedCategory: selectedCategory,
              onCategorySelected: (category) {
                setState(() {
                  selectedCategory = category;
                  _currentPage = 0; // Reset a primera página al cambiar filtros
                });
              },
            ),
            
            // Información de paginación
            PaginationInfoBar(
              totalEvents: allEvents.length,
              startIndex: paginationController.startIndex,
              endIndex: paginationController.endIndex,
            ),
            
            // Lista de eventos o mensaje de vacío
            Expanded(
              child: allEvents.isEmpty 
                ? const EmptyStateMessage() 
                : ListView.builder(
                  itemCount: paginatedEvents.length,
                  itemBuilder: (context, index) {
                    final event = paginatedEvents[index];
                    final child = MockDataService.getChildById(event.childId);
                    return EventCard(event: event, child: child);
                  },
                ),
            ),
            
            // Controles de paginación (solo si hay más de una página)
            if (allEvents.isNotEmpty && paginationController.totalPages > 1)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: PaginationControls(
                  currentPage: _currentPage,
                  totalPages: paginationController.totalPages,
                  onPageChanged: (int page) => setState(() => _currentPage = page),
                ),
              ),
          ],
        ),
      ),
    );
  }

  // Método para actualizar la selección del hijo
  void _onChildSelected(String? childId) {
    setState(() {
      selectedChildId = childId;
      _currentPage = 0; // Resetear a la primera página al cambiar de hijo
    });
  }
  
  // Ya no necesitamos este método porque usamos el widget EventCard
}
