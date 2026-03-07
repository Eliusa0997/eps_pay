import 'package:eps_pay/features/auth/login/ui/widgets/biometric_login.dart';
import 'package:eps_pay/features/auth/login/ui/widgets/login_section.dart';
import 'package:eps_pay/core/widgets/wellcome_card.dart';
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
              // Header Section
              wellcomeCard(
                title: 'Welcome Back 👋',
                subTitle: 'Securely sign in to your EpsPay account',
              ),
              // Login Section
              LoginSection(),
              // Biometric Login Section
              const BiometricLogin(),
            ],
          ),
        ),
      ),
    );
  }
}
