import 'package:eps_pay/core/helpers/extensions.dart';
import 'package:eps_pay/core/routing/routes.dart';
import 'package:eps_pay/core/theming/app_fonts.dart';
import 'package:eps_pay/core/theming/colors.dart';
import 'package:eps_pay/features/transfer/logic/cubit/reciver_state.dart';
import 'package:eps_pay/features/transfer/logic/cubit/resiver_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckReciverBlocListener extends StatelessWidget {
  const CheckReciverBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReciverCubit, ReciverState>(
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
            // String reciverName = reciverResponse.reciverName;
            context.pushNamed(Routes.transferMoney, arguments: reciverResponse);
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
