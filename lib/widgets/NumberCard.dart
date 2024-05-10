
import 'package:flutter/material.dart';

class NumberCard extends StatelessWidget {
  final int number;
  final Function(int) onTap;


  NumberCard({required this.number,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: () {
          onTap(number);
        },
        child: Container(
          width: 100,
          height: 100,
          alignment: Alignment.center,
          child: Text(
            number.toString(),
            style: TextStyle(fontSize: 50,fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}