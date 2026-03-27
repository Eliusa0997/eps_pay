import 'package:eps_pay/core/theming/colors.dart';
import 'package:eps_pay/core/widgets/app_form_field.dart';
import 'package:eps_pay/features/auth/login/ui/widgets/form_feild_title.dart';
import 'package:eps_pay/features/transfer/logic/cubit/transfer_cubit.dart';
import 'package:eps_pay/features/transfer/ui/widgets/transfer_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AmountAndNoteSection extends StatelessWidget {
  TextEditingController amountController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController noteNumberController = TextEditingController();
  final String reciverName;
  final String reciverAccountNumber;
  void Function()? transfer;

  AmountAndNoteSection({
    super.key,
    required this.amountController,
    required this.phoneNumberController,
    required this.noteNumberController,
    required this.transfer,
    required this.reciverName,
    required this.reciverAccountNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FormFeildTitle(title: "Amount (SDG)"),
          SizedBox(height: 5.h),
          // User Name Section
          AppFormField(
            controller: amountController,
            isObscurePin: false,
            textInputType: TextInputType.number,
            hintText: 'Enter amount',
            prefixIcon: const Icon(Icons.person),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Plece Enter Valid amount";
              }
            },
          ),
          SizedBox(height: 10.h),
          Row(
            children: [100, 500, 1000, 5000].map((amount) {
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.textPrimary,
                      side: const BorderSide(color: AppColors.border),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      amount.toString(),
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 20.h),
          // Phone Namber Section
          const FormFeildTitle(title: "Phone Namber"),
          SizedBox(height: 5.h),
          AppFormField(
            controller: phoneNumberController,
            isObscurePin: false,
            textInputType: TextInputType.number,
            hintText: 'Enter phone namber',
            prefixIcon: const Icon(Icons.person),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Plece Enter Valid phone namber";
              }
            },
          ),
          SizedBox(height: 20.h),
          // User Name Section
          const FormFeildTitle(title: "Add a note"),
          SizedBox(height: 5.h),
          AppFormField(
            controller: noteNumberController,
            isObscurePin: false,
            textInputType: TextInputType.number,
            hintText: 'Enter account number',
            prefixIcon: const Icon(Icons.person),
          ),

          SizedBox(height: 20.h),
          // User Data Section
          const FormFeildTitle(title: "Reciver Informations"),
          _buildSettingItem(
            Icons.person,
            "Reciver :-  ",
            reciverName,
            const Color(0xFF3B82F6),
            const Color(0xFFDEEDFF),
          ),
          _buildSettingItem(
            Icons.account_balance,
            "Account  :-  ",
            reciverAccountNumber,
            const Color(0xFF8B5CF6),
            const Color(0xFFEDE9FE),
          ),
          TransferBlocListener(),
          SizedBox(height: 50.h),
          // Comfirm Button Section
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: transfer,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                elevation: 4,
                shadowColor: AppColors.primary.withOpacity(0.3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Continue to Confirm',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingItem(
    IconData icon,
    String fixedLabel,
    String label,
    Color iconColor,
    Color bgColor, {
    String? trailing,
  }) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
              child: Icon(icon, size: 20, color: iconColor),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Row(
                children: [
                  Text(
                    fixedLabel,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Divider(color: Colors.black),
                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
