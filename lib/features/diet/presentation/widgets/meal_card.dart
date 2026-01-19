import 'package:flutter/material.dart';

class MealCard extends StatelessWidget {
  final String mealTime;
  final String food;

  const MealCard({
    super.key,
    required this.mealTime,
    required this.food,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.teal.withOpacity(0.1),
          child: const Icon(Icons.restaurant, color: Colors.teal),
        ),
        title: Text(mealTime),
        subtitle: Text(food),
      ),
    );
  }
}
