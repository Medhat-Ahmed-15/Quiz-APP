import 'package:flutter/material.dart';

import './answer.dart';

import './question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz(
      {@required this.questions,
      @required this.answerQuestion,
      @required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(
          questions[questionIndex]['questiontext']
              as String, //here for the  chosen question map, i access the  value with the key
        ),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
              () => answerQuestion(answer['score']),
              answer[
                  'text']); //I would've gotten an error here and i could solve these errors by simply adding as string to make it very clear to Dart which kind of data it can expect from accessing that key
        }).toList()
      ],
    );
  }
}
