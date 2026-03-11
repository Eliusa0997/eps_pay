import 'package:eps_pay/core/di/dependency_injection.dart';
import 'package:eps_pay/core/routing/app_router.dart';
import 'package:eps_pay/eps_pay.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  setupGetIt();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      child: EpsPay(appRouter: AppRouter()),
    ),
  );
}
