import 'package:colour_pick/db/colors_db.dart';
import 'package:colour_pick/db/random_color.dart';
import 'package:flutter/material.dart';
import 'dart:async';

var colorDB = RandomColor();

class Display extends StatefulWidget {
  const Display({Key? key}) : super(key: key);

  @override
  _DisplayState createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  late ColorObject _currentColorObject;
  Color _currentColor = Colors.red; //Holds the correct colour
  String _randomText = colorDB.getRandomObject().text;
  String _currentText = "Red";
  String _resultText = "Start!"; // Holds the correct colour text
  int _points = 0;

  List<String> answers = [
    colorDB.getRandomObject().text,
    "Red",
  ];
  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 3), (timer) {
      _currentColorObject = colorDB.getRandomObject();

      setState(() {
        _currentColor = _currentColorObject.color;
        _currentText = _currentColorObject.text;
        _randomText = colorDB.getRandomObject().text;
        _resultText = "?";

        //create the list of answers and shuffle
        answers.clear();
        answers.add(_currentText);
        answers.add(colorDB.getRandomObject().text);
        answers.shuffle();
      });

      //mytimer.cancel() //to terminate this timer
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Center(
          child: Text(
            //Result text
            _resultText,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 50,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
            ),
            textAlign: TextAlign.right,
          ),
        ),
        Center(
          child: Text(
            //The main coloured text object,
            _randomText,
            style: TextStyle(
              color: _currentColor,
              fontSize: 100,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
            ),
            textAlign: TextAlign.right,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //Left Button
            ElevatedButton(
              onPressed: () {
                checkAnswer(answers[0]);
              },
              child: Text(
                answers[0],
                style: const TextStyle(fontSize: 30.0),
              ),
            ),
            //Right Button
            ElevatedButton(
              onPressed: () {
                checkAnswer(answers[1]);
              },
              child: Text(
                answers[1],
                style: const TextStyle(fontSize: 30.0),
              ),
            ),
          ],
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Points: $_points',
              style: const TextStyle(fontSize: 20.0),
            ),
          ),
        ),
      ],
    );
  }

  void checkAnswer(String ans) {
    if (ans == _currentText) {
      setState(() {
        _points++;
        _resultText = "Correct Answer!";
      });
    } else {
      setState(() {
        _points = 0;
        _resultText = "Wrong!";
      });
    }
  }
}
