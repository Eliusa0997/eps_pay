import 'package:eps_pay/core/widgets/wellcome_card.dart';
import 'package:eps_pay/features/bills_payment/ui/widgets/mobile_recharge_form_button_section.dart';
import 'package:flutter/material.dart';

class MobileRechargeScreen extends StatelessWidget {
  const MobileRechargeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header
              wellcomeCard(
                title: 'Mobile Recharge',
                subTitle: 'Mobile Recharge Payment Section',
                headerIcon: Icons.smartphone,
                headerGradientColor: LinearGradient(
                  colors: [Color(0xFF34D399), Color(0xFF10B981)],
                ),
              ),
              // Form and button and bloc listner Section
              MobileRechargeFormButtonSection(),
            ],
          ),
        ),
      ),
    );
  }
}
