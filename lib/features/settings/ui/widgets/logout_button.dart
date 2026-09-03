import 'package:easy_localization/easy_localization.dart';
import 'package:eps_pay/core/helpers/extensions.dart';
import 'package:eps_pay/core/routing/routes.dart';
import 'package:eps_pay/core/theming/colors.dart';
import 'package:flutter/material.dart';

class LogoutButtonSection extends StatelessWidget {
  const LogoutButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushReplacementNamed(Routes.loginScreen);
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.myRed, width: 2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.logout, color: AppColors.myRed, size: 20),
            SizedBox(width: 12),
            Text(
              'Logout'.tr(),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.myRed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
