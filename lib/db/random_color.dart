import 'dart:math';

import 'package:colour_pick/db/colors_db.dart';

abstract class RandomColorFunctions {
  ColorObject getRandomColor();
}

class RandomColor extends RandomColorFunctions {
  @override
  ColorObject getRandomColor() {
    final random = Random();
    var i = random.nextInt(colors.length);
    var _colorObj = ColorObject(colors[i]['color'], colors[i]['text']);
    return _colorObj;
  }
}
