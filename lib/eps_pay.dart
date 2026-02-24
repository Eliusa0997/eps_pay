import 'package:eps_pay/core/routing/app_router.dart';
import 'package:eps_pay/core/routing/routes.dart';
import 'package:eps_pay/features/auth/login/ui/screens/login_screen.dart';
import 'package:flutter/material.dart';

class EpsPay extends StatelessWidget {
  final AppRouter appRouter;
  const EpsPay({super.key, required this.appRouter});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),

      onGenerateRoute: appRouter.generateRoute,
      // home:  Navigator.pushNamed(context, Routes.homeDashboard),
    );
  }
}
