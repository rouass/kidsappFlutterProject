import 'package:flutter/material.dart';
import 'package:kidsapp/AlphabetList.dart';
import 'package:kidsapp/main.dart';

class LearnAlphabet extends StatelessWidget {
  static final String routeName = "/alphabetScreen" ;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            // Background image
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/bgRose2.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Title
            Positioned(
              top: 90, // Adjust the top position as needed
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  'Alphabets Time',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            // Content
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.only(top: 350.0), // Adjust top padding to leave space for the title and additional margin
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start, // Align content at the top
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AlphabetList()),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        padding: EdgeInsets.fromLTRB(10, 20, 10, 20), // Added margin top: 20
                        margin: EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Listen and Learn',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 10),
                            Image.asset(
                              "images/listenLearn.png",
                              width: 120, // Adjusted width of the image
                              height: 120, // Adjusted height of the image
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Listen and Guess',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 10),
                          Image.asset(
                            "images/listenGuess.png",
                            width: 100,
                            height: 100,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}