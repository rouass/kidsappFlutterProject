import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:math';

class ListenAndGuess extends StatefulWidget {
  @override
  _ListenAndGuessState createState() => _ListenAndGuessState();
}

class _ListenAndGuessState extends State<ListenAndGuess> {
  int userScore = 0;

  Future<void> getUserScore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userScore = prefs.getInt('score') ?? 0;
    });
  }

  @override
  void initState() {
    super.initState();
    getUserScore();
  }


  final List<String> characters = ['APPLE', 'BALL', 'CAT', 'DOG'
  'ELEPHANT', 'FISH', 'GOAT', 'HEN', 'ICE', 'JAM', 'KEY', 'LAMP', 'MOUSE',
    'NEST', 'ORANGE', 'PENGUIN', 'QUILL', 'RABBIT', 'SNAKE', 'TORTOISE', 'UMBRELLA','VEN'];
  final AudioPlayer audioPlayer = AudioPlayer();
  String soundFileName = '';
  List<String> randomLetters = [];
  Map<String, int> letterIndices = {};
  List<String> clickedLetters = [];

  Future<void> incrementScore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int score = (prefs.getInt('score') ?? 0) + 1;
    await prefs.setInt('score', score);
    setState(() {
      userScore = score;
    });
  }

  Future<void> playRandomSound() async {
    final Random random = Random();
    final int soundIndex = random.nextInt(characters.length);
    final String newSoundFileName = characters[soundIndex];
    final String soundFilePath = 'sounds/ListenAndGuess/$newSoundFileName.mp3';
    await audioPlayer.play(UrlSource(soundFilePath));
    print('Now playing: $newSoundFileName.mp3');
    setState(() {
      soundFileName = newSoundFileName;
      randomLetters = generateRandomLetters();
      letterIndices.clear();
      clickedLetters.clear();
      for (int i = 0; i < soundFileName.length; i++) {
        letterIndices[randomLetters[i]] = i;
      }
    });
  }

  List<String> generateRandomLetters() {
    List<String> letters = soundFileName.split('');
    letters.shuffle();
    return letters;
  }

  void handleLetterClick(String letter) {
    if (letterIndices.containsKey(letter)) {
      setState(() {
        clickedLetters.add(letter);
      });
      verifyClickedLetters();
    }
  }

  void verifyClickedLetters() {
    if (clickedLetters.length == soundFileName.length) {
      bool isCorrectOrder = true;
      for (int i = 0; i < soundFileName.length; i++) {
        if (clickedLetters[i] != soundFileName[i]) {
          isCorrectOrder = false;
          break;
        }
      }
      if (isCorrectOrder) {
        showSuccessDialog();
      } else {
        String correctOrder = '';
        for (int i = 0; i < soundFileName.length; i++) {
          if (clickedLetters.length > i && clickedLetters[i] == soundFileName[i]) {
            correctOrder += soundFileName[i];
          } else {
            correctOrder += '-';
          }
        }
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Try Again!'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('The letters you clicked are not in the correct order. Here is the correct order:'),
                  Text(correctOrder),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    setState(() {
                      clickedLetters.clear();
                    });
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    }
  }

  Future<void> showSuccessDialog() async {
    await incrementScore();
    await getUserScore();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Congratulations!'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('images/$soundFileName.png'),
              SizedBox(height: 10),
              Text('Great job! You guessed it right!'),
              SizedBox(height: 10),
              Text('Your score: $userScore'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                playRandomSound();
              },
              child: Text('Next'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/bgRose.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 90,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  'Choose the Right Alternative',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.only(top: 150.0),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        playRandomSound();
                      },
                      child: Image.asset(
                        "images/sound.png",
                        width: 120,
                        height: 120,
                      ),
                    ),
                    if (soundFileName.isNotEmpty)
                      Expanded(
                        child: GridView.count(
                          padding: const EdgeInsets.only(top: 100.0),
                          shrinkWrap: true,
                          crossAxisCount: soundFileName.length,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                          children: List.generate(
                            randomLetters.length,
                            (index) => GestureDetector(
                              onTap: () {
                                handleLetterClick(randomLetters[index]);
                              },
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 240, 234, 234),
                                  borderRadius: BorderRadius.circular(7),
                                  border: Border.all(color: const Color.fromARGB(255, 223, 233, 238)),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  randomLetters[index],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
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
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  'Score: $userScore',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
