import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import 'package:vibgyor/animation/bouncyanimation.dart';
import 'package:vibgyor/pages/login_signup_screens/otplogin/otplogin.dart';
import 'package:vibgyor/pages/term_and_cond_page/terms_and_condition.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

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
  TextEditingController bankAccNum = TextEditingController();
  TextEditingController bankName = TextEditingController();
  TextEditingController branchName = TextEditingController();
  TextEditingController panNumber = TextEditingController();
  TextEditingController IfscCode = TextEditingController();
  /* Checks if user input details are correct*/
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  late bool isSignedIn; //Checks USer SignedIn status
  var uuid = const Uuid();

  late var data; // To store Response from API
  final databaseReference = FirebaseDatabase.instance.ref("users");


  Future database(String f_token) async {
    var url =
        "https://vadvisor-bbc54-default-rtdb.firebaseio.com/" + "data.json";
    try {
      await http.post(Uri.parse(url),
          body: json.encode({
            "email": mailController.text,
            "name": nameController.text,
            "firebase_token": f_token,
            "contact": numberController.text,
            "bank_name": bankName.text,
            "bank_acc_no": bankAccNum.text,
            "branch": branchName.text,
            "ifsc_code": IfscCode.text,
            "password": passwordController.text,
            "location": addressController.text,
            "panno": panNumber.text,
            "agree": "1"
          }));
    } catch (error) {
      throw error;
    }
  }

  Future registerUser() async {
    final token_val = await SharedPreferences.getInstance();
    var token = token_val.getString('Token');
    print(token);
    /* Call API to POST data inputted by USER */

    var URL = Uri.parse(
        "https://www.jupitertouchlab.co.in/subscription/api/register.php");

    http.Response response = await http.post(URL,
        body: jsonEncode(<String, String>{
          "name": nameController.text,
          "uid": uuid.v1().toString(),
          "contact": numberController.text,
          "email": mailController.text,
          "bank_name": bankName.text,
          "bank_acc_no": bankAccNum.text,
          "branch": branchName.text,
          "ifsc_code": IfscCode.text,
          "password": passwordController.text,
          "location": addressController.text,
          "panno": panNumber.text,
          "firebase_token": token.toString(),
          "agree": "1"
        }));
    data = jsonDecode(response.body.toString());
    print(response.body);
    if (data["ResponseCode"] == '200') {
      database(token.toString());
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(data["ResponseMsg"]),
      ));
      Navigator.pop(context);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => LoginScreen(
                  number: numberController,
                )),
        (route) => false,
      );
    } else if (data["ResponseCode"] == '401') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(data["ResponseMsg"]),
      ));
    }

    /* Just to Debug \|/ */
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
              Column(
                children: <Widget>[
                  Center(
                    child: Image.asset('images/logo.png'),
                  ),
                  const Center(
                      child: Text(
                    'Vibgyor',
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24),
                  )),
                  const Center(
                      child: Text(
                    'Advisors',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                  )),
                ],
              ),
              const SizedBox(
                height: 30,
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
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0),
                      hintStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
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
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0),
                      hintStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
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
                  obscureText: true,
                  /* PASSWORD */
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
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0),
                      hintStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
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
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0),
                      hintStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
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
                  controller: panNumber,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.tag),
                      labelText: "Pan Number ",
                      hintText: 'Pan Number ',
                      isDense: true,
                      labelStyle: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0),
                      hintStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
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

                  keyboardType: TextInputType.phone,
                  style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: 20.0),
                  controller: bankAccNum,
                  decoration: InputDecoration(
                      prefixIcon:
                          const Icon(Icons.format_list_numbered_rounded),
                      labelText: "Bank Account Number",
                      hintText: 'Bank Account Number',
                      isDense: true,
                      labelStyle: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0),
                      hintStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
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
                  controller: branchName,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.streetview_rounded),
                      labelText: "Branch Name",
                      hintText: 'Branch Name',
                      isDense: true,
                      labelStyle: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0),
                      hintStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
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
                  controller: bankName,
                  decoration: InputDecoration(
                      prefixIcon:
                          const Icon(Icons.drive_file_rename_outline_rounded),
                      labelText: "Bank Name",
                      hintText: 'Bank Name',
                      isDense: true,
                      labelStyle: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0),
                      hintStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
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
                  controller: IfscCode,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.code_rounded),
                      labelText: "IFSC Code",
                      hintText: 'IFSC Code',
                      isDense: true,
                      labelStyle: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0),
                      hintStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
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
                      prefixIcon: const Icon(Icons.format_align_right),
                      labelText: "Address",
                      hintText: 'Address',
                      isDense: true,
                      labelStyle: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0),
                      hintStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
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
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(context,
                          BouncyAnimation(widget: const TermsAndCondition()));
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(top: 5, bottom: 16),
                      child: Text(
                        'Term And Conditions',
                        style: TextStyle(
                            fontSize: 13, color: Colors.lightBlueAccent),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: MaterialButton(
                      elevation: 12,
                      minWidth: double.infinity,
                      height: 43,
                      onPressed: () {
                        registerUser();
                      },
                      color: Colors.grey.shade700,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat'),
                      ),
                    ),
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
