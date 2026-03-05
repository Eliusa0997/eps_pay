import 'package:eps_pay/core/helpers/extensions.dart';
import 'package:eps_pay/core/routing/routes.dart';
import 'package:eps_pay/core/theming/app_fonts.dart';
import 'package:eps_pay/core/theming/colors.dart';
import 'package:eps_pay/features/bills_payment/logic/cubit/mobile_recharge_cubit.dart';
import 'package:eps_pay/features/bills_payment/logic/cubit/mobile_recharge_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MobileRechargeBlocListener extends StatelessWidget {
  const MobileRechargeBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<MobileRechargeCubit, MobileRechargeState>(
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
          success: (billResponse) {
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
                    'Mobile Recharge Done Successfully',
                    style: AppFonts.font14W600textPrimary,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        context.pop();
                        context.pushNamed(Routes.billsBaymentsScreen);
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
