import 'package:colour_pick/widgets/display.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Colour Picker'),
      ),
      backgroundColor: Colors.white70,
      body: const Display(),
    );
  }
}
