import 'package:eps_pay/core/routing/routes.dart';
import 'package:eps_pay/core/theming/colors.dart';
import 'package:flutter/material.dart';

class forgetPassordAndGoToSomeScreen extends StatelessWidget {
  void Function()? goToScreen;
  final String text;
  forgetPassordAndGoToSomeScreen({
    super.key,
    required this.text,
    this.goToScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: goToScreen,
          child: Text(
            text,
            style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        TextButton(
          onPressed: () {
            //  Navigator.pushNamed(context, Routes.signupScreen);
          },
          child: const Text(
            'Forgot Password?',
            style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
