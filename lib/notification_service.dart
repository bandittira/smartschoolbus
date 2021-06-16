import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationApp extends StatefulWidget {
  @override
  _NotificationAppState createState() => _NotificationAppState();
}

class _NotificationAppState extends State<NotificationApp> {
  FlutterLocalNotificationsPlugin localNotificationsPlugin;
  @override
  void initState() {
    super.initState();
    var andoidInitialize = new AndroidInitializationSettings('app_icon');
    var iOSInicialize = new IOSInitializationSettings();
    var initialzationSettings =
        InitializationSettings(android: andoidInitialize, iOS: iOSInicialize);
    localNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    localNotificationsPlugin.initialize(initialzationSettings);
  }

  showNotification() {
    var andoidDetails = new AndroidNotificationDetails(
        "channel id", "channel name", "channel description",
        importance: Importance.high);
    var iosDetails = new IOSNotificationDetails();
    var generalNotificationDetails =
        new NotificationDetails(android: andoidDetails, iOS: iosDetails);
    localNotificationsPlugin.show(0, "Notif Title",
        "The Body of the Notification", generalNotificationDetails);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("test"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showNotification,
        child: Icon(Icons.notifications),
      ),
    );
  }
}
