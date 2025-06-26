import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../models/child.dart';
import '../../services/mock_data_service.dart';
import '../../theme/app_theme.dart';

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
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        color: AppTheme.primaryBlue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          ClipOval(
            child: CachedNetworkImage(
              imageUrl: 'https://robohash.org/luislopez123?set=set4&size=150x150',
              width: 48,
              height: 48,
              fit: BoxFit.cover,
              placeholder: (context, url) => CircleAvatar(
                radius: 24,
                backgroundColor: AppTheme.primaryTeal.withOpacity(0.2),
                child: SizedBox(
                  width: 24, height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: AppTheme.primaryTeal,
                  ),
                ),
              ),
              errorWidget: (context, url, error) => CircleAvatar(
                radius: 24,
                backgroundColor: AppTheme.primaryTeal.withOpacity(0.2),
                child: Icon(Icons.person, color: AppTheme.primaryTeal),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Bienvenido/a',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppTheme.primaryBlue,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'Luis López',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textPrimary,
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
      hint: Text(
        'Seleccionar hijo',
        style: TextStyle(color: AppTheme.primaryPurple),
      ),
      value: selectedChildId,
      onChanged: onChildSelected,
      icon: Icon(Icons.arrow_drop_down, color: AppTheme.primaryPurple),
      underline: Container(
        height: 2,
        color: AppTheme.primaryPurple.withOpacity(0.5),
      ),
      items: [
        const DropdownMenuItem<String>(
          value: null,
          child: Text('Todos los niños'),
        ),
        ...MockDataService.children.map((Child child) {
          return DropdownMenuItem<String>(
            value: child.id,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: child.photoUrl,
                    width: 28,
                    height: 28,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => CircleAvatar(
                      radius: 14,
                      backgroundColor: AppTheme.accentYellow.withOpacity(0.2),
                      child: SizedBox(
                        width: 14, height: 14,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: AppTheme.accentYellow,
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => CircleAvatar(
                      radius: 14,
                      backgroundColor: AppTheme.accentYellow.withOpacity(0.2),
                      child: Icon(Icons.face, size: 14, color: AppTheme.accentYellow),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  child.name,
                  style: TextStyle(
                    color: AppTheme.textPrimary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ],
    );
  }
}
