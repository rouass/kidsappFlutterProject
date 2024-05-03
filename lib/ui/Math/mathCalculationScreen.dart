import 'package:flutter/material.dart';
import '../../constants/color.dart';
import '../../widgets/CustomButton.dart';
import '../../widgets/NumberCard.dart';
import '../../widgets/NumberGenerator.dart';
import 'MathOperationArguments.dart';

class MathCalculationScreen extends StatelessWidget {
  static final String routeName = '/mathCalculation';

  @override
  Widget build(BuildContext context) {
    // Receive parameters
    final MathOperationArguments args =
        ModalRoute.of(context)!.settings.arguments as MathOperationArguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Math Calculation'), // Change the title dynamically
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image:
                AssetImage('assets/bgSecond.png'), // Set the background image
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
          height: 200, // Set the height of the calculation box
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        NumberGenerator(),
                        SizedBox(width: 10),
                        Image.asset(
                          'assets/plus.png', // Corrected path to the image for plus
                          height: 80, // Set the height of the image
                          width: 80, // Set the width of the image
                        ),
                        SizedBox(width: 10),
                        NumberGenerator(),
                        SizedBox(width: 10),
                       // You can display the result here
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'Choose the Right Answer',
                style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.w800),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3, // Number of columns in the grid
                childAspectRatio: 1, // Aspect ratio of each item
                crossAxisSpacing: 10, // Spacing between columns
                mainAxisSpacing: 10, // Spacing between rows
                children: [
                  NumberCard(number: 1),
                  NumberCard(number: 2),
                  NumberCard(number: 3),
                  NumberCard(number: 4),
                  NumberCard(number: 5),
                  NumberCard(number: 6),
                  // Add more NumberCard widgets as needed
                ],
              ),
            ),
            CustomButton(
              text: 'Next',
              // Text for the button
              onPressed: () {
                // Handle button press (e.g., navigate to the next screen)
              },

            ),
          ],
        ),
      ),
    );
  }
}
