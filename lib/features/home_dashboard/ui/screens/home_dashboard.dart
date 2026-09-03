import 'package:eps_pay/features/home_dashboard/data/model/profile_model.dart';
import 'package:eps_pay/features/home_dashboard/logic/cubit/home_cubit.dart';
import 'package:eps_pay/features/home_dashboard/logic/cubit/home_state.dart';
import 'package:eps_pay/features/home_dashboard/ui/widgets/account_card.dart';
import 'package:eps_pay/features/home_dashboard/ui/widgets/header.dart';
import 'package:eps_pay/features/home_dashboard/ui/widgets/quick_actions.dart';
import 'package:eps_pay/features/home_dashboard/ui/widgets/recent_transactions.dart';
import 'package:eps_pay/features/home_dashboard/ui/widgets/title_and_seeall.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeDashboard extends StatefulWidget {
  const HomeDashboard({super.key});

  @override
  State<HomeDashboard> createState() => _HomeDashboardState();
}

class _HomeDashboardState extends State<HomeDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<HomeCubit, HomeState>(
          buildWhen: (previous, current) {
            // Only rebuild for the initial loading/success/error state
            return previous.runtimeType != current.runtimeType;
          },
          builder: (context, state) {
            if (state is Loading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is Success) {
              return CustomScrollView(
                slivers: [
                  // Header
                  Header(
                    fullName: context.read<HomeCubit>().fullName.toString(),
                  ),

                  // Balance + Account Number
                  BlocSelector<HomeCubit, HomeState, String>(
                    selector: (state) {
                      return context.read<HomeCubit>().totalBalance.toString();
                    },
                    builder: (context, balance) {
                      return AccountCard(
                        totalBalance: balance,
                        accountNumber: context
                            .read<HomeCubit>()
                            .accountNumber
                            .toString(),
                      );
                    },
                  ),

                  // Quick Actions
                  QuickActions(),

                  // Recent Transactions title
                  TitleAndSeeall(),

                  // Recent Transactions
                  BlocSelector<HomeCubit, HomeState, List<RecentTransactions>>(
                    selector: (state) {
                      return context.read<HomeCubit>().transactions ?? [];
                    },
                    builder: (context, transactions) {
                      return RecentTransaction(transactions: transactions);
                    },
                  ),
                ],
              );
            }

            return const Text("error");
          },
        ),
      ),
    );
  }
}
