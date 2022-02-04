// @dart=2.9
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vibgyor/pages/drawer_screens/navigation_drawer.dart';
import 'package:vibgyor/pages/welcome_page/welcome.dart';

void main() async {
  /* Initializing Firebase */
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Vibgyor",
      home: MyMainPage(/* Navigation to MainPage-> */),
    );
  }
}

class MyMainPage extends StatefulWidget {
  const MyMainPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyMainPage();
  }
}

class _MyMainPage extends State<MyMainPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.grey,
      body: Welcome(/* Navigation to Welcome Page-> */),
      drawer: NavigationDrawer(/* Navigation to Drawer-> */),
    );
  }
}

class LogoMain extends StatelessWidget {
  /* Image Containing */
  const LogoMain({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = const AssetImage("images/vibgyor_logo.jfif");
    Image image = Image(
      image: assetImage,
      width: 70,
      height: 70,
    );
    return Container(padding: EdgeInsets.zero, child: image);
  }
}
