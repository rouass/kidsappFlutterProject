import 'dart:math';
import 'package:flutter/material.dart';
import 'package:kidsapp/ui/Math/ScoreScreen.dart';
import '../../widgets/CustomButton.dart';
import '../../widgets/NumberCard.dart';
import '../../widgets/NumberGenerator.dart';
import '../../widgets/WiningCard.dart';
import 'MathOperationArguments.dart';
import 'package:fluttertoast/fluttertoast.dart';


class MathCalculationScreen extends StatefulWidget {
  static final String routeName = '/mathCalculation';

  @override
  _MathCalculationScreenState createState() => _MathCalculationScreenState();
}

class _MathCalculationScreenState extends State<MathCalculationScreen> {
  int? _randomNumber1;
  int? _randomNumber2;
  String? _symbol;
  int? result=0;
  int attempts = 0;
  int score = 0;


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _generateRandomNumbers();
  }
  void checkAnswer(int selectedNumber) {
    if (attempts < 3) {
      attempts++;
      if (selectedNumber == result) {
        score += 10;
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: WiningCard(
                imagePath: 'assets/HappyOwl.png',
                message: 'You Won!',
                isAnswerPresent: true,
                onNextPressed: () {
                  Navigator.pop(context);
                },
              ),
            );
          },
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: WiningCard(
                imagePath: 'assets/cryingOwl.png',
                message: 'Try Again!',
                isAnswerPresent: false,
                onNextPressed: () {
                  Navigator.pop(context);
                },
              ),
            );
          },
        );
      }
    } else {
      // Redirect to the score screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ScoreScreen(score: score),
        ),
      );
    }
  }


  void _generateRandomNumbers() {
    final args = ModalRoute.of(context)!.settings.arguments as MathOperationArguments;

    if (args != null) {
      setState(() {
        _randomNumber1 = Random().nextInt(10);
        _randomNumber2 = Random().nextInt(10);
        _symbol = args.symbol;
        calculateResult(_randomNumber1!, _randomNumber2!, _symbol!);
      });
    } else {
      // Show an error message to the user
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("Invalid arguments provided"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }


  String getImagePath(String symbol) {
    switch (symbol) {
      case '+':
        return 'assets/plus.png';
      case '-':
        return 'assets/minus.png';
      case '*':
        return 'assets/multiplication.png';
      case '/':
        return 'assets/percent.png';
      default:
        return 'assets/default.png'; // Default image path
    }
  }

  void calculateResult(int number1, int number2, String symbol) {
    switch (symbol) {
      case '+':
        result = number1 + number2;
        break;
      case '-':
        result = number1 - number2;
        break;
      case '*':
        result = number1 * number2;
        break;
      case '/':
        if (number2 != 0) {
          result = number1 ~/ number2;
        } else {
          throw Exception('Division by zero');
        }
        break;
      default:
        throw Exception('Invalid symbol');
    }
  }
  void displayResultToast(int? result) {
    if (result != null) {
      Fluttertoast.showToast(
        msg: 'Result: $result',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey[800],
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    List<int> numbers = List.generate(5, (index) {
      int randomNumber;
      do {
        randomNumber = Random().nextInt(100) + 1;
      } while (randomNumber == result);
      return randomNumber;
    });

    int resultIndex = Random().nextInt(numbers.length + 1);
    numbers.insert(resultIndex, result ?? 0);
    return Scaffold(
      appBar: AppBar(
        title: Text('Math Calculation'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bgSecond.png'),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 200,
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
                            if (_randomNumber1 != null)
                              NumberGenerator(
                                key: UniqueKey(),
                                number: _randomNumber1!,
                              ),
                            SizedBox(width: 10),
                            if (_symbol != null)
                              Image.asset(
                                getImagePath(_symbol!),
                                height: 80,
                                width: 80,
                              ),
                            SizedBox(width: 10),
                            if (_randomNumber2 != null)
                              NumberGenerator(
                                key: UniqueKey(),
                                number: _randomNumber2!,
                              ),
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
                crossAxisCount: 3,
                childAspectRatio: 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  for (int i = 0; i < 6; i++)
                    NumberCard(number: numbers[i], onTap: (selectedNumber) {
                      // Check the selected number when a card is tapped
                      checkAnswer(selectedNumber);
                    },),

                ],
              ),
            ),
            CustomButton(
              text: 'Next',
              onPressed: () {
                calculateResult(_randomNumber1!, _randomNumber2!, _symbol!);
                _generateRandomNumbers();
              },

            ),
          ],
        ),
      ),
    );
  }
}
