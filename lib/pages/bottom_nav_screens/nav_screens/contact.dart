import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'package:vibgyor/pages/drawer_screens/navigation_drawer.dart';
import 'package:vibgyor/pages/notification_page/notification.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Contact();
  }
}

class _Contact extends State<Contact> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController name = TextEditingController();
  TextEditingController userId = TextEditingController();
  TextEditingController message = TextEditingController();

  late SharedPreferences logindata;
  String uid='';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initial();
  }
  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      uid = logindata.getString('uid')!;
    });
  }

  Future userContact() async {
    /* Call API to POST data inputted by USER */
    var URL = Uri.parse("https://www.jupitertouchlab.co.in/subscription/api/contactus.php");

    http.Response response = await http.post(URL,
        body: jsonEncode(<String, String>{
          "name": name.text,
          "uid": userId.text,
          "message": message.text,
          "id": uid,

        }));

    var data = jsonDecode(response.body.toString());
    print(data);
    /* Just to Debug \|/ */
    debugPrint("Response: " + response.body.toString());
    debugPrint("Status: " + (response.statusCode).toString());
  }

  @override
  Widget build(BuildContext context) {
    _launchUrl(String url) async {
      if (await canLaunch(url)) {
        launch(url);
      } else {
        _scaffoldKey.currentState!.showSnackBar(
            const SnackBar(content: Text("Error in opening url")));
      }
    }

    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
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
              child: Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Column(children: [
              const Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: Text(
                  "Contact Us",
                  style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 25.0, left: 10.0, right: 10.0),
                child: TextField(
                  controller: name,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    labelText: "Name",
                    hintText: "Name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          width: 3,
                          style: BorderStyle.none,
                        )),
                    //border: OutlineInputBorder(borderRadius: BorderRadius.zero)
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                child: TextField(
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    labelText: "User id",
                    hintText: uid,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          width: 3,
                          style: BorderStyle.none,
                        )),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                child: TextField(
                  controller: message,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    labelText: "Message",
                    hintText: "Message",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          width: 3,
                          style: BorderStyle.none,
                        )),
                  ),
                ),
              ),
              SizedBox(
                  height: 300,
                  width: 400,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18.0, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Address',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          '202, Shivai Industrial Estate, saki Naka, Andheri '
                          '(E), Mumbai - 400072',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Email Id',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'equities@vibgyoradvisors.com\nvibgyorsubscription@gmail'
                          '.com',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Contact',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          '+91 85914 02578',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                  icon: const Icon(
                                    MdiIcons.instagram,
                                    size: 40.0,
                                    color: Color.fromRGBO(138, 58, 185, 4),
                                  ),
                                  onPressed: () {
                                    _launchUrl("https://www.instagram.com/vibgyor_advisors/");
                                  }),
                              IconButton(
                                  icon: const Icon(MdiIcons.whatsapp,
                                      size: 40.0, color: Colors.green),
                                  onPressed: () {
                                    _launchUrl("https://api.whatsapp.com/send/?phone=%2B918591402578&text&app_absent=0");
                                  }),
                              IconButton(
                                  icon: const Icon(MdiIcons.linkedin,
                                      size: 40.0, color: Colors.blue),
                                  onPressed: () {
                                    _launchUrl("https://www.linkedin.com/company/vibgyor-advisors/");
                                  })
                            ]),
                      ],
                    ),
                  )),
              MaterialButton(
                padding: const EdgeInsets.all(12),
                elevation: 10,
                hoverElevation: 58,
                color: Colors.indigo.shade200,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                  18,
                )),
                onPressed: () {
                  setState(() {
                    userContact();
                  });

                },
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              )
            ]),
          ))),
    );
  }
}
