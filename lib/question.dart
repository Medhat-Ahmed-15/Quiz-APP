import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String
      questionText; // final tells dart that this value will never change after its initialization here in the constructor and that's what needed for stateless widget as iy's immutable

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(20),
      child: Text(
        questionText,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
