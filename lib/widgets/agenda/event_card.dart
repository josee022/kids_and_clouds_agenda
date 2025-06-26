import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../models/child.dart';
import '../../models/event.dart';
import '../../utils/string_extensions.dart';
import '../../theme/app_theme.dart';

class EventCard extends StatelessWidget {
  final Event event;
  final Child child;

  const EventCard({
    super.key,
    required this.event,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    // Obtener el color para esta categoría de evento
    final categoryColor = AppTheme.getCategoryColor(event.category.toString().split('.').last);
    
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      // Añadir un borde sutil con el color de la categoría
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          // Franja de color en la parte superior según la categoría
          Container(
            height: 6,
            color: categoryColor,
            width: double.infinity,
          ),
          ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: ClipOval(
          child: CachedNetworkImage(
            imageUrl: child.photoUrl,
            width: 40,
            height: 40,
            fit: BoxFit.cover,
            placeholder: (context, url) => CircleAvatar(
              backgroundColor: categoryColor.withOpacity(0.2),
              child: SizedBox(
                width: 20, height: 20, 
                child: CircularProgressIndicator(
                  strokeWidth: 2, 
                  color: categoryColor,
                ),
              ),
            ),
            errorWidget: (context, url, error) => CircleAvatar(
              backgroundColor: categoryColor.withOpacity(0.2),
              child: Icon(Icons.person, color: categoryColor),
            ),
          ),
        ),
        title: Text(
          child.name,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
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
                  color: categoryColor,
                ),
                const SizedBox(width: 4),
                Text(
                  event.category.localizedName,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: categoryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              event.description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: categoryColor.withOpacity(0.15),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            event.time.formatTime(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: categoryColor,
            ),
          ),
        ),
          ),
        ],
      ),
    )
    .animate()
    .fadeIn(duration: const Duration(milliseconds: 400))
    .slideY(begin: 0.1, end: 0, duration: const Duration(milliseconds: 400))
    .scale(begin: const Offset(0.95, 0.95), duration: const Duration(milliseconds: 400));
  }
}
