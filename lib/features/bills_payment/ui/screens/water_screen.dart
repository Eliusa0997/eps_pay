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
              // Header title and discrption Section
              wellcomeCard(
                title: ' Water',
                subTitle: 'Quickly pay your water bill and securely',
                isAuth: false,
                headerIcon: Icon(
                  Icons.water_drop,
                  size: 100,
                  color: Color(0xFF3B82F6),
                ),
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
