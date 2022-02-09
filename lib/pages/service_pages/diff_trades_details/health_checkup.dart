import 'package:flutter/material.dart';
import 'package:vibgyor/pages/drawer_screens/navigation_drawer.dart';
import 'package:vibgyor/pages/notification_page/notification.dart';
import 'package:vibgyor/pages/payment/payment.dart';

class HealthCheckUp extends StatefulWidget {
  const HealthCheckUp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HealthCheckUpServicesDescription();
  }
}

class _HealthCheckUpServicesDescription extends State<HealthCheckUp> {
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
                    const Padding(
                      padding: EdgeInsets.only(top:18, bottom: 19),
                      child: Text(
                        "Portfolio",
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
                            "Portfolio Checkup is a unique product that "
                            "provides a through analysis of the technical"
                            " parameters. This will help the client to "
                            "understand his portfolio in a better aspects",
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
                    Row(crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Icon(Icons.arrow_forward_ios),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(right:0),
                            child: Text(
                              "Here we aim to eliminate the sort-term noise "
                              "of the market and analyze the portfolio on"
                              " the more then 125 parameters",
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
                            "Quantitative fundamentals parameters\n like "
                                "earning, "
                            "dividend,  operating \nmargins Return and "
                            "Equity, Cash Flow\n related Parameters, "
                            "Financial, \nOperating leverage and growth "
                            "ratio for\n each of these parameters on multiple"
                            "\nduration like 3 and 5 years ",
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
                            "Both Fundamental and technical factors to drive "
                            "the recommendation",
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
                        Expanded(
                          child: Expanded(
                            child: Text(
                              "Stocks fit in either growth or value category, "
                              "with momentum and trend in favor",
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
                        Text(
                          "Return from change in environmental \nwhich benefits"
                          " the stocks over a \nperiod of time",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        )
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
                            "Independent of Sectors or Size.",
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
                            "Typical return expectation would be in excess of"
                            " 20%",
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
                            "Key Feature: Low risk multi sector calls",
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
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Payment(startDate: "20/01/2022", planName: 'INTRADAY',
                                      endDate: "20/02/2022", val: "1", planPrice: "3000",)));
                          },
                          child: const Text("Buy Now")),
                    )
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
