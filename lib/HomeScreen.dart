import 'package:flutter/material.dart';
import 'package:kidsapp/widgets/NavigationCard.dart';

import 'constants/color.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        children: [
          NavigationCard(
            name: 'Learn Math',
            image: 'assets/calculator.png',
            route: '/mathScreen',
            color: kMathPrimaryColor,
          ),
          NavigationCard(
            name: 'Learn ABC',
            image: 'assets/abc.png',
            route: '/alphabetScreen',
            color: kAlphabetsPrimaryColor,
          ),
          NavigationCard(
            name: 'Word Quiz',
            image: 'assets/abc.png',
            route: '/chooseWords',
            color: kCustomColor2,
          ),
          // Add more NavigationCard widgets as needed
        ],
      ),
    );
  }
}
