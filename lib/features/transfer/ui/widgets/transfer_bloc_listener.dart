import 'package:eps_pay/core/helpers/extensions.dart';
import 'package:eps_pay/core/routing/routes.dart';
import 'package:eps_pay/core/theming/app_fonts.dart';
import 'package:eps_pay/core/theming/colors.dart';
import 'package:eps_pay/features/transfer/logic/cubit/transfer_cubit.dart';
import 'package:eps_pay/features/transfer/logic/cubit/transfer_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransferBlocListener extends StatelessWidget {
  const TransferBlocListener({super.key});

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
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  icon: const Icon(
                    Icons.error,
                    color: AppColors.error,
                    size: 32,
                  ),
                  content: Text(
                    'Transfer Done Successfully',
                    style: AppFonts.font14W600textPrimary,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        context.pop();
                        context.pushNamed(Routes.homeDashboard);
                      },
                      child: Text("ok"),
                    ),
                  ],
                );
              },
            );
          },
          error: (error) {
            // (context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
