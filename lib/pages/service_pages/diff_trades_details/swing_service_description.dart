import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vibgyor/pages/drawer_screens/navigation_drawer.dart';
import 'package:vibgyor/pages/notification_page/notification.dart';
import 'package:vibgyor/pages/payment/payment.dart';

class SwingServicesDescription extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SwingServicesDescription();
  }
}

class _SwingServicesDescription extends State<SwingServicesDescription> {
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
      body: Material(
        child: ListView(
          children: [
            const SizedBox(
              height: 15,
            ),
            Container(
                margin: const EdgeInsets.all(10.0),
                color: Colors.grey[200],
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      "Swing Trade",
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Icon(Icons.arrow_forward_ios),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 0.0),
                            child: Text(
                              "Swing trade is a style of trading that "
                              "attempts to capture shots to medium term "
                              "gains in a stock over a period of a few "
                              "days to several week",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Icon(Icons.arrow_forward_ios),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 0),
                            child: Text(
                              "It ranges from BTST or STBT to few days. The "
                              "target are achieved in between 5tp 15 "
                              "trading sessions",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: const [
                        Icon(Icons.arrow_forward_ios),
                        Text(
                          "Fundamental, Technical and Market \nPsychology "
                          "factors(Fund Flow, \nEvents etc.) to be the "
                          "basics",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: const [
                        Icon(Icons.arrow_forward_ios),
                        Text(
                          "1-2 Trade advice per week.",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: const [
                        Icon(Icons.arrow_forward_ios),
                        Expanded(
                          child: Text(
                            "Both Cash flow and Future Segment.",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Icon(Icons.arrow_forward_ios),
                        Text(
                          "Will Provide full details like the \nsegment,"
                              "Stock Name, CMP, \nEntry Range, stop-loss & "
                              "Target",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: const [
                        Icon(Icons.arrow_forward_ios),
                        Expanded(
                          child: Text(
                            "Endeavour to deliver target return of 1% to 1.5% on"
                            "intraDay basis",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: const [
                        Icon(Icons.arrow_forward_ios),
                        Expanded(
                          child: Text(
                            "Key Feature: Superior Reading of the market pulse",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Payment(startDate: "20/01/2022", planName: 'INTRADAY',
                                    endDate: "20/02/2022", val: "1", planPrice: "3000",)));
                        },
                        child: const Text("Buy Now"))
                  ],
                )),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({required String text, required IconData icon}) {
    const color = Colors.white;
    const hoverColor = Colors.white;
    return ListTile(
      hoverColor: hoverColor,
      leading: Icon(
        icon,
        color: color,
        size: 30,
      ),
      title: Text(
        text,
        style: const TextStyle(
            color: color, fontSize: 20, decoration: TextDecoration.underline),
      ),
      onTap: () {},
    );
  }
}
