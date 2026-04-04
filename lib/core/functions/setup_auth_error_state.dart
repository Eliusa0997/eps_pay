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
        icon: const Icon(Icons.error, color: AppColors.error, size: 32),
        content: Text(apiErrorModel.detail.toString()),
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
