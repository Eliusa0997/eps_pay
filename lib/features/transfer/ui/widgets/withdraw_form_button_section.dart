import 'package:eps_pay/core/widgets/app_button.dart';
import 'package:eps_pay/core/widgets/app_form_field.dart';
import 'package:eps_pay/features/auth/login/ui/widgets/form_feild_title.dart';
import 'package:eps_pay/features/transfer/data/model/transfer_request_body.dart';
import 'package:eps_pay/features/transfer/logic/cubit/withdraw_cubit.dart';
import 'package:eps_pay/features/transfer/ui/widgets/withdraw_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WithdrawFormButtonSection extends StatelessWidget {
  const WithdrawFormButtonSection({super.key});

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
            key: context.read<WithdrawCubit>().formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // User Name Section
                const FormFeildTitle(title: "Amount"),
                SizedBox(height: 6.h),
                AppFormField(
                  controller: context.read<WithdrawCubit>().amountController,
                  isObscurePin: false,
                  textInputType: TextInputType.number,
                  hintText: 'Enter money amout',
                  prefixIcon: const Icon(Icons.person),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Plece Enter valid amount";
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
                  buttonText: "Withdraw",
                ),
                WithdrawBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateAndComfirm(BuildContext context) {
    if (context.read<WithdrawCubit>().formKey.currentState!.validate()) {
      context.read<WithdrawCubit>().emitWithdrawState(
        TransferRequestBody(
          amount: context.read<WithdrawCubit>().amountController.text,
        ),
      );
    }
  }
}
