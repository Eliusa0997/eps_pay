import 'package:eps_pay/features/home_dashboard/logic/cubit/transactions_history_cubit.dart';
import 'package:flutter/material.dart';

import '../../../../core/for_test_models/transaction.dart';
import '../../../../core/theming/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/transactions_history_state.dart';

class TransactionHistoryScreen extends StatefulWidget {
  const TransactionHistoryScreen({super.key});

  @override
  State<TransactionHistoryScreen> createState() =>
      _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen> {
  String _selectedFilter = 'all';
  final _searchController = TextEditingController();

  final List<Transaction> _allTransactions = [
    Transaction(
      id: '1',
      type: 'sent',
      recipient: 'Ahmed Hassan',
      amount: 500,
      date: DateTime(2026, 2, 10),
      time: '10:30 AM',
      category: 'Transfer',
      status: 'completed',
    ),
    Transaction(
      id: '2',
      type: 'received',
      recipient: 'Salary Payment',
      amount: 15000,
      date: DateTime(2026, 2, 9),
      time: '9:00 AM',
      category: 'Income',
      status: 'completed',
    ),
    Transaction(
      id: '3',
      type: 'sent',
      recipient: 'Electricity Bill',
      amount: 250,
      date: DateTime(2026, 2, 8),
      time: '2:15 PM',
      category: 'Bills',
      status: 'completed',
    ),
    Transaction(
      id: '4',
      type: 'sent',
      recipient: 'Mobile Recharge',
      amount: 100,
      date: DateTime(2026, 2, 7),
      time: '11:45 AM',
      category: 'Recharge',
      status: 'completed',
    ),
    Transaction(
      id: '5',
      type: 'sent',
      recipient: 'Water Bill',
      amount: 180,
      date: DateTime(2026, 2, 7),
      time: '9:20 AM',
      category: 'Bills',
      status: 'completed',
    ),
    Transaction(
      id: '6',
      type: 'received',
      recipient: 'Refund - Online Purchase',
      amount: 450,
      date: DateTime(2026, 2, 6),
      time: '4:30 PM',
      category: 'Refund',
      status: 'completed',
    ),
    Transaction(
      id: '7',
      type: 'sent',
      recipient: 'Fatima Mohamed',
      amount: 1200,
      date: DateTime(2026, 2, 5),
      time: '1:10 PM',
      category: 'Transfer',
      status: 'completed',
    ),
    Transaction(
      id: '8',
      type: 'sent',
      recipient: 'Internet Bill',
      amount: 350,
      date: DateTime(2026, 2, 1),
      time: '3:00 PM',
      category: 'Bills',
      status: 'completed',
    ),
    Transaction(
      id: '9',
      type: 'received',
      recipient: 'Freelance Payment',
      amount: 5000,
      date: DateTime(2026, 1, 30),
      time: '11:00 AM',
      category: 'Income',
      status: 'completed',
    ),
    Transaction(
      id: '10',
      type: 'sent',
      recipient: 'Restaurant Payment',
      amount: 280,
      date: DateTime(2026, 1, 28),
      time: '8:30 PM',
      category: 'Shopping',
      status: 'completed',
    ),
  ];

  List<Transaction> get _filteredTransactions {
    return _allTransactions.where((transaction) {
      final matchesSearch = transaction.recipient.toLowerCase().contains(
        _searchController.text.toLowerCase(),
      );
      final matchesFilter =
          _selectedFilter == 'all' ||
          transaction.type == _selectedFilter ||
          (_selectedFilter == 'bills' && transaction.category == 'Bills');
      return matchesSearch && matchesFilter;
    }).toList();
  }

  Map<String, List<Transaction>> _groupByDate(List<Transaction> transactions) {
    final Map<String, List<Transaction>> groups = {};
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

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final groupedTransactions = _groupByDate(_filteredTransactions);

    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<TransactionsHistoryCubit, TransactionsHistoryState>(
          builder: (context, state) {
            if (state is Loading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is Success) {
              return Column(
                children: [
                  // Header
                  Container(
                    decoration: const BoxDecoration(
                      gradient: AppColors.primaryGradient,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(32),
                        bottomRight: Radius.circular(32),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: const Icon(Icons.arrow_back),
                                color: Colors.white,
                                style: IconButton.styleFrom(
                                  backgroundColor: Colors.white.withOpacity(
                                    0.1,
                                  ),
                                ),
                              ),
                              const Text(
                                'Transaction History',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.calendar_today),
                                color: Colors.white,
                                style: IconButton.styleFrom(
                                  backgroundColor: Colors.white.withOpacity(
                                    0.1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          // Search
                          TextField(
                            controller: _searchController,
                            onChanged: (value) => setState(() {}),
                            decoration: InputDecoration(
                              hintText: 'Search transactions...',
                              prefixIcon: const Icon(Icons.search),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
                                const Text(
                                  'No transactions found',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  'Try adjusting your search or filters',
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
                                      dateLabel,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.textSecondary,
                                      ),
                                    ),
                                  ),
                                  ...transactions.map((transaction) {
                                    return Container(
                                      margin: const EdgeInsets.only(bottom: 8),
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          color: AppColors.border,
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                width: 40,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  color: transaction.isReceived
                                                      ? AppColors.success
                                                            .withOpacity(0.1)
                                                      : AppColors.error
                                                            .withOpacity(0.1),
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Icon(
                                                  transaction.isReceived
                                                      ? Icons.arrow_downward
                                                      : Icons.arrow_upward,
                                                  color: transaction.isReceived
                                                      ? AppColors.success
                                                      : AppColors.error,
                                                  size: 20,
                                                ),
                                              ),
                                              const SizedBox(width: 12),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      transaction.recipient,
                                                      style: const TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: AppColors
                                                            .textPrimary,
                                                      ),
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    const SizedBox(height: 4),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          transaction.time,
                                                          style: const TextStyle(
                                                            fontSize: 12,
                                                            color: AppColors
                                                                .textSecondary,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 8,
                                                        ),
                                                        Container(
                                                          width: 4,
                                                          height: 4,
                                                          decoration:
                                                              const BoxDecoration(
                                                                color: AppColors
                                                                    .textTertiary,
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                        ),
                                                        const SizedBox(
                                                          width: 8,
                                                        ),
                                                        Text(
                                                          transaction.category,
                                                          style: const TextStyle(
                                                            fontSize: 12,
                                                            color: AppColors
                                                                .textSecondary,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    '${transaction.isReceived ? '+' : '-'}${transaction.amount.toStringAsFixed(2)}',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          transaction.isReceived
                                                          ? AppColors.success
                                                          : AppColors
                                                                .textPrimary,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 2),
                                                  const Text(
                                                    'SDG',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: AppColors
                                                          .textSecondary,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 12),
                                          const Divider(height: 1),
                                          const SizedBox(height: 12),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 8,
                                                      vertical: 4,
                                                    ),
                                                decoration: BoxDecoration(
                                                  color: AppColors.success
                                                      .withOpacity(0.1),
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.check_circle,
                                                      size: 14,
                                                      color: AppColors.success,
                                                    ),
                                                    const SizedBox(width: 4),
                                                    Text(
                                                      transaction.status ==
                                                              'completed'
                                                          ? 'Completed'
                                                          : transaction.status,
                                                      style: const TextStyle(
                                                        fontSize: 11,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color:
                                                            AppColors.success,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {},
                                                child: const Text(
                                                  'View Details',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
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
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.white : AppColors.textPrimary,
          ),
        ),
      ),
    );
  }
}
