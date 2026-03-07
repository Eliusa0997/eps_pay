import 'package:eps_pay/core/widgets/wellcome_card.dart';
import 'package:eps_pay/features/transfer/ui/widgets/withdraw_form_button_section.dart';
import 'package:flutter/material.dart';

class WithdrawScreen extends StatelessWidget {
  const WithdrawScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header
              wellcomeCard(title: 'Withdraw', subTitle: ''),
              // Form and button and bloc listner Section
              WithdrawFormButtonSection(),
            ],
          ),
        ),
      ),
    );
  }
}
