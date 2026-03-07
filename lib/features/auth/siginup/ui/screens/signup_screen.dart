import 'package:eps_pay/core/widgets/wellcome_card.dart';
import 'package:eps_pay/features/auth/siginup/ui/widgets/footer.dart';
import 'package:eps_pay/features/auth/siginup/ui/widgets/signup_section.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header Section
              wellcomeCard(
                title: 'Get Started',
                subTitle:
                    'Create your account to start sending\n and receiving money',
              ),
              // Signup Section
              const SignupSection(),
              // Footer Terms & Conditions
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
