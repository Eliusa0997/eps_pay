import 'package:eps_pay/core/theming/colors.dart';
import 'package:eps_pay/core/widgets/app_form_field.dart';
import 'package:eps_pay/features/auth/login/ui/widgets/form_feild_title.dart';
import 'package:eps_pay/features/transfer/logic/cubit/transfer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReciverNameAndAccountNumber extends StatelessWidget {
  final String reciverName;
  final String reciverAccountNumber;
  ReciverNameAndAccountNumber({
    super.key,
    required this.reciverName,
    required this.reciverAccountNumber,
  });

  @override
  Widget build(BuildContext context) {
    final transferCubit = context.read<TransferCubit>();
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),

              _buildSettingItem(
                Icons.person,
                reciverName,
                const Color(0xFF3B82F6),
                const Color(0xFFDEEDFF),
              ),
              _buildSettingItem(
                Icons.lock,
                reciverAccountNumber,
                const Color(0xFF8B5CF6),
                const Color(0xFFEDE9FE),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingItem(
    IconData icon,
    String label,
    Color iconColor,
    Color bgColor, {
    String? trailing,
  }) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(16),
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
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
            if (trailing != null) ...[
              Text(
                trailing,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(width: 8),
            ],
            const Icon(
              Icons.chevron_right,
              color: AppColors.textSecondary,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
