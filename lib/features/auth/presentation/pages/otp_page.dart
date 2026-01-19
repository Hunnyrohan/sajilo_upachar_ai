import 'package:flutter/material.dart';
import 'package:sajilo_upachar_ai/features/auth/ai_call/presentation/widgets/auth_widgets.dart';
import '../widgets/auth_background.dart';
import '../../dashboard/presentation/pages/dashboard_page.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 30),
                const Icon(Icons.lock_outline,
                    size: 80, color: Colors.teal),
                const SizedBox(height: 10),
                const Text(
                  "OTP Verification",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Enter the 6-digit code sent to your email or phone",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),

                AuthCard(
                  child: Column(
                    children: [
                      _otpField(),

                      const SizedBox(height: 20),
                      primaryButton("Verify OTP"),

                      const SizedBox(height: 15),
                      TextButton(
                        onPressed: () {},
                        child: const Text("Resend OTP"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _otpField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        6,
        (_) => SizedBox(
          width: 45,
          child: TextField(
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            maxLength: 1,
            decoration: const InputDecoration(
              counterText: "",
            ),
          ),
        ),
      ),
    );
  }
}
