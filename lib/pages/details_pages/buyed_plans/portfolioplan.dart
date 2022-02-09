import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibgyor/animation/rotationroute.dart';
import 'package:vibgyor/models/homemodel/homemodel.dart';
import 'package:http/http.dart' as http;
import 'package:vibgyor/pages/drawer_screens/navigation_drawer.dart';
import 'package:vibgyor/pages/notification_page/notification.dart';
import '../portfolio_details_page.dart';

class PortfolioPlan extends StatefulWidget {
  const PortfolioPlan({Key? key}) : super(key: key);

  @override
  _PortfolioPlanState createState() => _PortfolioPlanState();
}

class _PortfolioPlanState extends State<PortfolioPlan> {
  Future<void> secureScreen() async {
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }

  late SharedPreferences logindata;
  String uid = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    secureScreen();
    initial();
    postHomeData();
    setState(() {});
  }
  @override
  Future<void> dispose() async {
    super.dispose();
    await FlutterWindowManager.clearFlags(FlutterWindowManager.FLAG_SECURE);
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      uid = logindata.getString('uid')!;
    });
  }

  List<HomeModel> homeModelList = <HomeModel>[];
  bool isLoading = true;

  var url;

  Future postHomeData() async {
    url =
        "https://www.jupitertouchlab.co.in/subscription/api/portfolio.php";
    var finalUrl = Uri.parse(url);
    Response response = await http.post(finalUrl,
        body: jsonEncode(<String, String>{
          "uid": '"$uid"',
          "timeframe": 'PORTFOLIO',
        }));
    Map data = jsonDecode(response.body);
    setState(() {
      for (Map element in data["data"]) {
        try {
          HomeModel homeModel = HomeModel();
          homeModel = HomeModel.fromMap(element);
          homeModelList.add(homeModel);
          setState(() {
            isLoading = false;
          });
        } catch (e) {
          print('in catch:  ${e}');
        }
        ;
      }
    });

    /* Just to Debug \|/ */
    /*debugPrint("Response: " + response.body.toString());
    debugPrint("Status: " + (response.statusCode).toString());*/
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
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                shrinkWrap: true,
                itemCount: homeModelList.length,
                itemBuilder: (BuildContext context, int index) {
                  return buildCard(context, index);
                }));
  }

  Widget buildCard(BuildContext context, int index) {
    return Card(
        elevation: 16,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    homeModelList[index].timeFrame,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 29),
                  ),
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Stock Name',
                    style: TextStyle(
                        color: Colors.grey.shade500,
                        fontWeight: FontWeight.w900),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    homeModelList[index].stkName,
                    style: const TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Chip(
                    elevation: 8,
                    shadowColor: Colors.lightBlue.shade300,
                    backgroundColor: Colors.lightBlue.shade200,
                    label: Text(
                      homeModelList[index].date,
                      style: const TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 14,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Segment',
                    style: TextStyle(
                        color: Colors.grey.shade500,
                        fontWeight: FontWeight.w900),
                  ),
                  Text(
                    'Close Price',
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w900,
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    homeModelList[index].segment.toString(),
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '₹ ${homeModelList[index].closePrice.toString()}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                ],
              ),
              const SizedBox(
                height: 14,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Entry Range',
                    style: TextStyle(
                        color: Colors.grey.shade500,
                        fontWeight: FontWeight.w900),
                  ),
                  Text(
                    'RECO',
                    style: TextStyle(
                        color: Colors.grey.shade500,
                        fontWeight: FontWeight.w900),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    homeModelList[index].entryRange,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    homeModelList[index].reco,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          SizeRoute(
                              widget: PortfolioDetails(
                                  cmp: homeModelList[index].cmp.toString(),
                                  close_date: homeModelList[index].closeData,
                                  status: homeModelList[index].status,
                                  target2: homeModelList[index].target2,
                                  target1: homeModelList[index].target1,
                                  valGainLoss:
                                      homeModelList[index].valWtGainLoss,
                                  suggExpo: homeModelList[index].suggExpo,
                                  gainLoss: homeModelList[index].gainLoss,
                                  current_status: homeModelList[index].currentStatus)));
                    },
                    child: const Text(
                      'Details',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontFamily: 'Montserrat',
                          color: Colors.lightBlue,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
