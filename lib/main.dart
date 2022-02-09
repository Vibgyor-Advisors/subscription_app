// @dart=2.9
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibgyor/pages/bottom_nav_screens/bottom_nav.dart';
import 'package:vibgyor/pages/welcome_page/welcome.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title // description
    importance: Importance.high,
    playSound: true);

// firebase background message handler
Future<void> _messageHandler(RemoteMessage event) async {
  print('background message ${event.notification?.body}');
}
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_messageHandler);

  FirebaseMessaging.instance.onTokenRefresh.listen((token) async {
    final pref = await SharedPreferences.getInstance();
    final String firebaseTokenPrefKey = 'Token';
    final String currentToken = pref.getString(firebaseTokenPrefKey);
    if (currentToken != token) {
      print('Token: ' + token);
      // add code here to do something with the updated token
      await pref.setString(firebaseTokenPrefKey, token);
    }
    print('Token: ' + token);
  });

/*  FirebaseMessaging.instance.getToken().then((value) async {
    token = await SharedPreferences.getInstance();
    token.setString('Token', value.toString());
    print('TOKEN:::$value');
  });*/
  SharedPreferences sharedPref = await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  final SharedPreferences sharedPref;
  const MyApp({Key key, this.sharedPref}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.black),
      debugShowCheckedModeBanner: false,
      title: "Vibgyor Equity",
      home: const Welcome(/* Navigation to MainPage-> */),
    );
  }
}
