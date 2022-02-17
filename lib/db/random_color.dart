import 'dart:math';

import 'package:colour_pick/db/colors_db.dart';
import 'package:flutter/cupertino.dart';

abstract class RandomColorFunctions {
  ColorObject getRandomObject();
  String getColorString(Color color);
}

class RandomColor extends RandomColorFunctions {
  @override
  ColorObject getRandomObject() {
    final random = Random();
    var i = random.nextInt(colors.length);
    var _colorObj = ColorObject(colors[i]['color'], colors[i]['text']);
    return _colorObj;
  }

  @override
  String getColorString(Color color) {
    var obj = colors.firstWhere((element) => element['color'] == color);
    return obj['text'];
  }
}
