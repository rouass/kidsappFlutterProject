import 'package:flutter/material.dart';
import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';

class LookAndChoose extends StatefulWidget {
  static final String routeName = '/chooseWords';
  final int level;

  const LookAndChoose({Key? key, required this.level}) : super(key: key);

  @override
  State<LookAndChoose> createState() => _LookAndChooseState();
}

class _LookAndChooseState extends State<LookAndChoose> {
  late List<String> images;
  late List<String> words;

  int currentImageIndex = 0;
  bool isError = false;
  int score = 0;
  int pointsToAdd = 1;
  bool isLevelCompleted = false; 
  late SharedPreferences prefs;
  TextEditingController textEditingController = TextEditingController();


  @override
  void initState() {
    super.initState();
    initializeSharedPreferences();
    switch (widget.level) {
      case 1:
        images = [
          'images/apple.png',
          'banana.png',
          'images/orange.png',
        ];
        words = [
          'Apple',
          'Banana',
          'Orange',
        ];
        break;
      case 2:
        images = [
          'Frt/dog.png',
          'Frt/cat.png',
          'Frt/rabbit.png',
        ];
        words = [
          'Dog',
          'Cat',
          'Rabbit',
        ];
        break;
      case 3:
        images = [
          'Vgt/carrot.png',
          'Vgt/tomato.png',
          'Vgt/broccoli.png',
        ];
        words = [
          'Carrot',
          'Tomato',
          'Broccoli',
        ];
        break;
      default:
        throw ArgumentError('Invalid level');
    }
  }

  void initializeSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      score = prefs.getInt('score') ?? 0;
    });
  }
   
  void saveScore() {
    prefs.setInt('score', score);
  }

  void validateWord() {
    String inputWord = textEditingController.text.toLowerCase();
    String correctWord = words[currentImageIndex].toLowerCase();
    if (inputWord == correctWord) {
      setState(() {
        score += pointsToAdd;
        saveScore();
      });
    if (currentImageIndex == images.length - 1) {
  // Dialogue de félicitations
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Congratulations!'),
        content: Text('You have completed Level ${widget.level} with a score of $score. Proceed to the next level?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              switch (widget.level) {
                case 1:
                  _completeLevel1();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LookAndChoose(level: 2)),
                  );
                  break;
                case 2:
                  _completeLevel2();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LookAndChoose(level: 3)),
                  );
                  break;
                case 3:
                  _completeLevel3();
                  // Add logic for further levels if needed
                  break;
              }
            },
            child: Text('Yes'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('No'),
          ),
        ],
      );
    },
  );
}
 else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.amber.shade300,
              title: Text('Correct!'),
              content: Text('You got it right!'),
              actions: [
                TextButton(
                  onPressed: () {
                    nextImage();
                    textEditingController.clear();
                    Navigator.of(context).pop();
                  },
                  child: Text('Next'),
                ),
              ],
            );
          },
        );
      }
    } else {
      setState(() {
        isError = true;
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Incorrect word'),
            content: Text('Please try again.'),
            actions: [
              TextButton(
                onPressed: () {
                  textEditingController.clear();
                  Navigator.of(context).pop();
                },
                child: Text('Try Again'),
              ),
            ],
          );
        },
      );
    }
  }

  void nextImage() {
    setState(() {
      do {
        currentImageIndex = Random().nextInt(images.length);
      } while (currentImageIndex == previousImageIndex);
      isError = false;
    });
  }

 void _completeLevel1() {
    setState(() {
      isLevelCompleted = true;
    });
  }

void _completeLevel2() {
  setState(() {
    isLevelCompleted = true;
  });
}

void _completeLevel3() {
  setState(() {
    isLevelCompleted = true;
  });
}

  void saveLevelProgress(int level) async {
    await prefs.setInt('level_completed', level);
  }

  int previousImageIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Look & Choose'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("bgRRR.png"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.only(
          top: 90,
          left: 50,
          right: 50,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Text(
                widget.level == 1
                    ? "Let’s learn and identify fruits with Mythos!"
                    : widget.level == 2
                        ? "Let’s learn and identify animals with Mythos!"
                        : "Let’s learn and identify vegetables with Mythos!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Image.asset(
                images[currentImageIndex],
                width: 210,
                height: 210,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Score: $score',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              controller: textEditingController,
              decoration: InputDecoration(
                hintText: 'Enter the word for the image',
                errorText: isError ? 'Incorrect word' : null,
              ),
              textAlign: TextAlign.center,
              onChanged: (value) {
                setState(() {
                  isError = false;
                });
              },
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 100),
                    child: SizedBox(
                      width: 210,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: validateWord,
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        child: Ink(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            image: DecorationImage(
                              image: AssetImage("ButtonV.png"),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Center(
                            child: Text(
                              'Valider',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
