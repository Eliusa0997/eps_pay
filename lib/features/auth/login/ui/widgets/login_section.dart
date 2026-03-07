import 'package:eps_pay/core/helpers/extensions.dart';
import 'package:eps_pay/core/routing/routes.dart';
import 'package:eps_pay/core/widgets/app_button.dart';
import 'package:eps_pay/core/widgets/app_form_field.dart';
import 'package:eps_pay/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:eps_pay/core/widgets/forgot_password_and_goto_screen.dart';
import 'package:eps_pay/features/auth/login/ui/widgets/form_feild_title.dart';
import 'package:eps_pay/features/auth/login/ui/widgets/login_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eps_pay/features/auth/login/data/model/login_request_body.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginSection extends StatefulWidget {
  const LoginSection({super.key});

  @override
  State<LoginSection> createState() => _LoginSectionState();
}

class _LoginSectionState extends State<LoginSection> {
  bool _obscurePin = true;
  @override
  void initState() {
    super.initState();
    context.read<LoginCubit>().getSavedUserName();
  }

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
            key: context.read<LoginCubit>().formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // User Name Section
                const FormFeildTitle(title: "User Name"),
                SizedBox(height: 6.h),
                AppFormField(
                  controller: context.read<LoginCubit>().userNameController,
                  isObscurePin: false,
                  textInputType: TextInputType.text,
                  hintText: 'Enter User Name',
                  prefixIcon: const Icon(Icons.person),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Plece Enter Valid User Name";
                    }
                  },
                ),
                SizedBox(height: 15.h),

                // Password Section
                const FormFeildTitle(title: "Password"),
                SizedBox(height: 6.h),
                AppFormField(
                  textInputType: TextInputType.text,
                  controller: context.read<LoginCubit>().passwordController,
                  hintText: 'Enter your Password',
                  maxLength: 30,
                  isObscurePin: _obscurePin,
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePin ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePin = !_obscurePin;
                      });
                    },
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Plece Enter Valid Password";
                    }
                  },
                ),

                // Forgot PIN
                SizedBox(height: 10.h),
                ForgetPassordAndGoToSomeScreen(
                  text: 'I dont have account',
                  goToScreen: () {
                    context.pushNamed(Routes.signupScreen);
                  },
                ),

                // Login Button
                SizedBox(height: 6.h),
                AppButton(
                  onPressed: () {
                    context.read<LoginCubit>().emitLoginState();
                  },
                  buttonText: "Login",
                ),
                const LoginBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
