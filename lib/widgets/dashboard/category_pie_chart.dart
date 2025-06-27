import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../models/event.dart';
import '../../theme/app_theme.dart';
import '../../utils/string_extensions.dart';

class CategoryPieChart extends StatelessWidget {
  final Map<EventCategory, int> eventsByCategory;

  const CategoryPieChart({
    super.key,
    required this.eventsByCategory,
  });

  @override
  Widget build(BuildContext context) {
    // Obtener colores para categorías, usando los mismos que en AppTheme.categoryColors
    final Map<EventCategory, Color> categoryColors = {
      EventCategory.food: AppTheme.categoryColors['food']!,
      EventCategory.nap: AppTheme.categoryColors['nap']!,
      EventCategory.activity: AppTheme.categoryColors['activity']!,
      EventCategory.bathroom: AppTheme.categoryColors['bathroom']!,
      EventCategory.observation: AppTheme.categoryColors['observation']!,
      EventCategory.medication: AppTheme.categoryColors['medication']!,
      EventCategory.development: AppTheme.categoryColors['development']!,
    };

    // Ajustar la estructura para dispositivos móviles
    return LayoutBuilder(
      builder: (context, constraints) {
        final isSmallScreen = constraints.maxWidth < 600;
        
        // En pantallas pequeñas, mostrar solo el gráfico sin leyenda
        if (isSmallScreen) {
          return Center(
            child: SizedBox(
              height: 220, // Más grande para móviles ya que no hay leyenda
              width: 220,
              child: PieChart(
                PieChartData(
                  sectionsSpace: 0, // Sin espacio entre secciones
                  centerSpaceRadius: 30,
                  sections: _buildSections(eventsByCategory, categoryColors, 0.6),
                ),
              ),
            ).animate()
             .fadeIn(duration: const Duration(milliseconds: 800))
             .scale(delay: const Duration(milliseconds: 300), duration: const Duration(milliseconds: 500)),
          );
        }
        
        // En pantallas grandes, mostrar gráfico a la izquierda y leyenda vertical a la derecha
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gráfico Circular a la izquierda
            Expanded(
              flex: 3,
              child: PieChart(
                PieChartData(
                  sectionsSpace: 0,
                  centerSpaceRadius: 40,
                  sections: _buildSections(eventsByCategory, categoryColors, 0.65),
                ),
              ),
            ),
            
            // Leyenda en formato vertical a la derecha
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: _buildLegendVertical(eventsByCategory, categoryColors),
              ),
            ),
          ],
        );
      },
    );
  }
  
  // Método auxiliar para crear las secciones del gráfico
  List<PieChartSectionData> _buildSections(
    Map<EventCategory, int> eventsByCategory,
    Map<EventCategory, Color> categoryColors,
    double badgeOffset,
  ) {
    final totalEvents = eventsByCategory.values.fold(0, (a, b) => a + b);
    
    return eventsByCategory.entries.map((entry) {
      final category = entry.key;
      final count = entry.value;
      final percent = totalEvents > 0 ? count / totalEvents : 0;
      
      return PieChartSectionData(
        color: categoryColors[category] ?? Colors.grey,
        value: count.toDouble(),
        title: '',
        radius: 100,
        badgeWidget: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              category.icon,
              color: Colors.white,
              size: 16,
              shadows: [
                const Shadow(color: Colors.black26, blurRadius: 2, offset: Offset(0, 1)),
              ],
            ),
            const SizedBox(height: 2),
            Text(
              '${(percent * 100).toStringAsFixed(0)}%',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: [
                  Shadow(color: Colors.black38, blurRadius: 2, offset: Offset(0, 1)),
                ],
              ),
            ),
          ],
        ),
        badgePositionPercentageOffset: badgeOffset,
        borderSide: BorderSide.none,
      );
    }).toList();
  }
  
  Widget _buildLegend(
    Map<EventCategory, int> eventsByCategory,
    Map<EventCategory, Color> categoryColors,
  ) {
    // Ordenar las categorías de manera consistente
    final sortedEntries = eventsByCategory.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value)); // Ordenar por cantidad, mayor primero
    
    // Crear la leyenda en un grid para móviles
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: sortedEntries.map((entry) {
        final category = entry.key;
        final count = entry.value;
        
        return Container(
          constraints: const BoxConstraints(minWidth: 110),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: categoryColors[category]?.withOpacity(0.3) ?? Colors.grey),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: categoryColors[category] ?? Colors.grey,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 5),
              Flexible(
                child: Text(
                  category.localizedName,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 3),
              Text(
                '$count',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
  
  // Método auxiliar para crear la leyenda en formato vertical (para web)
  Widget _buildLegendVertical(
    Map<EventCategory, int> eventsByCategory,
    Map<EventCategory, Color> categoryColors,
  ) {
    // Ordenar las categorías por cantidad (mayor primero)
    final sortedEntries = eventsByCategory.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: sortedEntries.map((entry) {
        final category = entry.key;
        final count = entry.value;
        
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Row(
            children: [
              // Círculo de color
              Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: categoryColors[category] ?? Colors.grey,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 12),
              
              // Nombre de categoría
              Expanded(
                child: Text(
                  category.localizedName,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              
              // Contador
              Text(
                '$count',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
