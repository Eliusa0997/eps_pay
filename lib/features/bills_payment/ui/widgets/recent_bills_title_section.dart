import 'package:eps_pay/core/theming/colors.dart';
import 'package:flutter/material.dart';

class RecentBillsTitleSection extends StatelessWidget {
  const RecentBillsTitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Recent Bills',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
