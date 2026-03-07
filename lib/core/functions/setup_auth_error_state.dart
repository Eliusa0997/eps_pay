import 'package:eps_pay/core/helpers/extensions.dart';
import 'package:eps_pay/core/theming/colors.dart';
import 'package:flutter/material.dart';

void setupErrorState(BuildContext context, String error) {
  context.pop();
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        icon: const Icon(Icons.error, color: AppColors.error, size: 32),
        content: Text(error),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text("Got it"),
          ),
        ],
      );
    },
  );
}
