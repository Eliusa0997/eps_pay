import 'package:eps_pay/core/helpers/extensions.dart';
import 'package:eps_pay/core/networking/api_error_model.dart';
import 'package:eps_pay/core/theming/colors.dart';
import 'package:flutter/material.dart';

void setupErrorState(BuildContext context, ApiErrorModel apiErrorModel) {
  context.pop();

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: [
            Icon(Icons.error_outline, color: AppColors.myRed, size: 26),
            const SizedBox(width: 5),
            const Text(
              'Sorry',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        content: Text(
          apiErrorModel.detail.toString(),
          style: const TextStyle(fontSize: 15, height: 1.4),
        ),
        actions: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => context.pop(),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.myRed,
                foregroundColor: Colors.white,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Got it'),
            ),
          ),
        ],
      );
    },
  );
}
