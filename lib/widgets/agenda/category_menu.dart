import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../models/event.dart';
import '../../utils/string_extensions.dart';
import '../../theme/app_theme.dart';

class CategoryMenu extends StatelessWidget {
  final EventCategory? selectedCategory;
  final Function(EventCategory?) onCategorySelected;

  CategoryMenu({
    super.key,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final isDesktopOrWeb = kIsWeb || MediaQuery.of(context).size.width >= 600;

    return Container(
      height: 70,
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: isDesktopOrWeb
          ? Scrollbar(
              controller: _scrollController,
              thumbVisibility: true,
              child: _buildScrollableRow(context),
            )
          : _buildScrollableRow(context),
    );
  }

  Widget _buildScrollableRow(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildCategoryChip(null, context),
          ...EventCategory.values.map((category) =>
              _buildCategoryChip(category, context)).toList(),
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

    final categoryColor = category == null
        ? AppTheme.primaryPurple
        : AppTheme.getCategoryColor(category.toString().split('.').last);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: FilterChip(
        selected: isSelected,
        showCheckmark: false,
        backgroundColor: Colors.white,
        selectedColor: categoryColor.withOpacity(0.15),
        elevation: isSelected ? 3 : 1,
        pressElevation: 4,
        shadowColor:
            isSelected ? categoryColor.withOpacity(0.4) : Colors.transparent,
        shape: StadiumBorder(
          side: BorderSide(
            color: isSelected ? categoryColor : Colors.grey.withOpacity(0.3),
            width: isSelected ? 1.5 : 0.5,
          ),
        ),
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 20,
              color: isSelected ? categoryColor : Colors.grey.shade600,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontWeight:
                    isSelected ? FontWeight.bold : FontWeight.normal,
                fontSize: 14,
                color: isSelected ? categoryColor : Colors.grey.shade700,
              ),
            ),
          ],
        ),
        onSelected: (_) => onCategorySelected(category),
      ),
    )
        .animate()
        .fadeIn(duration: const Duration(milliseconds: 250))
        .scale(
          delay: Duration(
              milliseconds: category == null ? 0 : category.index * 50),
          duration: const Duration(milliseconds: 150),
        );
  }
}
