import 'package:eps_pay/core/widgets/app_button.dart';
import 'package:eps_pay/core/widgets/app_form_field.dart';
import 'package:eps_pay/features/auth/login/ui/widgets/form_feild_title.dart';
import 'package:eps_pay/features/bills_payment/data/model/bills_request_body.dart';
import 'package:eps_pay/features/bills_payment/logic/cubit/electricity_cubit.dart';
import 'package:eps_pay/features/bills_payment/ui/widgets/electricity_bloc_listener.dart';
import 'package:eps_pay/features/transfer/data/model/transfer_request_body.dart';
import 'package:eps_pay/features/transfer/logic/cubit/deposit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ElectricityFormButtonSection extends StatelessWidget {
  const ElectricityFormButtonSection({super.key});

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
            key: context.read<ElectricityCubit>().formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Electricity Amount Section
                const FormFeildTitle(title: "Amount"),
                SizedBox(height: 6.h),
                AppFormField(
                  controller: context.read<ElectricityCubit>().amountController,
                  isObscurePin: false,
                  textInputType: TextInputType.number,
                  hintText: 'Enter Electricity amount',
                  prefixIcon: const Icon(Icons.person),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Plece Enter a valid Electricity amount";
                    }
                  },
                ),
                SizedBox(height: 20.h),
                // Electricity Amount Section
                const FormFeildTitle(title: "Counter Number"),
                SizedBox(height: 6.h),
                AppFormField(
                  controller: context
                      .read<ElectricityCubit>()
                      .counterNumberController,
                  isObscurePin: false,
                  textInputType: TextInputType.number,
                  hintText: 'Enter Counter amount',
                  prefixIcon: const Icon(Icons.person),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Plece Enter a valid Counter Number";
                    }
                  },
                ),
                SizedBox(height: 15.h),

                // Login Button
                SizedBox(height: 6.h),
                AppButton(
                  backgroundColor: Color.fromARGB(255, 138, 119, 88),
                  onPressed: () {
                    validateAndComfirm(context);
                  },
                  buttonText: "Confirm Payment",
                ),
                ElectricityBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateAndComfirm(BuildContext context) {
    if (context.read<ElectricityCubit>().formKey.currentState!.validate()) {
      context.read<ElectricityCubit>().emitElectricityState(
        BillsRequestBody(
          amount: context.read<ElectricityCubit>().amountController.text,
        ),
      );
    }
  }
}
