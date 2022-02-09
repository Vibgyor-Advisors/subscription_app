import 'package:flutter/material.dart';
import 'package:vibgyor/animation/bouncyanimation.dart';
import 'package:vibgyor/pages/drawer_screens/navigation_drawer.dart';
import 'package:vibgyor/pages/bottom_nav_screens/bottom_nav.dart';

class TermsAndCondition extends StatefulWidget {
  const TermsAndCondition({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TermsAndCondition();
  }
}

class _TermsAndCondition extends State<TermsAndCondition> {
  bool isAgreeChecked = false; // Checks If User has checked to term and
  // conditions
  bool isOptionalChecked = false; // same /|\

  /* Stores phone number and pan number of user */
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController panNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const NavigationDrawer(),
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                /* Image And Text */
                padding: const EdgeInsets.only(top: 40.0),
                child: Column(
                  children: <Widget>[
                    Center(
                      child: Image.asset('images/logo.png'),
                    ),
                    const Center(
                        child: Text(
                      'Vibgyor',
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 24),
                    )),
                    const Center(
                        child: Text(
                      'Advisors',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                    )),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                /* For check Box  and terms and conditions */
                padding:
                    const EdgeInsets.only(top: 20.0, right: 10.0, left: 10.0),
                child: Container(
                  color: Colors.grey[300],
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Checkbox(
                              value: isAgreeChecked,
                              onChanged: (bool? b) {
                                setState(() {
                                  isAgreeChecked = b!;
                                });
                              }),
                          const Text(
                            'I agree to the following',
                            style: TextStyle(fontSize: 15.0),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, left: 6.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Icon(Icons.arrow_forward),
                            Expanded(
                              child: Text(
                                  "I also authorise Vibgyor Advisor to access "
                                  "my PAN & KYC information from KRAs(KYC registration agencies)"
                                  "and use the same information for my investment journey. As per "
                                  "regulatory requirements,I authorize you to use my KYC details"),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: const [
                            Icon(Icons.arrow_forward),
                            Expanded(
                              child: Text(
                                  "By clicking continue, I authorize to contact me"),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: const [
                            Icon(Icons.arrow_forward),
                            Expanded(
                              child: Text(
                                  "I agree to thr Privacy policy, Terms and the disclaimer"),
                            )
                          ],
                        ),
                      ),
                      Row(
                        /* Checks User is login state */
                        children: [
                          Checkbox(
                              value: isOptionalChecked,
                              onChanged: (check) {
                                setState(() {
                                  isOptionalChecked = check!;
                                });
                              }),
                          const Expanded(
                            child: Text(
                              '(Optional) I would like to receive all important '
                              'communication through whatsapp',
                              style: TextStyle(fontSize: 15.0),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                  /* If User has checked required CheckBox button to move forward */
                  padding: const EdgeInsets.all(30.0),
                  child: GestureDetector(
                    child: const Image(
                      image: AssetImage('images/next.png'),
                      width: 170.0,
                    ),
                    onTap: () {
                      if (isAgreeChecked == true) {
                        Navigator.pushReplacement(
                            context,
                            BouncyAnimation(
                                widget: const BottomNavigation(
                                    /*
                            Navigate to Main Screen */
                                    )));
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text(
                              "Agreeing to the Terms and Conditions is mandatory"),
                        ));
                      }
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
