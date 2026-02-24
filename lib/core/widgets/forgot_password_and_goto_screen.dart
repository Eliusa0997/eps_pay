import 'package:eps_pay/core/routing/routes.dart';
import 'package:eps_pay/core/theming/app_fonts.dart';
import 'package:eps_pay/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPassordAndGoToSomeScreen extends StatelessWidget {
  void Function()? goToScreen;
  final String text;
  ForgetPassordAndGoToSomeScreen({
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
          child: Text(text, style: AppFonts.font13W600Primary),
        ),

        TextButton(
          onPressed: () {
            //  Navigator.pushNamed(context, Routes.signupScreen);
          },
          child: Text('Forgot Password?', style: AppFonts.font13W600Primary),
        ),
      ],
    );
  }
}
