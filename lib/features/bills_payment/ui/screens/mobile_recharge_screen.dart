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
              // Header title and discrption Section
              wellcomeCard(
                title: 'Mobile Recharge',
                subTitle: 'Recharge your Mobile bill quickly and securely',
                isAuth: false,
                headerIcon: Icon(
                  Icons.smartphone,
                  size: 100,
                  color: Color(0xFF10B981),
                ),
                headerGradientColor: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 74, 200, 154),
                    Color(0xFF10B981),
                  ],
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
