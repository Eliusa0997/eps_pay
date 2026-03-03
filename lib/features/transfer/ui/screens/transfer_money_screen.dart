import 'package:eps_pay/core/theming/colors.dart';
import 'package:eps_pay/features/transfer/data/model/reciver_response.dart';
import 'package:eps_pay/features/transfer/data/model/transfer_request_body.dart';
import 'package:eps_pay/features/transfer/logic/cubit/transfer_cubit.dart';
import 'package:eps_pay/features/transfer/ui/widgets/account_number_phone_number.dart';
import 'package:eps_pay/features/transfer/ui/widgets/amount_and_note_section.dart';
import 'package:eps_pay/features/transfer/ui/widgets/header.dart';
import 'package:eps_pay/features/transfer/ui/widgets/reciver_name_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransferMoneyScreen extends StatelessWidget {
  final ReciverResponse receiver;
  TransferMoneyScreen({super.key, required this.receiver});

  @override
  Widget build(BuildContext context) {
    final transferCubit = context.read<TransferCubit>();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header Section
            Header(),
            // Reciver Name Section
            ReciverNameSection(reciverName: receiver.reciverName.toString()),
            // Account number and phone number Section
            AccountNumberPhoneNumber(
              accountNumberController: transferCubit.accountNumberController,
              phoneNumberController: transferCubit.phoneNumberController,
            ),

            // Amount and Notes Section
            AmountAndNoteSection(
              amountController: transferCubit.amountController,
              noteNumberController: transferCubit.noteController,
              transfer: () {
                transferCubit.emitTransferState(
                  TransferRequestBody(
                    accountNumber: transferCubit.accountNumberController.text,
                    amount: transferCubit.amountController.text,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
