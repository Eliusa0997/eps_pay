import 'package:easy_localization/easy_localization.dart';
import 'package:eps_pay/core/theming/colors.dart';
import 'package:flutter/material.dart';

class LableText extends StatelessWidget {
  final String receiverName;
  final String transactionType;
  const LableText({
    super.key,
    required this.receiverName,
    required this.transactionType,
  });

  @override
  Widget build(BuildContext context) {
    return _buildTransactionRecevierName(
      receiverName.toString(),
      transactionType,
    );
  }

  Widget _buildTransactionRecevierName(
    String receiverName,
    String transactionType,
  ) {
    if (transactionType == "deposit") {
      return Text(
        "Income".tr(),
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
      );
    }
    if (transactionType != "deposit" && transactionType != "transfer") {
      return Text(
        transactionType.tr(),
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
      );
    } else {
      return Text(
        receiverName,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
      );
    }
  }
}
