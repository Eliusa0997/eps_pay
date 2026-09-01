import 'package:easy_localization/easy_localization.dart';
import 'package:eps_pay/core/theming/colors.dart';
import 'package:flutter/material.dart';

class SettingsTitelSection extends StatelessWidget {
  final String title;
  const SettingsTitelSection({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Text(
        title.tr(),
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.textSecondary,
        ),
      ),
    );
  }
}
