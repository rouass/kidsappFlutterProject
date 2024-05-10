import 'package:flutter/material.dart';
import 'package:kidsapp/widgets/NavigationCard.dart';

import 'constants/color.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/download.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Owl image

          // ListView of navigation cards
          Positioned.fill(
            top: 150, // Adjust the top position as needed
            child: ListView(
              padding: EdgeInsets.all(10),
              children: [
                NavigationCard(
                  name: 'Learn Math',
                  image: 'assets/calculator.png',
                  route: '/mathScreen',
                  color: kMathPrimaryColor,
                ),
                SizedBox(height: 10), // Added spacing between cards
                NavigationCard(
                  name: 'Learn ABC',
                  image: 'assets/abc.png',
                  route: '/alphabetScreen',
                  color: kAlphabetsPrimaryColor,
                ),
                SizedBox(height: 10), // Added spacing between cards
                NavigationCard(
                  name: 'Word Quiz',
                  image: 'assets/abc.png',
                  route: '/chooseWords',
                  color: kCustomColor2,
                ),
                // Add more NavigationCard widgets as needed
              ],
            ),
          ),
        ],
      ),
    );
  }
}
