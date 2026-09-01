import 'package:eps_pay/core/theming/colors.dart';
import 'package:flutter/material.dart';

class AppVersionSection extends StatelessWidget {
  const AppVersionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            'EpsPay App Version 1.1.0',
            style: TextStyle(fontSize: 12, color: AppColors.textTertiary),
          ),
          SizedBox(height: 4),
          Text(
            '© 2026 EpsPay. All rights reserved.',
            style: TextStyle(fontSize: 11, color: AppColors.textTertiary),
          ),
        ],
      ),
    );
  }
}
