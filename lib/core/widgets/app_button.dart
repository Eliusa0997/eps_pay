import 'package:eps_pay/core/theming/colors.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  double? width = double.infinity;
  double? height;
  void Function() onPressed;
  final String buttonText;
  TextStyle? textStyle;

  AppButton({
    super.key,
    this.width,
    this.height,
    required this.onPressed,
    required this.buttonText,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          elevation: 4,
          shadowColor: AppColors.primary.withOpacity(0.3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          buttonText,
          style:
              textStyle ?? TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
