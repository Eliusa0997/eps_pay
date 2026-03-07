import 'package:eps_pay/core/widgets/app_button.dart';
import 'package:eps_pay/core/widgets/app_form_field.dart';
import 'package:eps_pay/features/auth/login/ui/widgets/form_feild_title.dart';
import 'package:eps_pay/features/transfer/data/model/transfer_request_body.dart';
import 'package:eps_pay/features/transfer/logic/cubit/deposit_cubit.dart';
import 'package:eps_pay/features/transfer/ui/widgets/deposit_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class depositFormButtonSection extends StatelessWidget {
  const depositFormButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -48),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.5),
                blurRadius: 16.r,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Form(
            key: context.read<DepositCubit>().formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // User Name Section
                const FormFeildTitle(title: "Deposit"),
                SizedBox(height: 6.h),
                AppFormField(
                  controller: context.read<DepositCubit>().amountController,
                  isObscurePin: false,
                  textInputType: TextInputType.number,
                  hintText: 'Enter deposit amount',
                  prefixIcon: const Icon(Icons.person),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Plece Enter a valid Deposit";
                    }
                  },
                ),
                SizedBox(height: 15.h),

                // Login Button
                SizedBox(height: 6.h),
                AppButton(
                  onPressed: () {
                    validateAndComfirm(context);
                  },
                  buttonText: "Deposit",
                ),
                DepositBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateAndComfirm(BuildContext context) {
    if (context.read<DepositCubit>().formKey.currentState!.validate()) {
      context.read<DepositCubit>().emitDepositState(
        TransferRequestBody(
          amount: context.read<DepositCubit>().amountController.text,
        ),
      );
    }
  }
}
