import 'package:eps_pay/core/for_test_models/transaction.dart';
import 'package:eps_pay/core/theming/colors.dart';
import 'package:eps_pay/features/home_dashboard/logic/cubit/home_cubit.dart';
import 'package:eps_pay/features/home_dashboard/logic/cubit/home_state.dart';
import 'package:eps_pay/features/home_dashboard/ui/widgets/account_card.dart';
import 'package:eps_pay/features/home_dashboard/ui/widgets/header.dart';
import 'package:eps_pay/features/home_dashboard/ui/widgets/quick_actions.dart';
import 'package:eps_pay/features/home_dashboard/ui/widgets/recent_transactions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/routes.dart';

class HomeDashboard extends StatefulWidget {
  const HomeDashboard({super.key});

  @override
  State<HomeDashboard> createState() => _HomeDashboardState();
}

class _HomeDashboardState extends State<HomeDashboard> {
  bool _balanceVisible = true;

  final List<Transaction> _recentTransactions = [
    Transaction(
      id: '1',
      type: 'sent',
      recipient: 'Ahmed Hassan',
      amount: 500,
      date: DateTime.now(),
      time: '10:30 AM',
      category: 'Transfer',
      status: 'completed',
    ),
    Transaction(
      id: '2',
      type: 'received',
      recipient: 'Salary Payment',
      amount: 15000,
      date: DateTime.now().subtract(const Duration(days: 1)),
      time: '9:00 AM',
      category: 'Income',
      status: 'completed',
    ),
    Transaction(
      id: '3',
      type: 'sent',
      recipient: 'Electricity Bill',
      amount: 250,
      date: DateTime.now().subtract(const Duration(days: 2)),
      time: '2:15 PM',
      category: 'Bills',
      status: 'completed',
    ),
    Transaction(
      id: '4',
      type: 'sent',
      recipient: 'Mobile Recharge',
      amount: 100,
      date: DateTime.now().subtract(const Duration(days: 3)),
      time: '11:45 AM',
      category: 'Recharge',
      status: 'completed',
    ),
  ];

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);
    final dateToCheck = DateTime(date.year, date.month, date.day);

    if (dateToCheck == today) return 'Today';
    if (dateToCheck == yesterday) return 'Yesterday';
    return '${date.month}/${date.day}/${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is Loading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is Success) {
              return CustomScrollView(
                slivers: [
                  // Header
                  Header(
                    fullName: context.read<HomeCubit>().fullName.toString(),
                  ),

                  // Account Card
                  AccountCard(
                    totalBalance: context
                        .read<HomeCubit>()
                        .totalBalance
                        .toString(),
                    accountNumber: context
                        .read<HomeCubit>()
                        .accountNumber
                        .toString(),
                  ),
                  // Quick Actions
                  QuickActions(),

                  // Recent Transactions
                  SliverToBoxAdapter(
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
                              context.pushNamed(
                                Routes.transactionsHistoryScreen,
                              );
                            },
                            child: const Text('See All'),
                          ),
                        ],
                      ),
                    ),
                  ),

                  RecentTransaction(
                    transactions: context.read<HomeCubit>().transactions!,
                  ),
                ],
              );
            } else {
              return Text("error");
            }
          },
        ),
      ),
    );
  }
}
