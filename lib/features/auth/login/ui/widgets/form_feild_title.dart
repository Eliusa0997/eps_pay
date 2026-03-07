import 'package:eps_pay/core/theming/app_fonts.dart';
import 'package:flutter/widgets.dart';

class FormFeildTitle extends StatelessWidget {
  final String title;
  const FormFeildTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title, style: AppFonts.font14W600textPrimary);
  }
}
