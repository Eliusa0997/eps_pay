import 'package:eps_pay/core/helpers/extensions.dart';
import 'package:eps_pay/core/routing/routes.dart';
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
                isAuth: false,
                onBackButtonPressed: () =>
                    context.pushNamed(Routes.billsBaymentsScreen),
                headerIcon: Icon(
                  Icons.wifi,
                  size: 100,
                  color: Color(0xFF8B5CF6),
                ),
                headerGradientColor: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 185, 170, 231),
                    Color(0xFF8B5CF6),
                  ],
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
