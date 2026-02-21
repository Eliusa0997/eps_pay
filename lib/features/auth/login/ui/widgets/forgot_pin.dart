import 'package:eps_pay/core/theming/colors.dart';
import 'package:flutter/material.dart';

class ForgotPin extends StatelessWidget {
  const ForgotPin({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        child: const Text(
          'Forgot PIN?',
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
