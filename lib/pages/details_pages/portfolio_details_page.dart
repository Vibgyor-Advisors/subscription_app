import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vibgyor/pages/notification_page/notification.dart';

class PortfolioDetails extends StatelessWidget {
  String cmp;
  String target2;
  String target1;
  String status;
  String valGainLoss;
  String suggExpo;
  String close_date;
  String gainLoss;
  String current_status;
  PortfolioDetails(
      {Key? key,
        required this.cmp,
        required this.close_date,
        required this.status,
        required this.target2,
        required this.target1,
        required this.valGainLoss,
        required this.suggExpo,
        required this.gainLoss,
        required this.current_status,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
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
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Card(
            color: Colors.teal.shade100,
            shape: const RoundedRectangleBorder(
              side: BorderSide(color: Colors.white70, width: 5),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
            ),
            margin: const EdgeInsets.all(20.0),
            elevation: 20,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'CMP',
                        style: TextStyle(
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.w900),
                      ),
                      Text(
                        'Target 2',
                        style: TextStyle(
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        cmp.toString(),
                        style: const TextStyle(
                            fontSize: 23, fontWeight: FontWeight.w900),
                      ),
                      Text(
                        target2.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 23),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Status',
                        style: TextStyle(
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w900),
                      ),
                      Text(
                        'Current Status',
                        style: TextStyle(
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        status,
                        style: const TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        current_status.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 23),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Target 1',
                        style: TextStyle(
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w900),
                      ),
                      Text(
                        'Gain Loss',
                        style: TextStyle(
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        target1,
                        style: const TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        gainLoss.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 23),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Suggested \nExposure',
                        style: TextStyle(
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w900),
                      ),
                      Text(
                        'ValueWise \nGain Loss',
                        style: TextStyle(
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        suggExpo.length > 6 ? '${suggExpo.substring(0, 10)}\n'
                            '${suggExpo.substring(10, 18)}\n${suggExpo.substring
                          (18)}'
                            : suggExpo,
                        style: const TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        valGainLoss.length > 6 ? '${valGainLoss.substring(0, 10)}\n'
                            '${valGainLoss.substring(10, 19)}'
                            : valGainLoss
                        ,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 23),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Close Date: ',
                        style: TextStyle(
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w900),
                      ),
                      Text(
                        close_date.toString(),
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold, fontSize: 23),
                      ),
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
