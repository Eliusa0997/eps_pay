import 'package:eps_pay/core/di/dependency_injection.dart';
import 'package:eps_pay/core/routing/routes.dart';
import 'package:eps_pay/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:eps_pay/features/auth/login/ui/screens/login_screen.dart';
import 'package:eps_pay/features/auth/siginup/logic/cubit/signup_cubit.dart';
import 'package:eps_pay/features/auth/siginup/ui/screens/signup_screen.dart';
import 'package:eps_pay/features/bills_payment/ui/screens/bills_payments.dart';
import 'package:eps_pay/features/cards/ui/screens/cards_screen.dart';
import 'package:eps_pay/features/home_dashboard/logic/cubit/home_cubit.dart';
import 'package:eps_pay/features/home_dashboard/ui/screens/home_dashboard.dart';
import 'package:eps_pay/features/settings/ui/screens/onbording_screen.dart';
import 'package:eps_pay/features/settings/ui/screens/profile.dart';
import 'package:eps_pay/features/settings/ui/screens/splash_screen.dart';
import 'package:eps_pay/features/transfer/logic/cubit/resiver_cubit.dart';
import 'package:eps_pay/features/transfer/logic/cubit/transfer_cubit.dart';
import 'package:eps_pay/features/transfer/ui/screens/check_reciver_screen.dart';
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
      case Routes.signupScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignupCubit>(),
            child: const SignupScreen(),
          ),
        );

      // home Dashbord

      case Routes.homeDashboard:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<HomeCubit>()..emitHomeState(),
            child: const HomeDashboard(),
          ),
        );

      // Profile
      case Routes.profileSettingsScreen:
        return MaterialPageRoute(builder: (_) => const ProfileSettingsScreen());

      // Money transctions
      case Routes.transferMoney:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<TransferCubit>(),
            child: const TransferMoneyScreen(),
          ),
        );
      // Rciver Data
      case Routes.reciverData:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ReciverCubit>(),
            child: const CheckReciverScreen(),
          ),
        );
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
