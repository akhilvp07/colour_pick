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
  Color _randomColor = colorDB.getRandomColor().color;
  String _currentText = "Red"; // Holds the correct colour text

  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 2), (timer) {
      _currentColorObject = colorDB.getRandomColor();
      setState(() {
        _currentColor = _currentColorObject.color;
        _currentText = _currentColorObject.text;
        _randomColor = colorDB.getRandomColor().color;
      });
      //mytimer.cancel() //to terminate this timer
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            //'Text',
            _currentText,
            style: TextStyle(
              color: _randomColor,
              fontSize: 100,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}
