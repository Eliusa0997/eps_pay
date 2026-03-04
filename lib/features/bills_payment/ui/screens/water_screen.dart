import 'package:eps_pay/core/widgets/wellcome_card.dart';
import 'package:eps_pay/features/bills_payment/ui/widgets/water_form_button_section.dart';
import 'package:flutter/material.dart';

class WaterScreen extends StatelessWidget {
  const WaterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header
              wellcomeCard(
                title: ' Water',
                subTitle: 'Water Payment Section',
                headerIcon: Icons.water_drop,
                headerGradientColor: LinearGradient(
                  colors: [Color(0xFF60A5FA), Color(0xFF3B82F6)],
                ),
              ),
              // Form and button and bloc listner Section
              WaterFormButtonSection(),
            ],
          ),
        ),
      ),
    );
  }
}
