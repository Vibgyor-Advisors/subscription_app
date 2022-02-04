import 'package:flutter/material.dart';
import 'package:vibgyor/pages/drawer_screens/navigation_drawer.dart';
import 'package:vibgyor/pages/notification_page/notification.dart';

class Payment extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _Payment();
  }
}

class _Payment extends State<Payment>{
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
      body: Center(
        child: Column(
          children: [
            const Text(
              "Payment",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 10,),
            const Text(
              "Pay Rs.6000 for 1 Month Intraday trade",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.normal
              ),
            ),
            SizedBox(height: 10,),

            ListTile(
              title: const Text('Debit Card'),
              leading: Radio(
                value: "Debit Crd",
                // groupValue: _site,
                onChanged: (value) {

                }, groupValue: '',
              ),
              trailing: Image(image: AssetImage('images/card.png'),),
            ),
            SizedBox(height: 10,),

            ListTile(
              title: const Text('Google Pay'),
              leading: Radio(
                value: "Debit Crd",
                // groupValue: _site,
                onChanged: (value) {

                }, groupValue: '',
              ),
              trailing: Image(image: AssetImage('images/gpay.png'),),

            ),
            SizedBox(height: 10,),

            ListTile(
              title: const Text('Upi'),
              leading: Radio(
                value: "Debit Crd",
                // groupValue: _site,
                onChanged: (value) {

                }, groupValue: '',
              ),              trailing: Image(image: AssetImage('images/upi.png'),),

            ),
            SizedBox(height: 10,),

            Padding(
              padding: EdgeInsets.only(right: 50.0,left: 110),
              child: Row(
                children: [
                  Icon(Icons.horizontal_rule,size: 90,),
                  Text(
                    'or'
                  ),
                  Icon(Icons.horizontal_rule,size: 90,),
                ],
              ),
            ),
            SizedBox(height: 10,),

            Text(
              "You can Transfer money in our account.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.normal
              ),
            ),
            SizedBox(height: 10,),

            Text(
              "AC/NO:5122001745",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.normal
              ),
            ),
            SizedBox(height: 10,),

            Text(
              "IFSC:FSHJ0000846",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.normal
              ),
            ),
            SizedBox(height: 10,),

            Text(
              "Once the payment is sucessful send a"
              "screenhot at",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.normal
              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(image: AssetImage('images/whatsapp.png'),width: 60,height: 60,),
                SizedBox(width: 20,),
                Image(image: AssetImage('images/gmail.png'),width: 50,height: 50,),
              ],
            )
          ],
        ),
      ),
    );

  }
}