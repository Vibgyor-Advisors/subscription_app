import 'package:flutter/material.dart';
import 'package:vibgyor/pages/notification_page/notification.dart';
import '../navigation_drawer.dart';

class Settings extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
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
      drawer: NavigationDrawer(),
      body: Padding(
        padding: const EdgeInsets.only(top:18.0),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              children: [
                const Text(
                  "Settings",
                  style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.w500
                ),
                ),
                const SizedBox(height: 20,),
                Row(
                  children: const [
                    Text(
                        "Change Password",
                      style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                  ],
                ),
                /*Row(
                  children: [
                    const Text(
                        "Notification Pop Up",
                      style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    const SizedBox(width: 100,),
                    Switch(value: false, onChanged: (value){})
                  ],
                ),*/
                /*Row(
                  children: [
                    const Text(
                        "Dark Theme",
                      style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    const SizedBox(width: 180,),

                    Switch(value: false, onChanged: (value){})

                  ],
                ),*/
                Row(
                  children: [
                    const Text(
                        "Save Info",
                      style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    const SizedBox(width: 210,),

                    Switch(value: false, onChanged: (value){})

                  ],
                ),
                Row(
                  children: [
                    const Text(
                        "Two Factor Authentication",
                      style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    const SizedBox(width: 25,),

                    Switch(value: false, onChanged: (value){})
                  ],
                ),
                const SizedBox(height: 30,),
                const Padding(
                  padding: EdgeInsets.only(right: 270.0),
                  child: Text(
                      "FeedBack",
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.normal
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),

        ),
      ),
    );
  }
}