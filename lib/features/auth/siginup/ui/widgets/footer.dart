import 'package:eps_pay/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return // Footer
    Padding(
      padding: EdgeInsets.only(top: 24.h),
      child: Text(
        'By logging in, you agree to our Terms & Conditions',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 10.sp, color: AppColors.textTertiary),
      ),
    );
  }
}
