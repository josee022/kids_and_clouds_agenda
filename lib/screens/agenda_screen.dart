import 'package:flutter/material.dart';
import '../models/child.dart';
import '../models/event.dart';
import '../services/mock_data_service.dart';
import '../utils/string_extensions.dart';

class AgendaScreen extends StatefulWidget {
  const AgendaScreen({super.key});

  @override
  State<AgendaScreen> createState() => _AgendaScreenState();
}

class _AgendaScreenState extends State<AgendaScreen> {
  String? _selectedChildId;
  EventCategory? _selectedCategory;
  
  @override
  Widget build(BuildContext context) {
    // Obtener todos los niños
    final List<Child> children = MockDataService.children;
    
    // Obtener eventos filtrados
    final List<Event> filteredEvents = MockDataService.getEventsByChildAndCategory(
      _selectedChildId, 
      _selectedCategory
    );
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agenda diaria'),
        centerTitle: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header con nombre y selector de hijo
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Luis López',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                DropdownButton<String>(
                  hint: const Text('Seleccionar hijo'),
                  value: _selectedChildId,
                  items: [
                    // Opción para mostrar todos
                    const DropdownMenuItem(
                      value: null,
                      child: Text('Todos los hijos'),
                    ),
                    // Opciones para cada hijo
                    ...children.map((child) => DropdownMenuItem(
                      value: child.id,
                      child: Text(child.name),
                    )),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedChildId = value;
                    });
                  },
                ),
              ],
            ),
          ),
          
          // Aquí implementaremos el menú de categorías en el siguiente paso
          
          // Vista temporal de eventos (la mejoraremos en pasos posteriores)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: filteredEvents.isEmpty
                  ? const Center(child: Text('No hay eventos para mostrar'))
                  : ListView.builder(
                      itemCount: filteredEvents.length,
                      itemBuilder: (context, index) {
                        final event = filteredEvents[index];
                        final child = MockDataService.getChildById(event.childId);
                        
                        return Card(
                          margin: const EdgeInsets.only(bottom: 8.0),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(child.photoUrl),
                            ),
                            title: Text(child.name),
                            subtitle: Text(event.description),
                            trailing: Text(
                              event.time.formattedTime,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
