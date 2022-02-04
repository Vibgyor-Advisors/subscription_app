import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vibgyor/animation/bouncyanimation.dart';
import 'package:vibgyor/pages/login_signup_screens/otplogin/otplogin.dart';

class SignUpPage extends StatefulWidget {
  final String uid;
  const SignUpPage({Key? key, required this.uid}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  /* Controller to Store value input by user */
  TextEditingController nameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController referralController = TextEditingController();
  /* Checks if user input details are correct*/
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  late bool isSignedIn; //Checks USer SignedIn status

  late var data; // To store Response from API

  Future registerUser() async {
    /* Call API to POST data inputted by USER */
    var URL = Uri.parse("https://globaltechnolabs"
        ".com/VibyorLoanCRM/api/subscription/register.php");

    http.Response response = await http.post(URL,
        body: jsonEncode(<String, String>{
          "name": nameController.text,
          "uid": "01",
          "contact": numberController.text,
          "email": mailController.text,
          "bank_name": "State bank of India",
          "bank_acc_no": "3762066112341",
          "branch": "Kalyan",
          "ifsc_code": "KLYNBSBI2451",
          "password": passwordController.text,
          "location": addressController.text,
          "panno": "DTDPP3809H",
          "firebase_token": "123456789"
        }));
    data = jsonDecode(response.body.toString());

    /* Just to Debug \|/ */
    debugPrint("Response: " + response.body.toString());
    debugPrint("Status: " + (response.statusCode).toString());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      /* User Details  For Signing in user */
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
              // change 1
              top: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10,

              // chage 2
              left: 10,
              right: 10),
          child: Form(
            key: _formkey,
            child: Column(children: [
              const Padding(
                padding: EdgeInsets.only(top: 38),
                child: Text(
                  "Let's Get Started!",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Image(
                  image: AssetImage('images/signup.png'),
                  width: 2500,
                  height: 250,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 20.0, right: 30.0, left: 30),
                child: TextField(
                  /* NAME */
                  style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: 20.0),
                  controller: nameController,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person),
                      labelText: "Name",
                      hintText: 'Name',
                      isDense: true,
                      labelStyle: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16.0),
                      hintStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(23.0),
                      )),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 20.0, right: 30.0, left: 30),
                child: TextField(
                  /* EMAIL */
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: 20.0),
                  controller: mailController,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email_rounded),
                      labelText: "Email",
                      hintText: 'Email',
                      isDense: true,
                      labelStyle: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16.0),
                      hintStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(23.0),
                      )),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 20.0, right: 30.0, left: 30),
                child: TextField(
                  /* PASSWORD */
                  keyboardType: TextInputType.visiblePassword,
                  style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: 20.0),
                  controller: passwordController,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock_clock_rounded),
                      labelText: "Password",
                      hintText: 'Name',
                      isDense: true,
                      labelStyle: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16.0),
                      hintStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(23.0),
                      )),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 20.0, right: 30.0, left: 30),
                child: TextField(
                  /* CONTACT */
                  keyboardType: TextInputType.number,
                  style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: 20.0),
                  controller: numberController,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.phone_android),
                      labelText: "Contact",
                      hintText: 'Contact',
                      isDense: true,
                      labelStyle: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16.0),
                      hintStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(23.0),
                      )),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 20.0, right: 30.0, left: 30),
                child: TextField(
                  /* ADDRESS */
                  keyboardType: TextInputType.text,
                  style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: 20.0),
                  controller: addressController,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.home),
                      labelText: "Address",
                      hintText: 'Address',
                      isDense: true,
                      labelStyle: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16.0),
                      hintStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(23.0),
                      )),
                ),
              ),
              Center(
                  /*  Bottom Texts (By Signing up, you agree to our) AND  (Term
                 And Conditions) AND Sign Up BUTTON */
                  child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      'By Signing up, you agree to our',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 5, bottom: 16),
                    child: Text(
                      'Term And Conditions',
                      style: TextStyle(
                          fontSize: 13, color: Colors.lightBlueAccent),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            registerUser();
                          });
                          (data['Result'] == 'true')
                              ? Navigator.push(
                                  context,
                                  BouncyAnimation(
                                      /* Navigate To Login through OTP Page */
                                      widget: LoginScreen(
                                        uid: widget.uid
                                  )))
                              : ScaffoldMessenger.of(context)
                                  /* TOAST */
                                  .showSnackBar(const SnackBar(
                                  elevation: 12,
                                  dismissDirection: DismissDirection.down,
                                  backgroundColor: Colors.white,
                                  content: Text(
                                    "Please enter details correctly",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ));
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(fontSize: 18),
                        )),
                  )
                ],
              )),
            ]),
          ),
        ),
      ),
    ));
  }
}
