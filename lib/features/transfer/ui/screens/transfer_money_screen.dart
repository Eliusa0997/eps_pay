import 'package:eps_pay/core/theming/colors.dart';
import 'package:eps_pay/features/transfer/ui/widgets/account_number_phone_number.dart';
import 'package:eps_pay/features/transfer/ui/widgets/amount_and_note_section.dart';
import 'package:eps_pay/features/transfer/ui/widgets/header.dart';
import 'package:flutter/material.dart';

class TransferMoneyScreen extends StatelessWidget {
  const TransferMoneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Header(),
            // Account number and phone number
            AccountNumberPhoneNumber(),

            // Amount and Notes Section
            AmountAndNoteSection(),
          ],
        ),
      ),
    );
  }
}
