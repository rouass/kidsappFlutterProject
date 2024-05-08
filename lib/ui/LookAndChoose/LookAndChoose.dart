import 'package:flutter/material.dart';
import 'dart:math';

class LookAndChoose extends StatefulWidget {
  static final String routeName = '/chooseWords';

  const LookAndChoose({Key? key}) : super(key: key);

  @override
  State<LookAndChoose> createState() => _LookAndChooseState();
}

class _LookAndChooseState extends State<LookAndChoose> {
  final List<String> characters = [
    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
    'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
  ];

  final String imagePath = 'images/apple.png';

  String randomCharacter() {
    final random = Random();
    return characters[random.nextInt(characters.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Look & Choose'),
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: 90,
          left: 50,
          right: 50,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Let’s learn and identify objects with Mythos !",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Image.asset(
                'images/apple.png',
                width: 200,
                height: 200,
              ),
            ),
            SizedBox(height: 20),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 5,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: List.generate(
                10, // Nombre de caractères aléatoires sous l'image
                (index) => Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    randomCharacter(),
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
