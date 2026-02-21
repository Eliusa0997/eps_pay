import 'package:eps_pay/core/routing/routes.dart';
import 'package:eps_pay/core/widgets/app_button.dart';
import 'package:eps_pay/core/widgets/app_form_field.dart';
import 'package:eps_pay/features/auth/login/ui/widgets/forgot_pin.dart';
import 'package:eps_pay/features/auth/login/ui/widgets/form_feild_title.dart';
import 'package:flutter/material.dart';

class LoginSection extends StatefulWidget {
  const LoginSection({super.key});

  @override
  State<LoginSection> createState() => _LoginSectionState();
}

class _LoginSectionState extends State<LoginSection> {
  final _phoneController = TextEditingController();

  final _pinController = TextEditingController();

  bool _obscurePin = true;

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Phone Number
              const FormFeildTitle(title: "Phone Number"),
              // Phone Form Field
              const SizedBox(height: 8),
              AppFormField(
                controller: _phoneController,
                isObscurePin: false,
                textInputType: TextInputType.phone,
                hintText: '+249 123 656 789',
                prefixIcon: const Icon(Icons.phone),
              ),
              const SizedBox(height: 20),
              // PIN
              const FormFeildTitle(title: "PIN"),
              // Pin Form Field
              const SizedBox(height: 8),
              AppFormField(
                textInputType: TextInputType.number,
                controller: _pinController,
                hintText: 'Enter your PIN',
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
    );
  }
}
