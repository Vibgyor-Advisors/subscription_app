import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  _NotificationViewState createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  var messege;
  var messege_back;
  var listen;

  @override
  void initState() {
    super.initState();

    // firebase background message handler
    Future<void> _messageHandler(RemoteMessage event) async {
      messege_back = event.notification!.title.toString();
      print('background message ${event.notification?.body}');
    }

    FirebaseMessaging.onBackgroundMessage(_messageHandler);

    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      messege = event.notification!.body;
      print("message received");
      print(event.notification!.body);
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Notification"),
              content: Text(event.notification!.body!),
              actions: [
                TextButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    });

    listen =
        FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new message open app event was published');
      showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: Text('${message.notification?.title}'),
              content: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text('${message.notification?.body}')],
                ),
              ),
            );
          });
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
              icon: const Icon(Icons.account_circle),
              onPressed: () => Scaffold.of(context).openDrawer()),
        ),
        title: const Image(
          image: AssetImage('images/logo.png'),
          width: 70.0,
          height: 70.0,
        ),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.notifications_active),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return NotificationView();
                }));
              }),
        ],
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.grey,
      ),
      body: Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                children: [
                  Container(
                      height: 40,
                      width: double.infinity,
                      color: Colors.black26,
                      child: Column(
                        children: [
                          Center(
                            child: Text(
                              messege == null ? '' : messege,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
