import 'package:eps_pay/core/widgets/wellcome_card.dart';
import 'package:eps_pay/features/bills_payment/ui/widgets/electricity_form_button_section.dart';
import 'package:flutter/material.dart';

class ElectricityScreen extends StatelessWidget {
  const ElectricityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header
              wellcomeCard(
                title: 'Electricity',
                subTitle: 'Electricity Payment Section',
                headerIcon: Icons.flash_on,
                headerGradientColor: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 168, 149, 101),
                    Color.fromARGB(255, 244, 201, 132),
                  ],
                ),
              ),

              // Form and button and bloc listner Section
              ElectricityFormButtonSection(),
            ],
          ),
        ),
      ),
    );
  }
}
