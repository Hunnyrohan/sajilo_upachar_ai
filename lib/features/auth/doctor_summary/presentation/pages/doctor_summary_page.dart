import 'package:flutter/material.dart';

class DoctorSummaryPage extends StatelessWidget {
  const DoctorSummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doctor Summary'),
        backgroundColor: Colors.teal,
      ),
      body: const Center(
        child: Text('Doctor Summary Page - Coming Soon'),
      ),
    );
  }
}