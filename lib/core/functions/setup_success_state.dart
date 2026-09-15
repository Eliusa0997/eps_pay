import 'package:eps_pay/core/helpers/extensions.dart';
import 'package:eps_pay/core/theming/colors.dart';
import 'package:flutter/material.dart';

void setupSuccessState(BuildContext context, String message, var onPressed) {
  context.pop();

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: [
            Icon(Icons.check, color: AppColors.success, size: 26),
            const SizedBox(width: 5),
            Text(
              'Success',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        content: Text(
          message,
          style: const TextStyle(fontSize: 15, height: 1.4),
        ),
        actions: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.success,
                foregroundColor: Colors.white,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Ok'),
            ),
          ),
        ],
      );
    },
  );
}
