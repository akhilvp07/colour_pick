import 'package:flutter/material.dart';

class ColorObject {
  final Color color;
  final String text;
  ColorObject(this.color, this.text);
}

List<Map<String, dynamic>> colors = const [
  {
    'color': Colors.red,
    'text': "Red",
  },
  {
    'color': Colors.green,
    'text': "Green",
  },
  {
    'color': Colors.blue,
    'text': "Blue",
  },
  {
    'color': Colors.yellow,
    'text': "Yellow",
  },
  {
    'color': Colors.orange,
    'text': "Orange",
  },
  {
    'color': Colors.black,
    'text': "Black",
  },
];
