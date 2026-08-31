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
              // Header title and discrption Section
              wellcomeCard(
                title: 'Electricity',
                subTitle: 'Pay your electricity bill quickly and securely',
                isAuth: false,
                headerIcon: Icon(
                  Icons.flash_on,
                  size: 100,
                  color: Color.fromARGB(255, 244, 201, 132),
                ),
                headerGradientColor: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 132, 117, 78),
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
