import 'package:flutter/material.dart';

class FoodItem {
  final String imagePath;
  final String foodName;
  final String price;
  final int amount;

  const FoodItem({
    required this.imagePath,
    required this.foodName,
    required this.price,
    required this.amount,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FoodItem && runtimeType == other.runtimeType && foodName == other.foodName;

  @override
  int get hashCode => foodName.hashCode;
}

class FoodItemWidget extends StatelessWidget {
  final FoodItem item;
  final bool isSelected;
  final Function(FoodItem) onSelect;
  final Function(FoodItem) onEdit; // Callback untuk Edit
  final Function(FoodItem) onDelete; // Callback untuk Hapus

  const FoodItemWidget({
    required this.item,
    required this.isSelected,
    required this.onSelect,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Image.asset(
            item.imagePath,
            height: 100,
            width: 100,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.foodName,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  item.price,
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.edit, color: Colors.blue),
                onPressed: () {
                  onEdit(item); // Memanggil callback Edit
                },
              ),
              IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  onDelete(item); // Memanggil callback Hapus
                },
              ),
            ],
          ),
          Checkbox(
            value: isSelected,
            onChanged: (bool? value) {
              onSelect(item);
            },
          ),
        ],
      ),
    );
  }
}
