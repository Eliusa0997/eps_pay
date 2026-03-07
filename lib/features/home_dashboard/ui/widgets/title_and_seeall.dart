import 'package:eps_pay/core/theming/colors.dart';
import 'package:flutter/material.dart';

class TitleAndSeeall extends StatelessWidget {
  const TitleAndSeeall({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Recent Transactions',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/transactions');
              },
              child: const Text('See All'),
            ),
          ],
        ),
      ),
    );
  }
}
