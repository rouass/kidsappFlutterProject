import 'dart:math';
import 'package:flutter/material.dart';

class NumberGenerator extends StatefulWidget {
  const NumberGenerator({super.key});

  @override
  _NumberGeneratorState createState() => _NumberGeneratorState();
}

class _NumberGeneratorState extends State<NumberGenerator> {
  int _randomNumber = 0;

  void _generateRandomNumber() {
    setState(() {
      _randomNumber = Random().nextInt(10); // Generates a random number between 0 and 9
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/number_$_randomNumber.png', // Path to the randomly generated image
          height: 100,
          width: 100,
        ),
      ],
    );
  }
}
