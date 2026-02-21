import 'package:eps_pay/core/routing/routes.dart';
import 'package:eps_pay/core/widgets/app_button.dart';
import 'package:eps_pay/core/widgets/app_form_field.dart';
import 'package:eps_pay/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:eps_pay/features/auth/login/ui/widgets/forgot_pin.dart';
import 'package:eps_pay/features/auth/login/ui/widgets/form_feild_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginSection extends StatefulWidget {
  const LoginSection({super.key});

  @override
  State<LoginSection> createState() => _LoginSectionState();
}

class _LoginSectionState extends State<LoginSection> {
  late TextEditingController userNameController;
  late TextEditingController passwordController;

  bool _obscurePin = true;
  @override
  void initState() {
    super.initState();
    userNameController = context.read<LoginCubit>().userNameController;
    passwordController = context.read<LoginCubit>().passwordController;
  }

  @override
  Widget build(BuildContext context) {
    void handleLogin() {
      Navigator.pushReplacementNamed(context, Routes.homeDashboard);
    }

    return Transform.translate(
      offset: const Offset(0, -48),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 16,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Form(
            key: context.read<LoginCubit>().formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Phone Number
                const FormFeildTitle(title: "Phone Number"),
                // Phone Form Field
                const SizedBox(height: 8),
                AppFormField(
                  controller: userNameController,
                  isObscurePin: false,
                  textInputType: TextInputType.phone,
                  hintText: 'Enter your User N ame',
                  prefixIcon: const Icon(Icons.person),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Plece Enter Valid User Name";
                    }
                  },
                ),
                const SizedBox(height: 20),
                // PIN
                const FormFeildTitle(title: "PIN"),
                // Pin Form Field
                const SizedBox(height: 8),
                AppFormField(
                  textInputType: TextInputType.number,
                  controller: passwordController,
                  hintText: 'Enter your Password',
                  maxLength: 4,
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
                const SizedBox(height: 12),
                const ForgotPin(),
                // Login Button
                const SizedBox(height: 8),
                AppButton(onPressed: handleLogin, buttonText: "Login"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
