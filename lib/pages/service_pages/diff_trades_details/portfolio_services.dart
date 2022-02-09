import 'package:flutter/material.dart';
import 'package:vibgyor/pages/drawer_screens/navigation_drawer.dart';
import 'package:vibgyor/pages/notification_page/notification.dart';
import 'package:vibgyor/pages/payment/payment.dart';

class PortfolioServices extends StatefulWidget {
  const PortfolioServices({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PortfolioServicesDescription();
  }
}

class _PortfolioServicesDescription extends State<PortfolioServices> {
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
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Portfolio Ideas",
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
                            "24-36 advice in 3-year period.",
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
                          child: Padding(
                            padding: EdgeInsets.only(right: 0),
                            child: Text(
                              "Stocks which are expected to return "
                              "strong returns between 1 to 3 year holding"
                              " period.",
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
                          "Typically BUY and HOLD",
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
                            "Fundamental factors to drive "
                            "the recommendations",
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
                              "Anti-cycle investing and out of flavour stocks"
                              " due to some recent event, etc to be used "
                              "to reduce risks and improve returns",
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
                          child: Text(
                            "Stocks fit in either growth or value category.",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                color: Colors.black),
                          ),
                        )
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
                            "Independent of Sectors or Size, bias towards "
                            "large cap to reduce risk.",
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
                          child: Text(
                            "These ideas capture the changes in sectors due "
                            "to policy, supply demands and other factors "
                            "effecting the stock positivity over a "
                            "longer-term horizon",
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
                            "These stocks have potential of generating huge "
                            "risk adjusted returns over a longer horizon "
                            "and could be potential multi-baggier",
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
                            "Key Feature: Low risk and High return.",
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
                          child: const Text("Buy Now"))
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
