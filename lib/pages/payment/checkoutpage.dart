import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckOutPage extends StatefulWidget {
  final int price;
  const CheckOutPage({Key? key, required this.price}) : super(key: key);

  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        color: Colors.black,
        child: Text('l'),
      ),
    );
  }
}
