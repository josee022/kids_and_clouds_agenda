import 'package:flutter/material.dart';
import '../../models/event.dart';
import '../../utils/string_extensions.dart';

class CategoryMenu extends StatelessWidget {
  final EventCategory? selectedCategory;
  final Function(EventCategory?) onCategorySelected;

  const CategoryMenu({
    super.key,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildCategoryChip(null, context),
          ...EventCategory.values.map((category) => 
            _buildCategoryChip(category, context)
          ).toList(),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(EventCategory? category, BuildContext context) {
    final isSelected = category == selectedCategory;
    final label = category == null 
      ? 'Todas las categorías' 
      : category.localizedName;
    final icon = category?.icon ?? Icons.category;
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: FilterChip(
        selected: isSelected,
        showCheckmark: false,
        backgroundColor: Colors.white,
        selectedColor: Theme.of(context).primaryColor.withOpacity(0.2),
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 16,
              color: isSelected 
                ? Theme.of(context).primaryColor
                : Colors.grey.shade700,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected 
                  ? Theme.of(context).primaryColor
                  : Colors.grey.shade700,
              ),
            ),
          ],
        ),
        onSelected: (_) => onCategorySelected(category),
      ),
    );
  }
}
