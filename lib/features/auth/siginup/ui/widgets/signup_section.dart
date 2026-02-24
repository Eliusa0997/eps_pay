import 'package:eps_pay/core/helpers/app_regex.dart';
import 'package:eps_pay/core/helpers/extensions.dart';
import 'package:eps_pay/core/routing/routes.dart';
import 'package:eps_pay/core/widgets/app_button.dart';
import 'package:eps_pay/core/widgets/app_form_field.dart';
import 'package:eps_pay/core/widgets/forgot_password_and_goto_screen.dart';
import 'package:eps_pay/features/auth/login/ui/widgets/form_feild_title.dart';
import 'package:eps_pay/features/auth/siginup/data/model/signup_request_body.dart';
import 'package:eps_pay/features/auth/siginup/logic/cubit/signup_cubit.dart';
import 'package:eps_pay/features/auth/siginup/ui/widgets/password_validations.dart';
import 'package:eps_pay/features/auth/siginup/ui/widgets/signup_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class signupSection extends StatefulWidget {
  const signupSection({super.key});

  @override
  State<signupSection> createState() => _signupSectionState();
}

class _signupSectionState extends State<signupSection> {
  late TextEditingController passwordController;

  // Password validation variable
  bool hasLowerCase = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  bool _obscurePin = true;
  @override
  void initState() {
    super.initState();
    passwordController = context.read<SignupCubit>().passwordController;
    setUpPasswordControllerListener();
  }

  void setUpPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
            key: context.read<SignupCubit>().formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // User Name Section
                const FormFeildTitle(title: "User Name"),
                const SizedBox(height: 8),
                AppFormField(
                  controller: context.read<SignupCubit>().userNameController,
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

                const SizedBox(height: 20),

                // Email Section
                const FormFeildTitle(title: "Email"),
                const SizedBox(height: 8),
                AppFormField(
                  controller: context.read<SignupCubit>().emailController,
                  isObscurePin: false,
                  textInputType: TextInputType.text,
                  hintText: 'Enter Your Email',
                  prefixIcon: const Icon(Icons.email),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Plece Enter Valid User Email";
                    }
                  },
                ),
                const SizedBox(height: 20),

                // Password Form Field
                const FormFeildTitle(title: " Password"),
                const SizedBox(height: 8),
                AppFormField(
                  textInputType: TextInputType.text,
                  controller: passwordController,
                  hintText: 'Enter your Password',
                  maxLength: 10,
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

                const SizedBox(height: 12),
                forgetPassordAndGoToSomeScreen(
                  text: 'I have a account',
                  goToScreen: () {
                    context.pushReplacementNamed(Routes.loginScreen);
                  },
                ),

                PasswordValidations(
                  hasLowerCase: hasLowerCase,
                  hasNumber: hasNumber,
                  hasMinLength: hasMinLength,
                ),
                // Login Button
                const SizedBox(height: 8),
                AppButton(
                  onPressed: () {
                    validateThenDoSignup(context);
                    // handleLogin;
                  },
                  buttonText: "Sign up",
                ),
                const SignupBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoSignup(BuildContext context) {
    if (context.read<SignupCubit>().formKey.currentState!.validate()) {
      context.read<SignupCubit>().emitSignupState(
        SignupRequestBody(
          userName: context.read<SignupCubit>().userNameController.text,
          email: context.read<SignupCubit>().emailController.text,
          password: context.read<SignupCubit>().passwordController.text,
        ),
      );
    }
  }

  @override
  void dispose() {
    // passwordController.dispose();
    super.dispose();
  }
}
