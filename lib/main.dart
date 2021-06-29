import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:smartschoolbus/screens/mainPage/mainPage.dart';
import 'package:smartschoolbus/screens/sign_in/components/auth.dart';
import 'package:smartschoolbus/wrapper.dart';
import 'package:smartschoolbus/screens/sign_in/components/user.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return StreamProvider<Firebaseusertest>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}

class NotificationApp extends StatefulWidget {
  @override
  _NotificationAppState createState() => _NotificationAppState();
}
String messageTitle = "Empty";
String notificationAlert = "alert";

FirebaseMessaging messaging = FirebaseMessaging.instance;

class _NotificationAppState extends State<NotificationApp> {
  FlutterLocalNotificationsPlugin localNotificationsPlugin;
  void initState() {
    super.initState();
    var andoidInitialize = new AndroidInitializationSettings('app_icon.png');
    var iOSInicialize = new IOSInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    var initialzationSettings =
        InitializationSettings(android: andoidInitialize, iOS: iOSInicialize);
    localNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    localNotificationsPlugin.initialize(initialzationSettings,
        onSelectNotification: selectNotification);
  }

  showNotification() {
    var andoidDetails = new AndroidNotificationDetails(
        "channelId", "Local Notification", "channel description",
        importance: Importance.high, priority: Priority.high, showWhen: false);
    var iosDetails = new IOSNotificationDetails();
    var generalNotificationDetails =
        new NotificationDetails(android: andoidDetails, iOS: iosDetails);
    localNotificationsPlugin.show(0, "Notif Title",
        "The Body of the Notification", generalNotificationDetails);
  }

  Future onDidReceiveLocalNotification(
      int id, String title, String body, String payload) async {
    // display a dialog with the notification details, tap ok to go to another page
    showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(body),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: Text('Ok'),
            onPressed: () async {
              Navigator.of(context, rootNavigator: true).pop();
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotificationApp(),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  Future selectNotification(String payload) async {
    if (payload != null) {
      debugPrint('notification payload: $payload');
    }
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
              title: new Text('Notification'),
              content: new Text('$payload'),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("test"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showNotification();
        },
        child: Icon(Icons.notifications),
      ),
    );
  }
}
