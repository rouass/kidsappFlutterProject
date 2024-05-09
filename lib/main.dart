import 'package:flutter/material.dart';
import 'package:kidsapp/ui/Alphabets/AlphabetList.dart';
import 'package:kidsapp/WelcomeScreen.dart';
import 'package:kidsapp/ui/Alphabets/LearnAlphabet.dart';
import 'package:kidsapp/ui/LookAndChoose/LookAndChoose.dart';
import 'package:kidsapp/ui/LookAndChoose/StepperActivity.dart';
import 'package:kidsapp/ui/Math/mathCalculationScreen.dart';
import 'package:kidsapp/ui/Math/mathScreen_page.dart';


import 'HomeScreen.dart';

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
      home:HomeScreen(),
      routes: {
        MathScreenPage.routeName: (context) => MathScreenPage(),
        MathCalculationScreen.routeName: (context) => MathCalculationScreen(),
        AlphabetList.routeName :(context)=>AlphabetList(),
        LearnAlphabet.routeName:(context) =>LearnAlphabet(),
        LookAndChoose.routeName: (context)=>StepperAct(),
      },

    );
  }
}



