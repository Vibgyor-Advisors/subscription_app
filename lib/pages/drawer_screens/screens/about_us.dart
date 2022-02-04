import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vibgyor/pages/notification_page/notification.dart';

import '../navigation_drawer.dart';


class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.account_circle),
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
      body: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20.0),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 18),
              child: Text(
                "About Us",
                style: TextStyle(fontSize: 40.0),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(18.0),
              color: Colors.grey[200],
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: const [
                    Text(
                      "Vibgyor Advisorsis a first-generation"
                      "Fintech firm focusing on providing the"
                      "best financial services to its clients."
                      "We work across varioussegments of the"
                      "financial services and provide a wide"
                      " range of services. ",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    SizedBox(
                      height: 38,
                    ),
                    Text(
                      "Vibgyor equity is a way through which we want to "
                      "help retail investor creating wealth and not "
                      "just short term gains. Here we believe in making "
                      "out investment it in a risk managed form with a "
                      "realistic approach towards the return",
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
