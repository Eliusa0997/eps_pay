import 'package:eps_pay/core/di/dependency_injection.dart';
import 'package:eps_pay/core/routing/routes.dart';
import 'package:eps_pay/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:eps_pay/features/auth/login/ui/screens/login/login_screen.dart';
import 'package:eps_pay/features/bills_payment/ui/screens/bills_payments.dart';
import 'package:eps_pay/features/cards/ui/screens/cards_screen.dart';
import 'package:eps_pay/features/home/ui/screens/home_dashboard.dart';
import 'package:eps_pay/features/onbording/ui/screens/onbording_screen.dart';
import 'package:eps_pay/features/onbording/ui/screens/splash_screen.dart';
import 'package:eps_pay/features/transfer/ui/screens/transfer_money_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // splash and onbording
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
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

      // home Dashbord

      case Routes.homeDashboard:
        return MaterialPageRoute(builder: (_) => const HomeDashboard());

      // Money transctions
      case Routes.transferMoney:
        return MaterialPageRoute(builder: (_) => const TransferMoneyScreen());
      case Routes.billsBayments:
        return MaterialPageRoute(builder: (_) => const BillsPaymentsScreen());
      case Routes.recharge:
        return MaterialPageRoute(builder: (_) => const TransferMoneyScreen());
      case Routes.cards:
        return MaterialPageRoute(builder: (_) => const CardsScreen());

      // In Case any thing gose rong
      default:
        return MaterialPageRoute(builder: (_) => const Text("data"));
    }
  }
}
