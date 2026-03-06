import 'package:eps_pay/core/theming/colors.dart';
import 'package:eps_pay/features/home_dashboard/data/model/profile_model.dart';
import 'package:flutter/material.dart';

class RecentTransaction extends StatelessWidget {
  final List<RecentTransactions> transactions;
  // final List<RecentTransactions> myList = profileModel.recentTransactions;
  RecentTransaction({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          final transaction = transactions[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.border),
            ),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: transaction.transactionType == "deposit"
                        ? AppColors.success.withOpacity(0.1)
                        : AppColors.error.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: transaction.transactionType == "transfer"
                      ? Icon(Icons.arrow_upward, color: Colors.red)
                      : Icon(Icons.arrow_downward, color: AppColors.success),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transaction.receiverName == null
                            ? "Bills Payment"
                            : transaction.receiverName!,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '${transaction.transactionType == "deposit" ? '+' : '-'}${transaction.amount}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${transaction.transactionType == "deposit" ? '+' : '-'}${transaction.amount}',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: transaction.transactionType == "deposit"
                            ? AppColors.success
                            : AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      transaction.transactionType,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }, childCount: transactions.length),
      ),
    );
  }
}
