import 'package:eps_pay/features/auth/login/ui/widgets/biometric_login.dart';
import 'package:eps_pay/features/auth/login/ui/widgets/footer.dart';
import 'package:eps_pay/features/auth/login/ui/widgets/login_section.dart';
import 'package:eps_pay/features/auth/login/ui/widgets/wellcome_back_card.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header
              const WellcomeBackCard(),

              // Login Section
              LoginSection(),

              // Biometric Login
              const BiometricLogin(),

              const SizedBox(height: 32),

              // Footer
              const Footer(),

              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
