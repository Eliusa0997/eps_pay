import 'package:eps_pay/core/di/dependency_injection.dart';
import 'package:eps_pay/core/routing/app_router.dart';
import 'package:eps_pay/eps_pay.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/services/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();
  await NotificationService().initNotifications();
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
