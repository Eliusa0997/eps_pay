import 'package:easy_localization/easy_localization.dart';
import 'package:eps_pay/features/home_dashboard/logic/cubit/transactions_history_cubit.dart';
import 'package:eps_pay/features/home_dashboard/ui/widgets/recent_transactions_history_header.dart';
import 'package:flutter/material.dart';

import '../../../../core/for_test_models/transaction.dart';
import '../../../../core/theming/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/transactions_history_model.dart';
import '../../logic/cubit/transactions_history_state.dart';
import '../widgets/list_item_transaction_history.dart';

class TransactionHistoryScreen extends StatefulWidget {
  const TransactionHistoryScreen({super.key});

  @override
  State<TransactionHistoryScreen> createState() =>
      _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen> {
  String _selectedFilter = 'all';
  final _searchController = TextEditingController();
  List<TransactionHistoryModel> allTransactions = [];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<TransactionsHistoryCubit, TransactionsHistoryState>(
          builder: (context, state) {
            if (state is Loading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is Success) {
              allTransactions = context
                  .read<TransactionsHistoryCubit>()
                  .allTransactions;
              final groupedTransactions = _groupByDate(_filteredTransactions);

              return Column(
                children: [
                  // Header Section
                  RecentTransactionsHistoryHeader(
                    searchController: _searchController,
                  ),

                  // Filters
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          const Icon(
                            Icons.filter_list,
                            color: AppColors.textSecondary,
                            size: 20,
                          ),
                          const SizedBox(width: 12),
                          _buildFilterChip('All', 'all'),
                          const SizedBox(width: 8),
                          _buildFilterChip('Sent', 'sent'),
                          const SizedBox(width: 8),
                          _buildFilterChip('Received', 'received'),
                          const SizedBox(width: 8),
                          _buildFilterChip('Bills', 'bills'),
                        ],
                      ),
                    ),
                  ),

                  // Transactions List
                  Expanded(
                    child: groupedTransactions.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 64,
                                  height: 64,
                                  decoration: BoxDecoration(
                                    color: AppColors.background,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.search,
                                    size: 32,
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  'No transactions found'.tr(),
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Try adjusting your search or filters'.tr(),
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppColors.textTertiary,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : ListView.builder(
                            padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
                            itemCount: groupedTransactions.length,
                            itemBuilder: (context, index) {
                              final dateLabel = groupedTransactions.keys
                                  .elementAt(index);
                              final transactions =
                                  groupedTransactions[dateLabel]!;

                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 8,
                                      bottom: 12,
                                      top: 12,
                                    ),
                                    child: Text(
                                      dateLabel.tr(),
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.textSecondary,
                                      ),
                                    ),
                                  ),
                                  ...transactions.map((transaction) {
                                    return ListItemTransactionHistory(
                                      dateLabel: dateLabel,
                                      transaction: transaction,
                                    );
                                  }),
                                ],
                              );
                            },
                          ),
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

  Widget _buildFilterChip(String label, String value) {
    final isSelected = _selectedFilter == value;
    return InkWell(
      onTap: () {
        setState(() {
          _selectedFilter = value;
        });
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          gradient: isSelected ? AppColors.primaryGradient : null,
          color: isSelected ? null : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? Colors.transparent : AppColors.border,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ]
              : [],
        ),
        child: Text(
          label.tr(),
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.white : AppColors.textPrimary,
          ),
        ),
      ),
    );
  }

  List<TransactionHistoryModel> get _filteredTransactions {
    return allTransactions.where((transaction) {
      final matchesSearch = transaction.transactionType.toLowerCase().contains(
        _searchController.text.toLowerCase(),
      );
      final matchesFilter =
          _selectedFilter == 'all' ||
          transaction.transactionType == _selectedFilter ||
          (_selectedFilter == 'bills' &&
              transaction.transactionType == 'Bills');
      return matchesSearch && matchesFilter;
    }).toList();
  }

  Map<String, List<TransactionHistoryModel>> _groupByDate(
    List<TransactionHistoryModel> transactions,
  ) {
    final Map<String, List<TransactionHistoryModel>> groups = {};
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);

    for (var transaction in transactions) {
      final date = DateTime(
        transaction.date.year,
        transaction.date.month,
        transaction.date.day,
      );

      String label;
      if (date == today) {
        label = 'Today';
      } else if (date == yesterday) {
        label = 'Yesterday';
      } else {
        label =
            '${_monthName(transaction.date.month)} ${transaction.date.day}, ${transaction.date.year}';
      }

      if (!groups.containsKey(label)) {
        groups[label] = [];
      }
      groups[label]!.add(transaction);
    }

    return groups;
  }

  String _monthName(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return months[month - 1];
  }
}
