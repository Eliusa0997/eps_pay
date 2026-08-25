import 'package:eps_pay/core/for_test_models/setup_success_state.dart';
import 'package:eps_pay/core/functions/setup_error_state.dart';
import 'package:eps_pay/core/helpers/extensions.dart';
import 'package:eps_pay/core/routing/routes.dart';
import 'package:eps_pay/core/theming/app_fonts.dart';
import 'package:eps_pay/core/theming/colors.dart';
import 'package:eps_pay/features/bills_payment/logic/cubit/water_cubit.dart';
import 'package:eps_pay/features/bills_payment/logic/cubit/water_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WaterBlocListener extends StatelessWidget {
  const WaterBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<WaterCubit, WaterState>(
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
          success: (waterResponse) {
            setupSuccessState(
              context,
              'Your ${waterResponse.sucsuccessMessage}',
              () {
                context.pop();
                context.pushReplacementNamed(Routes.billsBaymentsScreen);
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
