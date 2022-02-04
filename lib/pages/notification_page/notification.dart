import 'package:flutter/material.dart';
import 'package:vibgyor/pages/drawer_screens/navigation_drawer.dart';

class NotificationView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Notification();
  }
}

class _Notification extends State<NotificationView> {
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
        title: const Image(image: AssetImage('images/logo.png'),width: 70.0,
          height: 70.0,),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.grey,
      ),
      drawer: NavigationDrawer(),
      body: Material(
       borderRadius: BorderRadius.circular(10.0),
       child: ListView(
         children: [
           const SizedBox(
             height: 15,
           ),
           Container(

               margin: EdgeInsets.all(20.0),
               color: Colors.grey,
               child: buildMenuItem(
                   text: "IntraDay Trade has been updated", )),
           const SizedBox(
             height: 15,
           ),
           Container(
               margin: EdgeInsets.all(20.0),
               color: Colors.grey,
               child: buildMenuItem(
                   text: "Swing Trade has been updated",)),
           const SizedBox(
             height: 15,
           ),
           Container(
               margin: EdgeInsets.all(20.0),
               color: Colors.grey,
               child: buildMenuItem(
                   text: "Sectoral Trade has been updated", )),
           const SizedBox(
             height: 15,
           ),
           Container(
               margin: EdgeInsets.all(20.0),
               color: Colors.grey,
               child: buildMenuItem(
                   text: "Positional Trade has been updated",
               )),
           const SizedBox(
             height: 15,
           ),
           Container(
               margin: EdgeInsets.all(20.0),
               color: Colors.grey,
               child: buildMenuItem(
                   text: "Portfolio Trade has been updated",)),
           const SizedBox(
             height: 15,
           ),
           Container(
               margin: EdgeInsets.all(20.0),
               color: Colors.grey,
               child: buildMenuItem(
                   text: "Portfolio Health Check Up has been updated",)
           ),
           const SizedBox(
             height: 15,
           ),
           Container(
               margin: EdgeInsets.all(20.0),
               color: Colors.grey,
               child: buildMenuItem(
                   text: "IntraDay Trade has been updated", )),
         ],
       ),
        ),
    );
  }

  Widget buildMenuItem({required String text}) {
    const color = Colors.white;
    const hoverColor = Colors.white;
    return ListTile(
      hoverColor: hoverColor,
      title: Text(
        text,
        style: const TextStyle(
            color: color, fontSize: 20, decoration: TextDecoration.underline),
      ),
      onTap: () {},
    );
  }
}
