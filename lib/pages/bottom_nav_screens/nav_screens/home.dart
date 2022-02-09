import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:vibgyor/animation/bouncyanimation.dart';
import 'package:vibgyor/pages/details_pages/buyed_plans/intradayplan.dart';
import 'package:vibgyor/pages/details_pages/buyed_plans/portfolioplan.dart';
import 'package:vibgyor/pages/details_pages/buyed_plans/positional_plan.dart';
import 'package:vibgyor/pages/details_pages/buyed_plans/sectrolplan.dart';
import 'package:vibgyor/pages/details_pages/buyed_plans/swingplan.dart';
import 'package:vibgyor/pages/drawer_screens/navigation_drawer.dart';
import 'package:vibgyor/pages/notification_page/notification.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Home();
  }
}

class _Home extends State<Home> {
  Future<void> secureScreen() async {
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }

  @override
  void initState() {
    secureScreen();
    super.initState();
  }

  @override
  Future<void> dispose() async {
    super.dispose();
    await FlutterWindowManager.clearFlags(FlutterWindowManager.FLAG_SECURE);
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
        drawer: const NavigationDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          BouncyAnimation(
                              widget: const IndradayPlan(
                                  /*
                                Navigate to SignUp Page -> */
                                  )));
                    },
                    child: SizedBox(
                      height: 120,
                      width: MediaQuery.of(context).size.width * 1,
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          shadowColor: Colors.black,
                          elevation: 16,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Intraday',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 22),
                                ),
                                Icon(Icons.chevron_right)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          BouncyAnimation(
                              widget: const PortfolioPlan(
                                  /*
                                Navigate to SignUp Page -> */
                                  )));
                    },
                    child: SizedBox(
                      height: 120,
                      width: MediaQuery.of(context).size.width * 1,
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          shadowColor: Colors.black,
                          elevation: 16,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Portfolio',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 22),
                                ),
                                Icon(Icons.chevron_right)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          BouncyAnimation(
                              widget: const SectrolPlan(
                                  /*
                                Navigate to SignUp Page -> */
                                  )));
                    },
                    child: SizedBox(
                      height: 120,
                      width: MediaQuery.of(context).size.width * 1,
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          shadowColor: Colors.black,
                          elevation: 16,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Sectoral',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 22),
                                ),
                                Icon(Icons.chevron_right)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          BouncyAnimation(
                              widget: const PositionalPlan(
                                  /*
                                Navigate to SignUp Page -> */
                                  )));
                    },
                    child: SizedBox(
                      height: 120,
                      width: MediaQuery.of(context).size.width * 1,
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          shadowColor: Colors.black,
                          elevation: 16,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Positional',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 22),
                                ),
                                Icon(Icons.chevron_right)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          BouncyAnimation(
                              widget: const SwingPlan(
                                  /*
                                Navigate to SignUp Page -> */
                                  )));
                    },
                    child: SizedBox(
                      height: 120,
                      width: MediaQuery.of(context).size.width * 1,
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          shadowColor: Colors.black,
                          elevation: 16,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Swing',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 22),
                                ),
                                Icon(Icons.chevron_right)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
