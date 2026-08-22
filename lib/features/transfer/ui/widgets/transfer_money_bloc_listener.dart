import 'package:eps_pay/core/functions/setup_auth_error_state.dart';
import 'package:eps_pay/core/helpers/extensions.dart';
import 'package:eps_pay/core/routing/routes.dart';
import 'package:eps_pay/core/theming/colors.dart';
import 'package:eps_pay/features/transfer/logic/cubit/transfer_cubit.dart';
import 'package:eps_pay/features/transfer/logic/cubit/transfer_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransferMoneyBlocListener extends StatelessWidget {
  const TransferMoneyBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<TransferCubit, TransferState>(
      listenWhen: (precious, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) {
                return Center(
                  child: CircularProgressIndicator(color: AppColors.secondary),
                );
              },
            );
          },
          success: (transferResponse) {
            context.pop();
            context.pushReplacementNamed(Routes.transferMoneyScreen);
          },
          error: (error) {
            setupErrorState(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
