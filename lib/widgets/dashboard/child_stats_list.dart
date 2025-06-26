import 'package:flutter/material.dart';
import '../../models/child.dart';
import '../../theme/app_theme.dart';

class ChildStatsList extends StatelessWidget {
  final List<Child> children;
  final Map<String, int> eventsByChild;

  const ChildStatsList({
    super.key, 
    required this.children,
    required this.eventsByChild,
  });

  @override
  Widget build(BuildContext context) {
    // Ordenar niños por cantidad de eventos (descendente)
    final sortedChildren = List<Child>.from(children);
    sortedChildren.sort((a, b) => 
      (eventsByChild[b.id] ?? 0).compareTo(eventsByChild[a.id] ?? 0));
    
    return Column(
      children: sortedChildren.map((child) {
        final eventCount = eventsByChild[child.id] ?? 0;
        final maxEvents = eventsByChild.values.fold(0, 
            (prev, curr) => prev > curr ? prev : curr);
        
        // Calcular el porcentaje para la barra de progreso
        final percentage = maxEvents > 0 ? eventCount / maxEvents : 0.0;
        
        // Obtener un color basado en el ID del niño
        final childColor = Color.fromARGB(
          255,
          100 + ((child.id.hashCode) % 155).abs(),
          100 + ((child.id.hashCode * 2) % 155).abs(),
          100 + ((child.id.hashCode * 3) % 155).abs(),
        );
          
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: childColor.withOpacity(0.15),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
            border: Border.all(color: childColor.withOpacity(0.1)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                // Avatar del niño con decoración
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: childColor, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: childColor.withOpacity(0.3),
                        blurRadius: 8,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 24,
                    backgroundImage: NetworkImage(
                      'https://robohash.org/${child.id}?set=set5&size=64x64',
                    ),
                    backgroundColor: Colors.grey[100],
                  ),
                ),
                const SizedBox(width: 16),
                
                // Información y barra de progreso
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Nombre y contador
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            child.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: childColor.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              '$eventCount eventos',
                              style: TextStyle(
                                color: childColor.withOpacity(0.8),
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      
                      // Barra de progreso con texto de porcentaje
                      Row(
                        children: [
                          Expanded(
                            flex: 5,
                            child: Stack(
                              children: [
                                // Barra de progreso
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: LinearProgressIndicator(
                                    value: percentage,
                                    backgroundColor: Colors.grey[100],
                                    valueColor: AlwaysStoppedAnimation<Color>(childColor),
                                    minHeight: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 12),
                          // Porcentaje
                          Text(
                            '${(percentage * 100).toInt()}%',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: childColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
