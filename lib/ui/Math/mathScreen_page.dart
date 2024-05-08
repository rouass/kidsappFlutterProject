import 'package:flutter/material.dart';

import '../../widgets/CustomCard.dart';
import 'MathOperationArguments.dart';
import 'mathCalculationScreen.dart';

class MathScreenPage extends StatefulWidget {
  static final String routeName = '/mathScreen';

  @override
  _MathScreenPageState createState() => _MathScreenPageState();
}

class _MathScreenPageState extends State<MathScreenPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MathScreen'),
      ),
      body: Stack(
        children: [
          // Background vector image
          Positioned.fill(
            child: Image.asset(
              'assets/bg.png', // Replace with your vector image path
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.transparent, // Make the container transparent to allow the background vector image to show
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                padding: EdgeInsets.only(bottom: 20.0),
                childAspectRatio: 1.0,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        MathCalculationScreen.routeName,
                        arguments: MathOperationArguments(
                          symbol: '+',
                          operation: (int a, int b) => a + b,
                        ),
                      );
                    },
                    child: CustomCard(image: AssetImage('assets/plus.png'), label: 'Addition'),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        MathCalculationScreen.routeName,
                        arguments: MathOperationArguments(
                          symbol: '-',
                          operation: (int a, int b) => a - b,
                        ),
                      );
                    },
                    child: CustomCard(image: AssetImage('assets/minus.png'), label: 'Subtraction'),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        MathCalculationScreen.routeName,
                        arguments: MathOperationArguments(
                          symbol: '*',
                          operation: (int a, int b) => a * b,
                        ),
                      );
                    },
                    child: CustomCard(image: AssetImage('assets/multiplication.png'), label: 'Multiplication'),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        MathCalculationScreen.routeName,
                        arguments: MathOperationArguments(
                          symbol: '/',
                          operation: (int a, int b) => a * b,
                        ),
                      );
                    },
                    child: CustomCard(image: AssetImage('assets/percent.png'), label: 'Division'),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle tap for 'Geometry' card
                      print('Geometry');
                    },
                    child: CustomCard(image: AssetImage('assets/drawing-tools.png'), label: 'Geometry'),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle tap for 'Time' card
                      print('Time');
                    },
                    child: CustomCard(image: AssetImage('assets/clock.png'), label: 'Time'),
                  ),
                  // Add more CustomCard widgets as needed
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
