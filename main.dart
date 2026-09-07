import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/home_dashboard.dart';
import 'screens/accounts_screen.dart';
import 'screens/transfer_money_screen.dart';
import 'screens/bills_payments_screen.dart';
import 'screens/cards_screen.dart';
import 'screens/transaction_history_screen.dart';
import 'screens/profile_settings_screen.dart';
import 'constants/colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const BankakApp());
}

class BankakApp extends StatelessWidget {
  const BankakApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bankak',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          primary: AppColors.primary,
          secondary: AppColors.secondary,
        ),
        scaffoldBackgroundColor: AppColors.background,
        fontFamily: 'SF Pro Display',
        appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeDashboard(),
        '/accounts': (context) => const AccountsScreen(),
        '/transfer': (context) => const TransferMoneyScreen(),
        '/bills': (context) => const BillsPaymentsScreen(),
        '/cards': (context) => const CardsScreen(),
        '/transactions': (context) => const TransactionHistoryScreen(),
        '/profile': (context) => const ProfileSettingsScreen(),
      },
    );
  }
}
