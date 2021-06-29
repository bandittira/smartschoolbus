// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:smartschoolbus/main.dart';

// class Notificationpage extends StatefulWidget {
//   @override
//   _NotificationpageState createState() => _NotificationpageState();
// }

//   FlutterLocalNotificationsPlugin localNotificationsPlugin;
//   void initState() {
//     var andoidInitialize = new AndroidInitializationSettings('app_icon');
//     var iOSInicialize = new IOSInitializationSettings();
//     var initialzationSettings =
//         InitializationSettings(android: andoidInitialize, iOS: iOSInicialize);
//     localNotificationsPlugin = new FlutterLocalNotificationsPlugin();
//     localNotificationsPlugin.initialize(initialzationSettings);
//   }

// class _NotificationpageState extends State<Notificationpage> {

//   showNotification() {
//     var andoidDetails = new AndroidNotificationDetails(
//         "channelId", "Local Notification", "channel description",
//         importance: Importance.high);
//     var iosDetails = new IOSNotificationDetails();
//     var generalNotificationDetails =
//         new NotificationDetails(android: andoidDetails, iOS: iosDetails);
//     localNotificationsPlugin.show(0, "Notif Title",
//         "The Body of the Notification", generalNotificationDetails);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text("test"),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: showNotification,
//         child: Icon(Icons.notifications),
//       ),
//     );
//   }
// }
