import 'package:eps_pay/core/di/dependency_injection.dart';
import 'package:eps_pay/core/routing/app_router.dart';
import 'package:eps_pay/eps_pay.dart';
import 'package:flutter/material.dart';

void main() {
  setupGetIt();
  runApp(EpsPay(appRouter: AppRouter()));
}
