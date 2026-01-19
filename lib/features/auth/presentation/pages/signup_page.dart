import 'package:flutter/material.dart';
import 'package:sajilo_upachar_ai/features/auth/ai_call/presentation/widgets/auth_widgets.dart';
import '../widgets/auth_background.dart';
import 'otp_page.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Icon(
                  Icons.health_and_safety,
                  size: 80,
                  color: Colors.teal,
                ),
                const SizedBox(height: 10),
                const Text(
                  "सजिलो उपचार AI",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
                const Text("Your Health Assistant"),
                const SizedBox(height: 30),

                AuthCard(
                  child: Column(
                    children: [
                      const Text(
                        "Create Account",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 20),

                      inputField(Icons.person, "Full Name"),
                      const SizedBox(height: 12),
                      inputField(Icons.email, "Email"),
                      const SizedBox(height: 12),
                      inputField(Icons.lock, "Password", obscureText: true),

                      const SizedBox(height: 20),

                      // 🔐 SIGN UP → OTP
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const OtpPage()),
                          );
                        },
                        child: primaryButton("Sign Up"),
                      ),

                      const SizedBox(height: 15),
                      const Text("Or sign up with"),
                      const SizedBox(height: 10),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          socialIcon(Icons.g_mobiledata),
                          const SizedBox(width: 20),
                          socialIcon(Icons.facebook),
                        ],
                      ),

                      const SizedBox(height: 15),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Already have an account? Login"),
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
}
