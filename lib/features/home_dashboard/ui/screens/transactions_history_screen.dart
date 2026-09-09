import 'package:easy_localization/easy_localization.dart';
import 'package:eps_pay/core/constant/month_names.dart';
import 'package:eps_pay/core/functions/transaction_history.dart';
import 'package:eps_pay/features/home_dashboard/data/model/transactions_history_response_model.dart';
import 'package:eps_pay/features/home_dashboard/logic/cubit/transactions_history_cubit.dart';
import 'package:eps_pay/features/home_dashboard/ui/widgets/build_filter_chip.dart';
import 'package:eps_pay/features/home_dashboard/ui/widgets/category_filters.dart';
import 'package:eps_pay/features/home_dashboard/ui/widgets/recent_transactions_history_header.dart';
import 'package:eps_pay/features/home_dashboard/ui/widgets/show_empty_transactions_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/for_test_models/transaction.dart';
import '../../../../core/theming/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/transactions_history_state.dart';
import '../widgets/list_item_transaction_history.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransactionHistoryScreen extends StatefulWidget {
  const TransactionHistoryScreen({super.key});

  @override
  State<TransactionHistoryScreen> createState() =>
      _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen> {
  String _selectedFilter = 'all';
  final _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 100) {
      context.read<TransactionsHistoryCubit>().loadMoreTransactions();
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<TransactionsHistoryCubit, TransactionsHistoryState>(
          builder: (context, state) {
            print("🟢 UI BUILDER CALLED");
            print("🟢 STATE TYPE: ${state.runtimeType}");
            if (state is Loading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is Success) {
              final transactions = context
                  .read<TransactionsHistoryCubit>()
                  .allTransactions;
              print("🟢 UI RECEIVED: ${transactions.length}");
              final groupedTransactions = groupByDate(
                _filterTransactions(transactions),
              );

              return Column(
                children: [
                  // Header Section
                  RecentTransactionsHistoryHeader(
                    searchController: _searchController,
                  ),

                  // Category Filters
                  CategoryFilters(),

                  // Transactions List
                  Expanded(
                    child: groupedTransactions.isEmpty
                        ?
                          // widget show that you dont have transactions history yet
                          ShowEmptyTransactionsWidget()
                        : ListView.builder(
                            controller: _scrollController,
                            padding: EdgeInsets.fromLTRB(24.w, 8.h, 24.w, 24.h),
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
                                    padding: EdgeInsets.only(
                                      left: 8.w,
                                      bottom: 12.h,
                                      top: 12.h,
                                    ),
                                    child: Text(
                                      dateLabel.tr(),
                                      style: TextStyle(
                                        fontSize: 14.sp,
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

  List<TransactionHistoryResponseModel> _filterTransactions(
    List<TransactionHistoryResponseModel> transactions,
  ) {
    return transactions.where((transaction) {
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
}
