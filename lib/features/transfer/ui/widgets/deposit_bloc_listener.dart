import 'package:eps_pay/core/for_test_models/setup_success_state.dart';
import 'package:eps_pay/core/functions/setup_error_state.dart';
import 'package:eps_pay/core/helpers/extensions.dart';
import 'package:eps_pay/core/routing/routes.dart';
import 'package:eps_pay/core/theming/app_fonts.dart';
import 'package:eps_pay/core/theming/colors.dart';
import 'package:eps_pay/features/transfer/logic/cubit/deposit_cubit.dart';
import 'package:eps_pay/features/transfer/logic/cubit/deposit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DepositBlocListener extends StatelessWidget {
  const DepositBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<DepositCubit, DepositState>(
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
          success: (depositResponse) {
            setupSuccessState(
              context,
              'Your ${depositResponse.sucsuccessMessage}',
              () {
                context.pop();
                context.pushReplacementNamed(Routes.homeDashboardScreen);
              },
            );
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
