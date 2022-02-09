import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vibgyor/pages/notification_page/notification.dart';
import 'package:vibgyor/storage/securestorage.dart';

import '../navigation_drawer.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isLoading = true;
  String Email = '';
  String Uid = '';
  String Name = '';
  String Contact = '';
  String bankName = '';
  String bankAccNo = '';
  String ifscCode = '';
  String bankBranch = '';
  String Location = '';
  String panNo = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  Future init() async {
    final SecureStorage secureStorage = SecureStorage();
    Email = await secureStorage.readSecureData('Email');
    Uid = await secureStorage.readSecureData('Uid');
    Name = await secureStorage.readSecureData('Name');
    Contact = await secureStorage.readSecureData('Contact');
    bankName = await secureStorage.readSecureData('bankName');
    bankAccNo = await secureStorage.readSecureData('bankAccNo');
    ifscCode = await secureStorage.readSecureData('ifscCode');
    bankBranch = await secureStorage.readSecureData('bankBranch');
    Location = await secureStorage.readSecureData('Location');
    panNo = await secureStorage.readSecureData('panNo');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
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
          child: Padding(
            padding: const EdgeInsets.only(top: 38.0),
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'User Details',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Schyler',
                        fontSize: 26),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(26.0),
                      child: SizedBox(
                        width: 400,
                        height: 700,
                        child: Card(
                          elevation: 20,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 18,
                              ),
                              Text(
                                'Name',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                (Name == null) ? 'name' : Name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 25,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                height: 23,
                                child: Divider(
                                  height: 6,
                                  color: Colors.grey.shade500,
                                  thickness: 1,
                                  indent: 58,
                                ),
                              ),
                              const Text(
                                'Unique ID: ',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                Uid,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 25,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                height: 23,
                                child: Divider(
                                  height: 6,
                                  color: Colors.grey.shade500,
                                  thickness: 1,
                                  endIndent: 58,
                                ),
                              ),
                              const Text(
                                'Email: ',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                Email,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 25,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                height: 23,
                                child: Divider(
                                  indent: 58,
                                  height: 6,
                                  color: Colors.grey.shade500,
                                  thickness: 1,
                                ),
                              ),
                              const Text(
                                'Bank Account Number: ',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                bankAccNo,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 25,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                height: 23,
                                child: Divider(
                                  endIndent: 59,
                                  height: 6,
                                  color: Colors.grey.shade500,
                                  thickness: 1,
                                ),
                              ),
                              const Text(
                                'Mobile No: ',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                Contact,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 25,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                height: 23,
                                child: Divider(
                                  indent: 58,
                                  height: 6,
                                  color: Colors.grey.shade500,
                                  thickness: 1,
                                ),
                              ),
                              const Text(
                                'Bank Name: ',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                bankName,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 25,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                height: 23,
                                child: Divider(
                                  endIndent: 58,
                                  height: 6,
                                  color: Colors.grey.shade500,
                                  thickness: 1,
                                ),
                              ),
                              const Text(
                                'IFSC Code: ',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                ifscCode,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 25,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                height: 23,
                                child: Divider(
                                  indent: 58,
                                  height: 6,
                                  color: Colors.grey.shade500,
                                  thickness: 1,
                                ),
                              ),
                              const Text(
                                'Location: ',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                Location,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 25,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                height: 23,
                                child: Divider(
                                  height: 6,
                                  color: Colors.grey.shade500,
                                  thickness: 1,
                                  endIndent: 58,
                                ),
                              ),
                              const Text(
                                'Branch Name: ',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                bankBranch,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 25,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
