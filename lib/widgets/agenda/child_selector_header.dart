import 'package:flutter/material.dart';
import '../../models/child.dart';
import '../../services/mock_data_service.dart';

class ChildSelectorHeader extends StatelessWidget {
  final String? selectedChildId;
  final Function(String?) onChildSelected;

  const ChildSelectorHeader({
    super.key,
    required this.selectedChildId,
    required this.onChildSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: const NetworkImage('https://robohash.org/luislopez123?set=set4&size=150x150'),
          ),
          const SizedBox(width: 12),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Bienvenido/a',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              Text(
                'Luis López',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Spacer(),
          _buildChildSelector(),
        ],
      ),
    );
  }

  Widget _buildChildSelector() {
    return DropdownButton<String>(
      hint: const Text('Seleccionar hijo'),
      value: selectedChildId,
      onChanged: onChildSelected,
      items: [
        const DropdownMenuItem<String>(
          value: null,
          child: Text('Todos los niños'),
        ),
        ...MockDataService.children.map((Child child) {
          return DropdownMenuItem<String>(
            value: child.id,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 12,
                  backgroundImage: NetworkImage(child.photoUrl),
                ),
                const SizedBox(width: 8),
                Text(child.name),
              ],
            ),
          );
        }).toList(),
      ],
    );
  }
}
