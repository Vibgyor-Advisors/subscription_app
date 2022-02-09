import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vibgyor/pages/drawer_screens/navigation_drawer.dart';
import 'package:vibgyor/pages/notification_page/notification.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Payment extends StatefulWidget {
  final uid, orderId, planId, planName, planPrice, startDate, endDate, val;

  const Payment({
    Key? key,
    this.uid,
    this.orderId,
    this.planId,
    required this.planName,
    required this.planPrice,
    required this.startDate,
    required this.endDate,
    required this.val,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _Payment();
  }
}

class _Payment extends State<Payment> {
  Future makePay(
    String uid,
    String orderId,
    String cusName,
    String planId,
    String planName,
    String planPrice,
    String startDate,
    String endDate,
    String val,
  ) async {
    /* Call API to GET and CHECK if USER is correct */
    var URL = Uri.parse(
        "https://www.jupitertouchlab.co.in/vibgyor/api/subscription/subsc_order.php");

    http.Response response = await http.post(URL,
        body: jsonEncode(<String, String>{
          "uid": "VIBSC008",
          "order_id": "ORDVIB1020",
          "cust_name": cusName,
          "plan_id": planId,
          "plan_name": planName,
          "plan_price": planPrice,
          "start_date": startDate,
          "end_date": endDate,
          "validity": val
        }));
    print(response.body);
  }

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              /* Image And Text */
              padding: const EdgeInsets.only(top: 30.0),
              child: Column(
                children: const [
                  Center(
                      child: Text(
                    'Vibgyor',
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24),
                  )),
                  Center(
                      child: Text(
                    'Advisors',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                  )),
                  SizedBox(
                    height: 12,
                  ),
                  Center(
                    child: Text(
                      "Payment Page",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 24.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Card(
                shadowColor: Colors.grey,
                elevation: 20,
                child: ListTile(
                  title: Text(
                    '9833224447@okbizaxis',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  trailing: SizedBox(
                    height: 70,
                    width: 70,
                    child: Image(
                      image: AssetImage(
                        'images/upi.png',
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 50.0, left: 110),
              child: Row(
                children: const [
                  Icon(
                    Icons.horizontal_rule,
                    size: 90,
                  ),
                  Text('or'),
                  Icon(
                    Icons.horizontal_rule,
                    size: 90,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 330,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Card(
                  shadowColor: Colors.grey,
                  borderOnForeground: true,
                  elevation: 20,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "You can Transfer money in our account: ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "AC/NO:  ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "5122001745",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "IFSC:  ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "FSHJ0000846",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      const Text(
                        "Once the payment is successful send "
                        "screenshot at: ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.normal),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                              icon: const Icon(MdiIcons.whatsapp,
                                  size: 50.0, color: Colors.green),
                              onPressed: () {
                                _launchUrl(
                                    "https://api.whatsapp.com/send/?phone=%2B918591402578&text&app_absent=0");
                              }),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _launchUrl(String url) async {
    if (await canLaunch(url)) {
      launch(url);
    }
  }
}
