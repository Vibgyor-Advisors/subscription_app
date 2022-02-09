import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vibgyor/pages/term_and_cond_page/terms_and_condition.dart';

class LoginScreen extends StatefulWidget {
  final number;
  const LoginScreen({Key? key, required this.number})
      : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  /*Controllers for text Field*/
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  /*Firebase*/
  FirebaseAuth auth = FirebaseAuth.instance;
  bool otpVisibility = false;
  String verificationID = "";

  @override
  Widget build(BuildContext context) {
    setState(() {
      widget.number;
    });
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Image(
            image: AssetImage('images/logo.png'),
            width: 70.0,
            height: 70.0,
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.grey,
        ),
        body: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                /* Phone Number TextField */
                controller: phoneController=widget.number,
                decoration: InputDecoration(
                  hintText: 'Phone Number',
                  prefix: Padding(
                    padding: EdgeInsets.all(4),
                    child: Text("+91 "),
                  ),
                ),
                maxLength: 10,
                keyboardType: TextInputType.phone,
              ),
              Visibility(
                /* OTP TextField */
                child: TextField(
                  controller: otpController,
                  decoration: const InputDecoration(
                    hintText: 'OTP',
                    prefix: Padding(
                      padding: EdgeInsets.all(4),
                      child: Text(''),
                    ),
                  ),
                  maxLength: 6,
                  keyboardType: TextInputType.number,
                ),
                visible: otpVisibility,
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                /* Verify / Login Button */
                elevation: 8,
                minWidth: 18,
                hoverElevation: 50,
                splashColor: Colors.lightBlue.shade500,
                color: Colors.lightBlue.shade300,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                  18,
                )),
                onPressed: () {
                  if (otpVisibility) {
                    verifyOTP();
                  } else {
                    loginWithPhone();
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    otpVisibility ? "Verify" : "Login",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

/* Check Phone Number Through Firebase */
  void loginWithPhone() async {
    auth.verifyPhoneNumber(
      phoneNumber: "+91" +phoneController.text,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then((value) {
          print("You are logged in successfully");
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        otpVisibility = true;
        verificationID = verificationId;
        setState(() {});
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

/* Verify OTP Through Message in Phone */
  void verifyOTP() async {
    AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationID, smsCode: otpController.text);

    await auth.signInWithCredential(credential).then(
      (value) {
        print("You are logged in successfully");
        Fluttertoast.showToast(
          msg: "You are logged in successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      },
    ).whenComplete(
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => TermsAndCondition(),
          ),
        );
      },
    );
  }
}
