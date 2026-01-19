import 'package:flutter/material.dart';
import '../widgets/diet_category_card.dart';
import '../widgets/meal_card.dart';

class DietPage extends StatelessWidget {
  const DietPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          "Diet & Nutrition",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Choose Your Goal",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            Row(
              children: const [
                Expanded(
                  child: DietCategoryCard(
                    title: "Weight Loss",
                    icon: Icons.trending_down,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: DietCategoryCard(
                    title: "Muscle Gain",
                    icon: Icons.fitness_center,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Row(
              children: const [
                Expanded(
                  child: DietCategoryCard(
                    title: "Diabetes",
                    icon: Icons.bloodtype,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: DietCategoryCard(
                    title: "Heart Care",
                    icon: Icons.favorite,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            const Text(
              "Today's Meal Plan",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            const MealCard(
              mealTime: "Breakfast",
              food: "Oats, Fruits & Green Tea",
            ),
            const MealCard(
              mealTime: "Lunch",
              food: "Rice, Dal, Vegetables & Salad",
            ),
            const MealCard(
              mealTime: "Dinner",
              food: "Chapati, Vegetables & Soup",
            ),

            const SizedBox(height: 30),

            const Text(
              "Healthy Tips",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "• Drink plenty of water\n"
              "• Eat fresh vegetables\n"
              "• Avoid junk food\n"
              "• Maintain balanced meals",
              style: TextStyle(color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
