import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:uuid/uuid.dart';
import 'package:vibgyor/animation/rotationroute.dart';
import 'package:vibgyor/pages/drawer_screens/navigation_drawer.dart';
import 'package:vibgyor/models/servicemodel/servicemodel.dart';
import 'package:vibgyor/pages/notification_page/notification.dart';
import 'package:vibgyor/pages/service_pages/diff_trades_details/health_checkup.dart';
import 'package:vibgyor/pages/service_pages/diff_trades_details/intra_service_description.dart';
import 'package:vibgyor/pages/service_pages/diff_trades_details/portfolio_services.dart';
import 'package:vibgyor/pages/service_pages/diff_trades_details/positional_services.dart';
import 'package:vibgyor/pages/service_pages/diff_trades_details/sectoral_service_description.dart';
import 'package:vibgyor/pages/service_pages/diff_trades_details/swing_service_description.dart';

class Services extends StatefulWidget {
  final name;
  final UID;

  const Services({Key? key, required this.name, required this.UID,}) : super
      (key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Services();
  }
}

class _Services extends State<Services> {
  List<ServiceModel> serviceModelList = <ServiceModel>[];
  bool isLoading = true; // Check API Loading state if it is not loaded it
  // will show circular progress circle
  late Map data; // stores response body from API
  var uuid = Uuid();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHomeData();
    setState(() {});
  }

  getHomeData() async {
    /* Call API to GET Data  */
    Map element;
    String url =
        "https://www.jupitertouchlab.co.in/subscription/api/trade_plans.php";
    http.Response response = await get(Uri.parse(url));
    data = jsonDecode(response.body);
    setState(() {
      for (element in data["data"]) {
        try {
          ServiceModel serviceModel = ServiceModel();
          serviceModel = ServiceModel.fromMap(element);
          serviceModelList.add(serviceModel);
          setState(() {
            isLoading = false;
          });
        } catch (e) {
          print(e);
        }
        ;
      }
    });
  }

  Future makePay(
      String UUID,
    String cus_name,
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
          "uid": UUID.toString(),
          "order_id": uuid.v1().toString(),
          "cust_name": cus_name.toString(),
          "plan_id": planId,
          "plan_name": planName,
          "plan_price": planPrice,
          "start_date": startDate,
          "end_date": endDate,
          "validity": val
        }));

    print(response.body);
    setState(() {
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(response.body);
        if (data["ResponseCode"] == '200') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(data["ResponseMsg"]),
          ));
        } else if (data["ResponseCode"] == '401') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(data["ResponseMsg"]),
          ));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // APP BAR
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
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                shrinkWrap: true,
                itemCount: serviceModelList.length,
                itemBuilder: (BuildContext context, int index) {
                  return buildCard(context, index);
                }),
      ),
    );
  }

  Widget buildCard(BuildContext context, int index) {
    return Card(
      elevation: 16,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Padding(
              /* Displays Name OF Trade */
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    serviceModelList[index].name,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 29),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 28,
            ),
            Row(
              /* Text for TagLine and Date */
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'TagLine',
                  style: TextStyle(
                      color: Colors.grey.shade500, fontWeight: FontWeight.w900),
                ),
                Text(
                  'Date',
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontWeight: FontWeight.w900,
                  ),
                )
              ],
            ),
            Row(
              /* Displays Tag And Time Stamp Of Trade */
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  serviceModelList[index].tag,
                  style: const TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Text(
                  serviceModelList[index].timeStamp,
                  style: const TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ],
            ),
            const SizedBox(
              height: 14,
            ),
            Row(
              /* Text for Duration and Cost  */
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Duration',
                  style: TextStyle(
                      color: Colors.grey.shade500, fontWeight: FontWeight.w900),
                ),
                Text(
                  'Cost',
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontWeight: FontWeight.w900,
                  ),
                )
              ],
            ),
            Row(
              /* Displays Cost And Duration Of Trade */
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  serviceModelList[index].duration.toString(),
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '₹ ${serviceModelList[index].cost.toString()}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ],
            ),
            const SizedBox(
              height: 14,
            ),
            Row(
              /* Text for Details and Status */
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Details',
                  style: TextStyle(
                      color: Colors.grey.shade500, fontWeight: FontWeight.w900),
                ),
                Text(
                  'Status',
                  style: TextStyle(
                      color: Colors.grey.shade500, fontWeight: FontWeight.w900),
                ),
              ],
            ),
            Row(
              /* Displays Details And Status Of Trade */
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  serviceModelList[index].detail,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  serviceModelList[index].status,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              /* Link to another Page for More Details of particular trade */
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    if (serviceModelList[index].name.toString() ==
                        'Intraday Trade') {
                      Navigator.push(context,
                          SizeRoute(widget: const IntraServicesDescription()));
                    } else if (serviceModelList[index].name.toString() ==
                        'Swing '
                            'Trade') {
                      Navigator.push(context,
                          SizeRoute(widget: SwingServicesDescription()));
                    } else if (serviceModelList[index].name.toString() ==
                        'Secto'
                            'ral Trade'
                            '') {
                      Navigator.push(context,
                          SizeRoute(widget: SectoralServicesDescription()));
                    } else if (serviceModelList[index].name.toString() ==
                        'Posi'
                            'tional Trade') {
                      Navigator.push(context,
                          SizeRoute(widget: const PositionalServices()));
                    } else if (serviceModelList[index].name.toString() ==
                        'Port'
                            'folio Ideas') {
                      Navigator.push(context,
                          SizeRoute(widget: const PortfolioServices()));
                    } else if (serviceModelList[index].name.toString() ==
                        'Portf'
                            'olio') {
                      Navigator.push(
                          context, SizeRoute(widget: const HealthCheckUp()));
                    }
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
                InkWell(
                  onTap: () {
                    var newName =serviceModelList[index].name.substring(0,
                        (serviceModelList[index].name).length-5).toUpperCase();
                    makePay(
                      widget.UID,
                        widget.name,
                        '${serviceModelList[index].id}',
                        newName,
                        '${serviceModelList[index].cost}',
                        '${serviceModelList[index].timeStamp}',
                        '${serviceModelList[index].timeStamp}',
                        '${serviceModelList[index].status}');
                  },
                  child: Text(
                    "Buy",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.lightBlue,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
