import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback
      selectHandler; //VoidCallback a function that doesn't return a value
  final String answertext;

  Answer(this.selectHandler, this.answertext);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        //Buttons are blocked when the onpressed is null
        color: Colors.blue,
        child: Text(answertext),
        textColor: Colors.white,
        onPressed: selectHandler,
      ),
    );
  }
}
