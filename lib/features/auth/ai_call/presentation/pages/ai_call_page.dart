import 'package:flutter/material.dart';

class AICallPage extends StatelessWidget {
  const AICallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade50,
      appBar: AppBar(title: const Text("Sajilo Nurse AI")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 80,
            child: Icon(Icons.person, size: 100),
          ),
          const SizedBox(height: 20),
          const Text("AI is listening..."),
          const SizedBox(height: 30),
          FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.mic),
          ),
        ],
      ),
    );
  }
}
