import 'package:flutter/material.dart';
import '../models/item_model.dart';

class ExpandableCard extends StatelessWidget {
  final ItemModel item;
  final bool isExpanded;
  final VoidCallback onTap;
  final VoidCallback onToggle;

  const ExpandableCard({
    required this.item,
    required this.isExpanded,
    required this.onTap,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 8),
          ],
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Title + Icon
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                ),
              ],
            ),

            // 🔹 Expanded Content
            if (isExpanded) ...[
              SizedBox(height: 12),

              Text(
                item.description,
                style: TextStyle(color: Colors.grey[700]),
              ),

              SizedBox(height: 10),

              Text(
                "Status: ${item.isActive ? "Active" : "Inactive"}",
                style: TextStyle(
                  color:
                      item.isActive ? Colors.green : Colors.red,
                  fontWeight: FontWeight.w500,
                ),
              ),

              SizedBox(height: 12),

              ElevatedButton(
                onPressed: onToggle,
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      item.isActive ? Colors.red : Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  item.isActive
                      ? "Mark as Inactive"
                      : "Mark as Active",
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}