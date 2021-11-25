import 'package:flutter/material.dart';
//import 'package:flutter_complete_guide_pt2/result.dart';

import './quiz.dart';
import './result.dart';

// (./) means look in the same folder as the main.dart file is and this import is made to make a connection between this file and the question.dart file which means everything that's in this file is now available in the main.dart file as well, unless you name it with an underscore in  front of the name

//main is af unction that is automatically executed when tha app starts by flutter because t's in the main.dart file which i shouldn't rename
/*void main() {
  /*line(16) runs our app it takes our widget that we created ==>"MyApp" 
    as an instance of the class i mean as an object and draws it to the  screen 
    and this function is provided from the import ==>"material.dart"*/

  /*to be precise what line (16) really does is that calling the constructor 
    so such a widget object is created then runApp takes this object that we passed 
    and calls the build method for us this is  how build is triggered for us for the  first time */

  runApp(MyApp());
}*/

void main() => runApp(
    MyApp()); //it'sa shorthand for functions which only have one and exactly one expression, so only one line of code

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  static const _questions = const [
    {
      'questiontext': 'what\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'white', 'score': 1},
      ],
    },
    {
      'questiontext': 'what\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 11},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 9},
      ],
    },
    {
      'questiontext': 'what\'s your favorite instructor?',
      'answers': [
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
      ],
    },
  ];

  //OR

  /*List<String> questions=['what\'s your favorite color?',
                'what\'s your favorite animal?'];*/

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;

    /*What flutter actually does when set state is executed:

========================================

set state is a function that forces flutter to re-render the user interface, 
however not the entire user interface of the entire app instead what set state does 
in the  end is it calls build again of this widget where you call set state Now in our case, 
that is almost the entire app but later in this course, we'll have bigger applications with more 
widgets where we split that into more custom widgets and therefore, it will really make a difference 
if update the entire app or just that widget with set state */

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);

    if (_questionIndex < _questions.length) {
      print('we have more questions');
    } else {
      print('no more questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    // context hold some meta information

    /* MaterialApp does some base setup to turn my combination if widgets 
    into a real app that can be rendered does alot of heavy lifting behind the scenes*/

    /*home argument is basically the core widget which flutter will bring onto the screen,
    Scaffold has the job of creating a base page design for  your app give basic design and structure and color scheme and contains many arguments for background stuff */
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('My First App'),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  questions: _questions,
                  questionIndex: _questionIndex,
                  answerQuestion: _answerQuestion,
                )
              : Result(_totalScore, _resetQuiz)),
    );
  }
}
