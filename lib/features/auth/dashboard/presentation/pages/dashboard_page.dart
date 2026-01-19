import 'package:flutter/material.dart';
import '../../../ai_call/presentation/pages/ai_call_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hello, Namaste 👋")),
      body: ListTile(
        leading: const Icon(Icons.health_and_safety),
        title: const Text("Talk to Sajilo Nurse AI"),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AICallPage()),
          );
        },
      ),
    );
  }
}
