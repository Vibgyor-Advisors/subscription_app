import 'package:flutter/material.dart';
import 'package:vibgyor/pages/login_signup_screens/login/login.dart';
import 'package:vibgyor/pages/term_and_cond_page/terms_and_condition.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Container(
        /* Only a background image and button to navigate to login page */
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("images/background.png"),
          fit: BoxFit.cover,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 220.0),
                child: Column(
                  children: const [
                    Logo(/* Defined Below */),
                    Text(
                      "Equity",
                      style: TextStyle(fontSize: 45.0),
                    ),
                    Text(
                      "by Vibgyor Advisor",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ],
                ),
              ),
            ),
            /* const Center(
              child: Padding(
                padding: EdgeInsets.zero,
                child:
              ),
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.zero,
                child:
              ),
            ),*/
            Padding(
              padding: const EdgeInsets.only(top: 190.0, left: 150),
              child: GestureDetector(
                child: const Image(
                  image: AssetImage('images/button.png'),
                  width: 160.0,
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Login(
                              /*
                      Navigation to Login Page ->
                      */
                              )));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Logo extends StatelessWidget {
  /* Vigour LOGO on welcome page */
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = const AssetImage("images/logo.png");
    Image image = Image(
      image: assetImage,
    );
    return Container(padding: EdgeInsets.zero, child: image);
  }
}
