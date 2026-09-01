import 'package:eps_pay/core/for_test_models/transaction.dart';
import 'package:eps_pay/core/theming/colors.dart';
import 'package:eps_pay/features/home_dashboard/logic/cubit/home_cubit.dart';
import 'package:eps_pay/features/home_dashboard/logic/cubit/home_state.dart';
import 'package:eps_pay/features/home_dashboard/ui/widgets/account_card.dart';
import 'package:eps_pay/features/home_dashboard/ui/widgets/header.dart';
import 'package:eps_pay/features/home_dashboard/ui/widgets/quick_actions.dart';
import 'package:eps_pay/features/home_dashboard/ui/widgets/recent_transactions.dart';
import 'package:eps_pay/features/home_dashboard/ui/widgets/title_and_seeall.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/routes.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class HomeDashboard extends StatefulWidget {
  const HomeDashboard({super.key});

  @override
  State<HomeDashboard> createState() => _HomeDashboardState();
}

class _HomeDashboardState extends State<HomeDashboard> {
  bool _balanceVisible = true;

  @override
  void initState() {
    FirebaseMessaging.instance.getToken().then((token) {
      print("FCM TOKEN: $token");
    });
    super.initState();
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
                  // Quick Actions Section
                  QuickActions(),

                  // Recent Transactions title and see all Section
                  TitleAndSeeall(),
                  // Recent Transactions List Section
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
