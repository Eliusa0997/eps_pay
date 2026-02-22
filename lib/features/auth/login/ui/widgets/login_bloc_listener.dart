import 'package:eps_pay/core/routing/routes.dart';
import 'package:eps_pay/core/theming/colors.dart';
import 'package:eps_pay/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:eps_pay/features/auth/login/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (precious, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            Dialog(
              child: CircularProgressIndicator(color: AppColors.secondary),
            );
          },
          success: (loginResponse) {
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
