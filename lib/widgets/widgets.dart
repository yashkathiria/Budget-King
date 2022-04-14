import 'package:flutter/material.dart';

Widget appBar(BuildContext context) {
  return RichText(
    text: TextSpan(
      text: 'QuizApp',
      style: TextStyle(fontSize: 20, color: Colors.black),
    ),
  );
}

  Widget blueButton({ BuildContext context,  String lebel, bottonwidth}) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 18),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25),
      color: Colors.blue,
    ),
    alignment: Alignment.center,
    width: bottonwidth != null ? bottonwidth : MediaQuery.of(context).size.width,
    child: Text(
      lebel,
      style: TextStyle(
          color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
    ),
  );
}
