import 'package:flutter/material.dart';

class WiningCard extends StatelessWidget {
  final String imagePath;
  final String message;
  final bool isAnswerPresent;
  final VoidCallback onNextPressed;

  WiningCard({
    required this.imagePath,
    required this.message,
    required this.isAnswerPresent,
    required this.onNextPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 420,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            width: 200,
            height: 200,
          ),
          SizedBox(height: 20),
          Text(
            message,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(height: 20),
          Text(
            isAnswerPresent ? 'Answer: Present' : 'Answer: Not Present',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: onNextPressed,
            child: Text('Next'),
          ),
        ],
      ),
    );
  }
}
