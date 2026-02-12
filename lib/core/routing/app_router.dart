import 'package:eps_pay/core/routing/routes.dart';
import 'package:eps_pay/features/auth/ui/screens/login/login.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      default:
        return MaterialPageRoute(builder: (_) => const Text("data"));
    }
  }
}
