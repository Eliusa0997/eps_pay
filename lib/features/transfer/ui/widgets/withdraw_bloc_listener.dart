import 'package:eps_pay/core/helpers/extensions.dart';
import 'package:eps_pay/core/routing/routes.dart';
import 'package:eps_pay/core/theming/app_fonts.dart';
import 'package:eps_pay/core/theming/colors.dart';
import 'package:eps_pay/features/transfer/logic/cubit/withdraw_cubit.dart';
import 'package:eps_pay/features/transfer/logic/cubit/withdraw_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WithdrawBlocListener extends StatelessWidget {
  const WithdrawBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<WithdrawCubit, WithdrawState>(
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
          success: (reciverResponse) {
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
                    'Withdraw Done Successfully',
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
