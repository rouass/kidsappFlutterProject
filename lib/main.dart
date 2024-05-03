import 'package:flutter/material.dart';
import 'package:kidsapp/AlphabetList.dart';
import 'package:kidsapp/WelcomeScreen.dart';
import 'package:kidsapp/learnAlphabet.dart';
import 'package:kidsapp/ui/Math/mathCalculationScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kids app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: WelcomeScreen(),
    );
  }
}



