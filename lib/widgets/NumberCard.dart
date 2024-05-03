
import 'package:flutter/material.dart';

class NumberCard extends StatelessWidget {
  final int number;

  NumberCard({required this.number});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: () {
          // Handle number selection (e.g., check if the answer is correct)
        },
        child: Container(
          width: 100,
          height: 100,
          alignment: Alignment.center,
          child: Text(
            number.toString(),
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}