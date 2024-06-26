import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kidsapp/HomeScreen.dart';
import 'package:kidsapp/ui/Alphabets/AlphabetList.dart';
import 'package:kidsapp/WelcomeScreen.dart';
import 'package:kidsapp/ui/Alphabets/LearnAlphabet.dart';
import 'package:kidsapp/ui/Alphabets/ListenAndGuess.dart';
import 'package:kidsapp/ui/LookAndChoose/LookAndChoose.dart';
import 'package:kidsapp/ui/LookAndChoose/StepperActivity.dart';
import 'package:kidsapp/ui/Math/mathCalculationScreen.dart';
import 'package:kidsapp/ui/Math/mathScreen_page.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';


void main() {
  if (!kIsWeb) {
    sqfliteFfiInit(); // Initialize FFI for non-web platforms
    databaseFactory = databaseFactoryFfi;
  }


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
      home: WelcomeScreen(), // Set SplashScreen as the initial route
    
      routes: {
        '/home': (context) => HomeScreen(), // Home screen route
        MathScreenPage.routeName: (context) => MathScreenPage(),
        MathCalculationScreen.routeName: (context) => MathCalculationScreen(),
        AlphabetList.routeName: (context) => AlphabetList(),
        LearnAlphabet.routeName: (context) => LearnAlphabet(),
        LookAndChoose.routeName: (context) => StepperAct(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}