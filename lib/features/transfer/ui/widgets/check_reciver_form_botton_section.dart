import 'package:eps_pay/core/widgets/app_button.dart';
import 'package:eps_pay/core/widgets/app_form_field.dart';
import 'package:eps_pay/features/auth/login/ui/widgets/form_feild_title.dart';
import 'package:eps_pay/features/transfer/data/model/reciver_request_body.dart';
import 'package:eps_pay/features/transfer/logic/cubit/resiver_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class FormButtnSection extends StatelessWidget {
  const FormButtnSection({super.key});

  @override
  Widget build(BuildContext context) {
    final reciverCubit = context.read<ReciverCubit>();
    int? accountNumber = int.tryParse(
      reciverCubit.reciverAccountNumberController.text,
    );
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
            key: reciverCubit.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // User Name Section
                const FormFeildTitle(title: "Account number"),
                SizedBox(height: 6.h),
                AppFormField(
                  controller: reciverCubit.reciverAccountNumberController,
                  isObscurePin: false,
                  textInputType: TextInputType.number,
                  hintText: 'Enter Account number',
                  prefixIcon: const Icon(Icons.person),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Plece Enter Account number";
                    }
                  },
                ),
                SizedBox(height: 15.h),

                // Login Button
                SizedBox(height: 6.h),
                AppButton(
                  onPressed: () {
                    reciverCubit.emitReciverGetDataState(
                      ReciverRequestBody(accountNumber: accountNumber),
                    );
                  },
                  buttonText: "Login",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
