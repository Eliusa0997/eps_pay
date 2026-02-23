import 'package:eps_pay/core/routing/routes.dart';
import 'package:eps_pay/core/theming/colors.dart';
import 'package:eps_pay/features/auth/siginup/logic/cubit/signup_cubit.dart';
import 'package:eps_pay/features/auth/siginup/logic/cubit/signup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupBlocListener extends StatelessWidget {
  const SignupBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listenWhen: (precious, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            Dialog(
              child: CircularProgressIndicator(color: AppColors.secondary),
            );
          },
          success: (signupResponse) {
            // context.pop();
            Navigator.of(context).pop();
            Navigator.pushNamed(context, Routes.homeDashboard);
          },
          error: (error) {
            Dialog(child: Text(error));
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
