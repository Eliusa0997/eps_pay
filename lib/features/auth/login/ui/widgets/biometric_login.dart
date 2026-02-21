import 'package:eps_pay/core/routing/routes.dart';
import 'package:eps_pay/core/theming/colors.dart';
import 'package:flutter/material.dart';

class BiometricLogin extends StatelessWidget {
  const BiometricLogin({super.key});

  @override
  Widget build(BuildContext context) {
    void _handleBiometricLogin() {
      Navigator.pushReplacementNamed(context, Routes.homeDashboard);
    }

    return Column(
      children: [
        const Text(
          'Or login with',
          style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
        ),
        const SizedBox(height: 16),
        InkWell(
          onTap: _handleBiometricLogin,
          borderRadius: BorderRadius.circular(32),
          child: Container(
            width: 64,
            height: 64,
            decoration: const BoxDecoration(
              gradient: AppColors.primaryGradient,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Color(0x400A5F7D),
                  blurRadius: 16,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: const Icon(Icons.fingerprint, size: 32, color: Colors.white),
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Fingerprint / Face ID',
          style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
        ),
      ],
    );
  }
}
