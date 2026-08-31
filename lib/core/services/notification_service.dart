import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotifications() async {
    // Request Firebase notification permission (important for Android 13+ and iOS)
    await _firebaseMessaging.requestPermission();

    // Initialize local notifications
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(android: androidSettings);

    await _localNotifications.initialize(settings: initializationSettings);

    // Get device token
    String? fcmToken = await _firebaseMessaging.getToken();
    print("FCM Token: $fcmToken");

    // Listen for notifications while app is open
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Notification received");
      print(message.notification?.title);
      print(message.notification?.body);
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
        );

    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidDetails,
    );

    await _localNotifications.show(
      id: message.hashCode,
      title: message.notification?.title ?? 'EpsPay',
      body: message.notification?.body ?? '',
      notificationDetails: notificationDetails,
    );
  }
}
