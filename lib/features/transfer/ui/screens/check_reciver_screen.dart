import 'package:eps_pay/features/auth/login/ui/widgets/biometric_login.dart';
import 'package:eps_pay/features/auth/login/ui/widgets/login_section.dart';
import 'package:eps_pay/core/widgets/wellcome_card.dart';
import 'package:eps_pay/features/transfer/ui/widgets/check_reciver_form_botton_section.dart';
import 'package:flutter/material.dart';

class CheckReciverScreen extends StatelessWidget {
  const CheckReciverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header
              wellcomeCard(
                title: 'Welcome Back',
                subTitle: 'Login to access your account',
              ),
              // Login Section
              FormButtnSection(),
              // Biometric Login
            ],
          ),
        ),
      ),
    );
  }
}
