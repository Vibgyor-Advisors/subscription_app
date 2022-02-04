import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:vibgyor/animation/rotationroute.dart';
import 'package:vibgyor/pages/drawer_screens/navigation_drawer.dart';
import 'package:vibgyor/models/servicemodel/servicemodel.dart';
import 'package:vibgyor/pages/notification_page/notification.dart';
import 'package:vibgyor/pages/payment/payment.dart';
import 'package:vibgyor/pages/service_pages/diff_trades_details/intra_service_description.dart';

class Services extends StatefulWidget {
  const Services({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Services();
  }
}

class _Services extends State<Services> {
  /* Stores Data Provided by API */
  List<ServiceModel> serviceModelList = <ServiceModel>[];
  bool isLoading = true; // Check API Loading state if it is not loaded it
  // will show circular progress circle
  late Map data; // stores response body from API

  getHomeData() async {
    /* Call API to GET Data  */
    Map element;
    String url =
        "https://globaltechnolabs.com/VibyorLoanCRM/api/subscription/trade-plans.php";
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHomeData();
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
                    Navigator.push(context,
                        SizeRoute(widget: const IntraServicesDescription()));
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
                MaterialButton(
                  /* BUY NOW button */
                  elevation: 8,
                  hoverElevation: 50,
                  splashColor: Colors.lightBlue.shade500,
                  color: Colors.lightBlue.shade300,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                    18,
                  )),
                  onPressed: () {
                    Navigator.push(context, SizeRoute(widget: Payment()));
                  },
                  child: const Text(
                    'Buy Now',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
