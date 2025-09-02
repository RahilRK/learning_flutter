import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:meta/meta.dart';

import '../main.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final String TAG = "NotificationCubit";

  // Firebase Messaging instance (used for FCM push notifications)
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  // Local notification plugin instance (used to show notifications on device)
  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  NotificationCubit() : super(NotificationInitialState()) {
    // Initialize notifications when cubit is created
    _initNotifications();
  }

  /// ✅ Common navigation logic (no more repetition)
  void _handleNotificationNavigation(Map<String, dynamic> data) {
    final type = data['type'] ?? "normal";
    final id = data['id'];
    print("$TAG,🔗 Navigate by type: $type, id: $id");

    if (type == "detail") {
      navigatorKey.currentState?.pushNamed(
        "/DetailScreen",
        arguments: data,
      );
    } else {
      navigatorKey.currentState?.pushNamed(
        "/NormalScreen",
        arguments: data,
      );
    }
  }

  /// Initializes both Firebase Messaging and Local Notifications
  Future<void> _initNotifications() async {
    // 1. Ask user permission for push notifications (iOS + Android 13+)
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    print('$TAG,🔔 User granted permission: ${settings.authorizationStatus}');

    // 2. Initialize local notifications (for showing in-app notifications)
    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    const initSettings = InitializationSettings(android: androidInit);
    await _localNotifications.initialize(
      initSettings,
      // 👇 This handles taps on the notification
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        print("📩 $TAG, onDidReceiveNotificationResponse: ${response.payload}");

        if (response.payload != null && response.payload!.isNotEmpty) {
          try {
            final data = jsonDecode(response.payload!) as Map<String, dynamic>;
            _handleNotificationNavigation(data);
          } catch (e) {
            print("❌ $TAG, Failed to decode payload: $e");
          }
        }
      },
    );

    // 3. Get FCM token (unique device token for push notifications)
    String? token = await _messaging.getToken();
    print("$TAG,✅ FCM Token: $token");
    emit(NotificationTokenState(token: token));

    // 4. Listen to foreground messages (app open & active)
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("📩 $TAG, onMessage: ${message.data}");
      print(
          "📩 $TAG, Foreground notification Title: ${message.notification?.title}, Text/Body: ${message.notification?.body}");

      final title = message.notification?.title ?? "No Title";
      final body = message.notification?.body ?? "No Body";

      // Emit state so UI (BlocBuilder/BlocListener) can react
      emit(NotificationReceivedState(title: title, body: body));

      // 👉 include data
      _showLocalNotification(title, body, data: message.data);
    });

    // 5. Terminated state
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        print("$TAG,📩 getInitialMessage: ${message.data}");
        _handleNotificationNavigation(message.data);
      }
    });

    // 6. Background (user tapped system tray)
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print("$TAG,📩 onMessageOpenedApp: ${message.data}");
      _handleNotificationNavigation(message.data);
    });
  }

  /// Show local notification inside app (foreground/background)
  Future<void> _showLocalNotification(String title, String body,
      {Map<String, dynamic>? data}) async {
    const androidDetails = AndroidNotificationDetails(
      'default_channel_id', // Channel id (required)
      'Default', // Channel name (shown in settings)
      importance: Importance.max, // High priority
      priority: Priority.high, // Show immediately
    );

    const notificationDetails = NotificationDetails(android: androidDetails);

    // Put type or whole data as payload
    final payload = data != null ? jsonEncode(data) : '';

    // Actually display notification
    await _localNotifications.show(
        DateTime.now().millisecondsSinceEpoch ~/ 1000, // Unique ID
        title,
        body,
        notificationDetails,
        payload: payload);
  }
}

/// Background FCM handler
/// ⚠️ Must be a top-level function (not inside class)
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("NotificationCubit,📩 onBackgroundMessage: ${message.data}");

  // Initialize plugin (needed in background isolate)
  /*final plugin = FlutterLocalNotificationsPlugin();
  const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
  const initSettings = InitializationSettings(android: androidInit);
  await plugin.initialize(initSettings);

  const androidDetails = AndroidNotificationDetails(
    'default_channel_id',
    'Default',
    importance: Importance.max,
    priority: Priority.high,
  );

  const notificationDetails = NotificationDetails(android: androidDetails);

  // Show notification when app is in background/terminated
  await plugin.show(
    DateTime.now().millisecondsSinceEpoch ~/ 1000,
    message.notification?.title ?? "No Title",
    message.notification?.body ?? "No Body",
    notificationDetails,
  );*/
}
