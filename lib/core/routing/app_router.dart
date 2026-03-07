import 'package:eps_pay/core/di/dependency_injection.dart';
import 'package:eps_pay/core/routing/routes.dart';
import 'package:eps_pay/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:eps_pay/features/auth/login/ui/screens/login_screen.dart';
import 'package:eps_pay/features/auth/siginup/logic/cubit/signup_cubit.dart';
import 'package:eps_pay/features/auth/siginup/ui/screens/signup_screen.dart';
import 'package:eps_pay/features/bills_payment/logic/cubit/electricity_cubit.dart';
import 'package:eps_pay/features/bills_payment/logic/cubit/internet_cubit.dart';
import 'package:eps_pay/features/bills_payment/logic/cubit/mobile_recharge_cubit.dart';
import 'package:eps_pay/features/bills_payment/logic/cubit/water_cubit.dart';
import 'package:eps_pay/features/bills_payment/ui/screens/bills_payments_screen.dart';
import 'package:eps_pay/features/bills_payment/ui/screens/electricity_screen.dart';
import 'package:eps_pay/features/bills_payment/ui/screens/internet_screen.dart';
import 'package:eps_pay/features/bills_payment/ui/screens/mobile_recharge_screen.dart';
import 'package:eps_pay/features/bills_payment/ui/screens/water_screen.dart';
import 'package:eps_pay/features/transfer/logic/cubit/deposit_cubit.dart';
import 'package:eps_pay/features/transfer/logic/cubit/withdraw_cubit.dart';
import 'package:eps_pay/features/transfer/ui/screens/deposit_screen.dart';
import 'package:eps_pay/features/transfer/ui/screens/withdraw_screen.dart';
import 'package:eps_pay/features/home_dashboard/logic/cubit/home_cubit.dart';
import 'package:eps_pay/features/home_dashboard/ui/screens/home_dashboard.dart';
import 'package:eps_pay/features/settings/ui/screens/onbording_screen.dart';
import 'package:eps_pay/features/settings/ui/screens/profile.dart';
import 'package:eps_pay/features/transfer/data/model/reciver_response.dart';
import 'package:eps_pay/features/transfer/logic/cubit/resiver_cubit.dart';
import 'package:eps_pay/features/transfer/logic/cubit/transfer_cubit.dart';
import 'package:eps_pay/features/transfer/ui/screens/check_reciver_screen.dart';
import 'package:eps_pay/features/transfer/ui/screens/transfer_money_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/home_dashboard/logic/cubit/transactions_history_cubit.dart';
import '../../features/home_dashboard/ui/screens/transactions_history_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // Onbording
      case Routes.onBordingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());

      // Auth
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.signupScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignupCubit>(),
            child: const SignupScreen(),
          ),
        );

      // home Dashbord
      case Routes.homeDashboardScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<HomeCubit>()..emitHomeState(),
            child: const HomeDashboard(),
          ),
        );

      // Transactions History
      case Routes.transactionsHistoryScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                getIt<TransactionsHistoryCubit>()
                  ..emitTransactionsHistoryState(),
            child: const TransactionHistoryScreen(),
          ),
        );

      // Profile
      case Routes.profileSettingsScreen:
        return MaterialPageRoute(builder: (_) => const ProfileSettingsScreen());

      // Money transctions
      case Routes.transferMoneyScreen:
        final receiverData = settings.arguments as ReciverResponse;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<TransferCubit>(),
            child: TransferMoneyScreen(receiver: receiverData),
          ),
        );
      // Rciver Data
      case Routes.reciverDataScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ReciverCubit>(),
            child: const CheckReciverScreen(),
          ),
        );

      // Bills & Payment
      case Routes.billsBaymentsScreen:
        return MaterialPageRoute(builder: (_) => const BillsPaymentsScreen());

      case Routes.electricityScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ElectricityCubit>(),
            child: const ElectricityScreen(),
          ),
        );

      case Routes.waterScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<WaterCubit>(),
            child: const WaterScreen(),
          ),
        );

      case Routes.internetScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<InternetCubit>(),
            child: const InternetScreen(),
          ),
        );

      case Routes.mobileRechargeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<MobileRechargeCubit>(),
            child: const MobileRechargeScreen(),
          ),
        );

      // Money transctions
      case Routes.depositScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<DepositCubit>(),
            child: const DepositScreen(),
          ),
        );
      case Routes.withdrawScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<WithdrawCubit>(),
            child: const WithdrawScreen(),
          ),
        );

      // In Case any thing gose rong
      default:
        return MaterialPageRoute(builder: (_) => const Text("data"));
    }
  }
}
