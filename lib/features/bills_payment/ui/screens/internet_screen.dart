import 'package:eps_pay/core/widgets/wellcome_card.dart';
import 'package:eps_pay/features/bills_payment/ui/widgets/internet_form_button_section.dart';
import 'package:flutter/material.dart';

class InternetScreen extends StatelessWidget {
  const InternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header title and discrption Section
              wellcomeCard(
                title: ' Internet',
                subTitle: 'Pay your internet bill quickly and securely',
                headerIcon: Icons.wifi,
                headerGradientColor: LinearGradient(
                  colors: [Color(0xFFA78BFA), Color(0xFF8B5CF6)],
                ),
              ),
              // Form and button and bloc listner Section
              InternetFormButtonSection(),
            ],
          ),
        ),
      ),
    );
  }
}
