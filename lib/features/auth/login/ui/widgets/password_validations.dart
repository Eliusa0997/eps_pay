import 'package:eps_pay/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLength;
  const PasswordValidations({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialCharacters,
    required this.hasNumber,
    required this.hasMinLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buidValidationRow('At least 1 lowercase', hasLowerCase),
        buidValidationRow('At least 1 uppercase', hasUpperCase),
        buidValidationRow('At least 1 special character', hasSpecialCharacters),
        buidValidationRow('At least 1 number', hasNumber),
        buidValidationRow('At least 8 letter length', hasMinLength),
      ],
    );
  }

  Widget buidValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        CircleAvatar(radius: 2.5, backgroundColor: AppColors.success),
        SizedBox(width: 5),
        Text(
          text,
          style: TextStyle(
            color: hasValidated ? AppColors.secondary : AppColors.textSecondary,
            decoration: hasValidated
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
        ),
      ],
    );
  }
}
