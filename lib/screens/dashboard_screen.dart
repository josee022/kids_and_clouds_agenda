import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../models/event.dart';
import '../services/mock_data_service.dart';
import '../theme/app_theme.dart';
import '../utils/string_extensions.dart';
import '../widgets/dashboard/stat_card.dart';
import '../widgets/dashboard/category_pie_chart.dart';
import '../widgets/dashboard/child_stats_list.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtener datos para estadísticas
    final events = MockDataService.events;
    final children = MockDataService.children;
    
    // Cálculos estadísticos
    final totalEvents = events.length;
    final activeChildren = children.length; // Niños con al menos un evento
    
    // Eventos por categoría para gráfico circular
    final Map<EventCategory, int> eventsByCategory = {};
    for (final category in EventCategory.values) {
      eventsByCategory[category] = events.where((e) => e.category == category).length;
    }
    
    // Eventos por niño
    final Map<String, int> eventsByChild = {};
    for (final child in children) {
      eventsByChild[child.id] = events.where((e) => e.childId == child.id).length;
    }
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: AppTheme.primaryPurple,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tarjetas de estadísticas principales
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: StatCard(
                      title: 'Total Eventos',
                      value: totalEvents.toString(),
                      icon: Icons.event,
                      color: AppTheme.primaryBlue,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: StatCard(
                      title: 'Niños Activos',
                      value: activeChildren.toString(),
                      icon: Icons.people,
                      color: AppTheme.accentYellow,
                    ),
                  ),
                ],
              ),
            ),
            
            // Sección de gráfico circular por categoría
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Distribución por Categoría',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 250,
                      child: CategoryPieChart(eventsByCategory: eventsByCategory),
                    ),
                  ],
                ),
              ),
            ),
            
            // Sección de estadísticas por niño
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Eventos por Niño',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ChildStatsList(
                      children: children,
                      eventsByChild: eventsByChild,
                    ),
                  ],
                ),
              ),
            ),
            
            // Espacio adicional al final
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
