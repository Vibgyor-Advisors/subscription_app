import 'package:flutter/material.dart';
import 'package:vibgyor/animation/bouncyanimation.dart';
import 'package:vibgyor/pages/drawer_screens/navigation_drawer.dart';
import 'package:vibgyor/pages/notification_page/notification.dart';
import 'package:vibgyor/pages/payment/payment.dart';


class IntraServicesDescription extends StatefulWidget {
  const IntraServicesDescription({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _IntraServicesDescription();
  }
}

class _IntraServicesDescription extends State<IntraServicesDescription> {
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
      drawer: const NavigationDrawer(),
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
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        "IntraDay Trade",
                        style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Icon(Icons.arrow_forward_ios),
                        Expanded(
                          child: Text(
                            " IntraDay trades endeavor to benefit "
                            "from the daily volatility, direction and trend in the market",
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
                          child: Padding(
                            padding: EdgeInsets.only(right: 159.0),
                            child: Text(
                              "2-3 Trade Ideas daily",
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
                          "Both in the Cash and Future segment",
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
                          "No calls in illiquid stocks",
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Icon(Icons.arrow_forward_ios),
                        Expanded(
                          child: Text(
                            "Will provide full details like the Segment, Stock"
                            "Name, CMP, Entry Range, Stop-loss & Target.",
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
                          "Key Feature: Excellent Risk \nManagement.",
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
                      height: 60,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context, BouncyAnimation(widget: Payment
                                (startDate: "20/01/2022", planName: 'INTRADAY',
                                endDate: "20/02/2022", val: "1", planPrice: "3000",)));
                            },
                            child: const Text("Buy Now")))
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
