import 'package:flutter/material.dart';

class NumberGenerator extends StatelessWidget {
  final int number;

  const NumberGenerator({
    Key? key,
    required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/number_$number.png', // Path to the first number image
          height: 100,
          width: 100,
        ),

      ],
    );
  }
}
