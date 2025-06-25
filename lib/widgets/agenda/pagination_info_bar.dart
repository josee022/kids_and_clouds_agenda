import 'package:flutter/material.dart';

class PaginationInfoBar extends StatelessWidget {
  final int totalEvents;
  final int startIndex;
  final int endIndex;

  const PaginationInfoBar({
    super.key,
    required this.totalEvents,
    required this.startIndex,
    required this.endIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$totalEvents ${totalEvents == 1 ? "evento" : "eventos"}',
            style: TextStyle(color: Colors.grey.shade600),
          ),
          if (totalEvents > 0)
            Text(
              'Mostrando ${startIndex + 1}-$endIndex de $totalEvents',
              style: TextStyle(color: Colors.grey.shade600),
            ),
        ],
      ),
    );
  }
}
