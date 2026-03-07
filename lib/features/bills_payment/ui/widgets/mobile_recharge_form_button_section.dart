import 'package:eps_pay/core/widgets/app_button.dart';
import 'package:eps_pay/core/widgets/app_form_field.dart';
import 'package:eps_pay/features/auth/login/ui/widgets/form_feild_title.dart';
import 'package:eps_pay/features/bills_payment/data/model/bills_request_body.dart';
import 'package:eps_pay/features/bills_payment/logic/cubit/mobile_recharge_cubit.dart';
import 'package:eps_pay/features/bills_payment/ui/widgets/mobile_recharge_bloc_listener.dart';
import 'package:eps_pay/features/transfer/data/model/transfer_request_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MobileRechargeFormButtonSection extends StatelessWidget {
  const MobileRechargeFormButtonSection({super.key});

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
            key: context.read<MobileRechargeCubit>().formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Mobile Recharge Section
                const FormFeildTitle(title: "Amount"),
                SizedBox(height: 6.h),
                AppFormField(
                  controller: context
                      .read<MobileRechargeCubit>()
                      .amountController,
                  isObscurePin: false,
                  textInputType: TextInputType.number,
                  hintText: 'Enter Recharge amount',
                  prefixIcon: const Icon(Icons.person),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Plece Enter a valid Mobile Recharge amount";
                    }
                  },
                ),
                SizedBox(height: 20.h),

                // Mobile Number Section
                const FormFeildTitle(title: "Phone Number"),
                SizedBox(height: 6.h),
                AppFormField(
                  controller: context
                      .read<MobileRechargeCubit>()
                      .phoneNumberController,
                  isObscurePin: false,
                  textInputType: TextInputType.number,
                  hintText: 'Enter phone number',
                  prefixIcon: const Icon(Icons.person),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Plece Enter a valid Mobile Phone Number";
                    }
                  },
                ),
                SizedBox(height: 15.h),

                // Login Button
                SizedBox(height: 6.h),
                AppButton(
                  backgroundColor: Color(0xFF10B981),
                  onPressed: () {
                    validateAndComfirm(context);
                  },
                  buttonText: "Confirm Payment",
                ),
                MobileRechargeBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateAndComfirm(BuildContext context) {
    if (context.read<MobileRechargeCubit>().formKey.currentState!.validate()) {
      context.read<MobileRechargeCubit>().emitMobileRechargeState(
        BillsRequestBody(
          amount: context.read<MobileRechargeCubit>().amountController.text,
        ),
      );
    }
  }
}
