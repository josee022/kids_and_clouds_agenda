import 'package:flutter/material.dart';
import '../models/child.dart';
import '../models/event.dart';
import '../services/mock_data_service.dart';
import '../utils/string_extensions.dart';
import '../widgets/category_menu.dart';

class AgendaScreen extends StatefulWidget {
  const AgendaScreen({super.key});

  @override
  State<AgendaScreen> createState() => _AgendaScreenState();
}

class _AgendaScreenState extends State<AgendaScreen> {
  String? selectedChildId;
  EventCategory? selectedCategory;

  @override
  Widget build(BuildContext context) {
    // Obtenemos eventos filtrados según el hijo y la categoría seleccionados
    final events = MockDataService.getFilteredEvents(
      childId: selectedChildId, 
      category: selectedCategory
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Agenda diaria'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildHeader(),
            const SizedBox(height: 8),
            
            // Menú de categorías
            CategoryMenu(
              selectedCategory: selectedCategory,
              onCategorySelected: (category) {
                setState(() {
                  selectedCategory = category;
                });
              },
            ),
            
            // Contador de eventos
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                '${events.length} ${events.length == 1 ? "evento" : "eventos"}',
                style: TextStyle(color: Colors.grey.shade600),
              ),
            ),
            
            Expanded(
              child: events.isEmpty 
                ? _buildNoEventsMessage() 
                : ListView.builder(
                  itemCount: events.length,
                  itemBuilder: (context, index) {
                    final event = events[index];
                    final child = MockDataService.getChildById(event.childId);
                    return _buildEventCard(event, child);
                  },
                ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNoEventsMessage() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.event_busy,
            size: 64,
            color: Colors.grey,
          ),
          const SizedBox(height: 16),
          const Text(
            'No hay eventos para mostrar',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
          const SizedBox(height: 8),
          Text(
            'Prueba con otros filtros',
            style: TextStyle(color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Luis López',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        _buildChildSelector(),
      ],
    );
  }

  Widget _buildChildSelector() {
    return DropdownButton<String>(
      hint: const Text('Seleccionar hijo'),
      value: selectedChildId,
      onChanged: (String? newValue) {
        setState(() {
          selectedChildId = newValue;
        });
      },
      items: [
        const DropdownMenuItem<String>(
          value: null,
          child: Text('Todos los hijos'),
        ),
        ...MockDataService.children.map((child) {
          return DropdownMenuItem<String>(
            value: child.id,
            child: Text(child.name),
          );
        }).toList(),
      ],
    );
  }

  Widget _buildEventCard(Event event, Child child) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(child.photoUrl),
        ),
        title: Text(
          child.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(
                  event.category.icon,
                  size: 16,
                  color: Colors.grey.shade600,
                ),
                const SizedBox(width: 4),
                Text(
                  event.category.localizedName,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(event.description),
          ],
        ),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            event.time.formatTime(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
