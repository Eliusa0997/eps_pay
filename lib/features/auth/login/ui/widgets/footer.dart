import 'package:eps_pay/core/theming/colors.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return // Footer
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Text(
        'By logging in, you agree to our Terms & Conditions',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 12, color: AppColors.textTertiary),
      ),
    );
  }
}
