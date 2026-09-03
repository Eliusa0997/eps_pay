import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:eps_pay/core/di/dependency_injection.dart';
import 'package:eps_pay/features/home_dashboard/logic/cubit/home_cubit.dart';

class NotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotifications() async {
    // Request notification permission
    await _firebaseMessaging.requestPermission();

    // Initialize local notifications
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(android: androidSettings);

    await _localNotifications.initialize(settings: initializationSettings);

    // Create Android notification channel
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'epspay_notifications',
      'EpsPay Notifications',
      description: 'Notifications for EpsPay',
      importance: Importance.high,
    );

    await _localNotifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(channel);

    // Get FCM token
    String? fcmToken = await _firebaseMessaging.getToken();

    print("FCM Token: $fcmToken");

    // Foreground notifications
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      print("Notification received");
      print(message.notification?.title);
      print(message.notification?.body);

      // Show notification while app is open
      await _showLocalNotification(message);

      // Refresh home screen balance
      getIt<HomeCubit>().emitHomeState();
    });
  }

  Future<void> _showLocalNotification(RemoteMessage message) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
          'epspay_notifications',
          'EpsPay Notifications',
          channelDescription: 'Notifications for EpsPay',
          importance: Importance.high,
          priority: Priority.high,
          playSound: true,
        );

    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidDetails,
    );

    await _localNotifications.show(
      id: DateTime.now().millisecondsSinceEpoch ~/ 1000,
      title: message.notification?.title ?? 'EpsPay',
      body: message.notification?.body ?? '',
      notificationDetails: notificationDetails,
    );
  }
}
