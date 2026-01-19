import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

import 'package:sajilo_upachar_ai/features/diet/presentation/pages/diet_page.dart';
import 'package:sajilo_upachar_ai/features/chatbot/presentation/pages/chatbot_page.dart';
import 'package:sajilo_upachar_ai/features/auth/doctor_summary/presentation/pages/doctor_summary_page.dart';
import 'package:sajilo_upachar_ai/features/auth/dashboard/presentation/pages/features_screen.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: const [
            Icon(Icons.health_and_safety, color: Color(0xFF009688)),
            SizedBox(width: 8),
            Text(
              "Sajilo Upachar AI",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black87),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              // 🔹 WELCOME
              FadeInDown(
                child: const Text(
                  "Good Morning,",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
              FadeInDown(
                delay: const Duration(milliseconds: 100),
                child: const Text(
                  "How can we help?",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // 🔹 CATEGORY HEADER
              FadeInDown(
                delay: const Duration(milliseconds: 200),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Categories",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(onPressed: () {}, child: const Text("Show All")),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // 🔹 CATEGORY GRID
              FadeInUp(
                delay: const Duration(milliseconds: 300),
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.85,
                  children: [
                    _categoryCard("Diet", Icons.restaurant, () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const DietPage()),
                      );
                    }),
                    _categoryCard("Exercise", Icons.fitness_center, () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ExerciseScreen(),
                        ),
                      );
                    }),
                    _categoryCard("ChatBot", Icons.smart_toy, () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const ChatBotPage()),
                      );
                    }),
                    _categoryCard("Hospital", Icons.local_hospital, () {}),
                    _categoryCard("Emergency", Icons.emergency, () {}),
                    _categoryCard("Reports", Icons.description, () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const DoctorSummaryPage(),
                        ),
                      );
                    }),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // 🔹 TOP DOCTORS
              const Text(
                "Top Doctors",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 15),

              _doctorCard("Dr. Steave Smith", "General Physician", true),
              const SizedBox(height: 15),
              _doctorCard("Dr. Josepin Clara", "Cardiologist", false),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  // 🔹 CATEGORY CARD
  Widget _categoryCard(String title, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.teal),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 DOCTOR CARD
  Widget _doctorCard(String name, String role, bool isMale) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.08), blurRadius: 10),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: isMale ? Colors.blue.shade50 : Colors.pink.shade50,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.person,
              color: isMale ? Colors.blue : Colors.pink,
              size: 30,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  role,
                  style: const TextStyle(color: Colors.grey, fontSize: 13),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF009688),
              elevation: 0,
            ),
            child: const Text("Book"),
          ),
        ],
      ),
    );
  }
}
