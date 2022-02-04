import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibgyor/models/loginModel/loginmodel.dart';
import 'package:vibgyor/models/usermodel/user.dart';
import 'package:vibgyor/pages/notification_page/notification.dart';

import '../navigation_drawer.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isLoading = true;
  late SharedPreferences userDetails;
  String email = '';
  String bank_acc_no = '';
  String uid = '';
  String bank_name = '';
  String contact = '';
  var userData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initial();
  }

  void initial() async {
    userDetails = await SharedPreferences.getInstance();
    setState(() {
      email = userDetails.getString('userName')!;
      bank_acc_no = userDetails.getString('bank_acc_no')!;
      uid = userDetails.getString('uId')!;
      bank_name = userDetails.getString('bank_name')!;
      contact = userDetails.getString('contact')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade400,
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
        body: Padding(
          padding: const EdgeInsets.only(top: 38.0),
          child: Center(
            child: Column(
              children: [
                const Text(
                  'User Details',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Schyler',
                      fontSize: 30),
                ),
                Text(
                  email,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  color: Colors.white,
                  height: 500,
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(26.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Email ID: ',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w800),
                        ),
                        Text(
                          email,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 25,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        const Text(
                          'Unique ID: ',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w800),
                        ),
                        Text(
                          uid,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 25,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        const Text(
                          'Bank Account Number: ',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w800),
                        ),
                        Text(
                          bank_acc_no,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 25,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        const Text(
                          'Mobile No: ',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w800),
                        ),
                        Text(
                          contact,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 25,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        const Text(
                          'Bank Name: ',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w800),
                        ),
                        Text(
                          bank_name,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 25,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
