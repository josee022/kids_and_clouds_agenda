import 'package:flutter/material.dart';

class EmptyStateMessage extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const EmptyStateMessage({
    super.key,
    this.title = 'No hay eventos para mostrar',
    this.subtitle = 'Prueba con otros filtros',
    this.icon = Icons.event_busy,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 64,
            color: Colors.grey,
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(fontSize: 18, color: Colors.grey),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: TextStyle(color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }
}
