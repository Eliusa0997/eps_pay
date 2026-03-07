import 'package:eps_pay/core/widgets/app_form_field.dart';
import 'package:eps_pay/features/auth/login/ui/widgets/form_feild_title.dart';
import 'package:eps_pay/features/transfer/logic/cubit/transfer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountNumberPhoneNumber extends StatelessWidget {
  const AccountNumberPhoneNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -20),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
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
            key: context.read<TransferCubit>().formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // User Name Section
                const FormFeildTitle(title: "Account Number"),
                SizedBox(height: 6.h),
                AppFormField(
                  controller: context.read<TransferCubit>().accountNumber,
                  isObscurePin: false,
                  textInputType: TextInputType.text,
                  hintText: 'Enter account number',
                  prefixIcon: const Icon(Icons.person),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Plece Enter Valid account number";
                    }
                  },
                ),
                SizedBox(height: 15.h),

                // Password Section
                const FormFeildTitle(title: "Phone Namber"),
                SizedBox(height: 6.h),
                AppFormField(
                  controller: context.read<TransferCubit>().phoneNumber,
                  isObscurePin: false,
                  textInputType: TextInputType.text,
                  hintText: 'Enter phone namber',
                  prefixIcon: const Icon(Icons.person),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Plece Enter Valid phone namber";
                    }
                  },
                ),
                SizedBox(height: 6.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
