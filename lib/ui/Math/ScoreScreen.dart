import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScoreScreen extends StatelessWidget {
  final int score;

  const ScoreScreen({Key? key, required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Score'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bgScore.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
            child: Container(

              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(10),
              ),
              margin:  EdgeInsets.only(
                left: 0.0,
                top: 110.0,
                right: 0.0,
                bottom: 110.0,
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/owl.png',
                    width: 200, // Adjust size as needed
                    height: 200,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Your Score: $score',
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate back to the math screen
                      Navigator.pop(context);
                    },
                    child: Text('Back Home'),
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}
