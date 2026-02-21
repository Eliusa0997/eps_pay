// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:eps_pay/core/theming/colors.dart';

class AppFormField extends StatelessWidget {
  final TextEditingController controller;
  bool isObscurePin = false;
  final TextInputType textInputType;
  int? maxLength;
  final String hintText;
  final Widget prefixIcon;
  final Widget? suffixIcon;
  AppFormField({
    super.key,
    required this.controller,
    required this.isObscurePin,
    required this.textInputType,
    this.maxLength,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isObscurePin,
      keyboardType: textInputType,
      maxLength: maxLength ?? 14,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: AppColors.background,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        counterText: '',
      ),
    );
  }
}
