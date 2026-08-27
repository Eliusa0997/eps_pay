import 'package:eps_pay/core/widgets/wellcome_card.dart';
import 'package:eps_pay/features/transfer/ui/widgets/check_reciver_bloc_listener.dart';
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
                title: 'Transfer Money',
                subTitle: 'Do your transformation Securely',
              ),
              // Check reciver form Section
              FormButtnSection(),
              // Biometric Login
            ],
          ),
        ),
      ),
    );
  }
}
