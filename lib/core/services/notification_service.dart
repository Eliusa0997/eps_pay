import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    // Request permission (important for Android 13+ and iOS)
    await _firebaseMessaging.requestPermission();

    // Get device token
    String? token = await _firebaseMessaging.getToken();
    print("FCM Token: $token");

    // Listen for notifications while app is open
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Notification received");
      print(message.notification?.title);
      print(message.notification?.body);
    });
  }
}
