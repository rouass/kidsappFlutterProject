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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 1,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          children: [
            NavigationCard(
              name: 'Learn Math',
              image: 'assets/calculator.png',
              route: '/mathScreen',
              color: kMathPrimaryColor            ),
            NavigationCard(
              name: 'Learn ABC',
              image: 'assets/abc.png',
              route: '/alphabetScreen',
              color: kAlphabetsPrimaryColor,
            ),
            // Add more NavigationCard widgets as needed
          ],
        ),
      ),
    );
  }
}
