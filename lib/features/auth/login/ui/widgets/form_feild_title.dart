import 'package:eps_pay/core/theming/colors.dart';
import 'package:flutter/widgets.dart';

class FormFeildTitle extends StatelessWidget {
  final String title;
  const FormFeildTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      ),
    );
  }
}
