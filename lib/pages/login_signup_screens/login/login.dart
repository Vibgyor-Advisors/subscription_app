import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibgyor/animation/bouncyanimation.dart';
import 'package:http/http.dart' as http;
import 'package:vibgyor/models/loginModel/loginmodel.dart';
import 'package:vibgyor/pages/login_signup_screens/signup/signuppage.dart';
import 'package:vibgyor/pages/term_and_cond_page/terms_and_condition.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Login();
  }
}

class _Login extends State<Login> {
  List<LoginModel> homeModelList = <LoginModel>[];
  bool loggedIn = false; // Checks if user is logged in or not
  var userData;
  /* API call */
  Future loginUser(String email, String password) async {
    /* Call API to GET and CHECK if USER is correct */
    var URL = Uri.parse(
        "https://globaltechnolabs.com/VibyorLoanCRM/api/subscription/login.php");

    http.Response response = await http.post(URL,
        body: jsonEncode(
            <String, String>{"mobile": email, "password": password}));

    setState(() {
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        userData = data['user'];
        setState(() {
          loggedIn = false;
        });
      } else {
        setState(() {
          loggedIn = true;
        });
      }
    });

    /*debugPrint("Response: " + data['Result']); // Just to Debug Code
    debugPrint("Status: " + (response.statusCode).toString());*/
  }

  // Stores value from Email / phone input form
  TextEditingController phoneNumberController = TextEditingController();
  // Stores value from PassWord input form
  TextEditingController passwordController = TextEditingController();
  late SharedPreferences logindata;
  late SharedPreferences userDetails;
  late bool newuser;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check_if_already_login();
  }

  void check_if_already_login() async {
    logindata = await SharedPreferences.getInstance();
    userDetails = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? true);
    if (newuser == false) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => TermsAndCondition()));
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        bottom: true,
        child: Scaffold(
          /* Login Page */
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: Stack(
                  children: [ loggedIn
                      ? const Padding(
                        padding:  EdgeInsets.fromLTRB(180,280.0, 0, 0),
                        child:
                   CircularProgressIndicator(),
                      )
                      : Container(),
                    Container(
                      padding: EdgeInsets.only(
                          // change 1
                          top: 10,
                          bottom: MediaQuery.of(context).viewInsets.bottom + 10,

                          // chage 2
                          left: 10,
                          right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            /* Image And Text */
                            padding: const EdgeInsets.only(top: 80.0),
                            child: Column(
                              children: <Widget>[
                                Center(
                                  child: Image.asset('images/logo.png'),
                                ),
                                const Center(
                                    child: Text(
                                  'Vibgyor',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900, fontSize: 24),
                                )),
                                const Center(
                                    child: Text(
                                  'Advisors',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700, fontSize: 16),
                                )),
                              ],
                            ),
                          ),
                          Container(
                              /* Form for Email/Phone number input along with password */
                              padding: const EdgeInsets.only(
                                  top: 50.0, left: 20.0, right: 20.0),
                              child: Column(
                                children: <Widget>[
                                  TextField(
                                    /* Email / Phone Number */
                                    keyboardType: TextInputType.emailAddress,
                                    controller: phoneNumberController,
                                    decoration: const InputDecoration(
                                        labelText: 'EMAIL',
                                        labelStyle: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.black))),
                                  ),
                                  const SizedBox(height: 20.0),
                                  TextField(
                                    /* PassWord */
                                    controller: passwordController,
                                    obscureText: true,
                                    enableSuggestions: false,
                                    autocorrect: false,
                                    decoration: const InputDecoration(
                                        labelText: 'PASSWORD',
                                        labelStyle: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.black))),
                                  ),
                                  const SizedBox(height: 5.0),
                                  Container(
                                    /* Forget PassWord */
                                    alignment: const Alignment(1.0, 0.0),
                                    padding: const EdgeInsets.only(
                                        top: 15.0, left: 20.0),
                                    child: const InkWell(
                                      child: Text(
                                        'Forgot Password',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Montserrat',
                                            decoration: TextDecoration.underline),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 40.0),
                                  MaterialButton(
                                    elevation: 12,
                                    minWidth: double.infinity,
                                    height: 43,
                                    onPressed: () {
                                      setState(() {
                                        loggedIn = true;
                                      });
                                      /* Storing value to store in shared Preference */
                                      String userName =
                                          phoneNumberController.text;
                                      String password = passwordController.text;
                                      loginUser(userName, password);
                                      if (userName != '' && password != '') {
                                        logindata.setBool('login', false);
                                        userDetails.setString(
                                            'userName', userName);
                                        userDetails.setString(
                                            'bankNo', userData['bank_acc_no']);
                                        logindata.setString(
                                            'uid', userData['id']);
                                        userDetails.setString(
                                            'Contact', userData['contact']);
                                        userDetails.setString(
                                            'bankName', userData['bank_name']);
                                        userDetails.setString(
                                            'uId', userData['uid']);
                                        Navigator.pushReplacement(
                                            context,
                                            BouncyAnimation(
                                                widget: TermsAndCondition()));
                                      }
                                    },
                                    color: Colors.grey.shade700,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(40)),
                                    child: const Text(
                                      "Login",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Montserrat'),
                                    ),
                                  ),
                                  const SizedBox(height: 20.0),
                                ],
                              )),
                          const SizedBox(height: 24.0),
                          Row(
                            /* New to app text */
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Text(
                                'New to App ?',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(width: 5.0),
                              InkWell(
                                /* Register Text For SignUp Page */
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      BouncyAnimation(
                                          widget: SignUpPage(
                                              uid: userData['id'].toString()
                                              /*
                              Navigate to SignUp Page -> */
                                              )));
                                },
                                child: const Text(
                                  'Register',
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                ]),
          ),
        ));
  }

}
