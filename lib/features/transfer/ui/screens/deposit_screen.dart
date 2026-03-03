import 'package:eps_pay/core/widgets/wellcome_card.dart';
import 'package:eps_pay/features/transfer/ui/widgets/deposit_form_button_section.dart';
import 'package:flutter/material.dart';

class DepositScreen extends StatelessWidget {
  const DepositScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header
              wellcomeCard(title: 'Deposit', subTitle: ''),

              // Form and button and bloc listner Section
              depositFormButtonSection(),
            ],
          ),
        ),
      ),
    );
  }
}
