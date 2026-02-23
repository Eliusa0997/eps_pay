import 'package:eps_pay/features/auth/login/ui/widgets/footer.dart';
import 'package:eps_pay/features/auth/login/ui/widgets/login_section.dart';
import 'package:eps_pay/core/widgets/wellcome_card.dart';
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
              // Header
              wellcomeCard(title: 'Wellcome', subTitle: 'Create new account'),

              // Login Section
              signupSection(),

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
