import 'package:flutter/material.dart';
import 'dart:math';

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

  void nextImage() {
    setState(() {
      do {
        currentImageIndex = Random().nextInt(images.length);
      } while (currentImageIndex == previousImageIndex);
      isError = false;
    });
  }

  int previousImageIndex = -1;

  TextEditingController textEditingController = TextEditingController();

void validateWord() {
  String inputWord = textEditingController.text.toLowerCase();
  String correctWord = words[currentImageIndex].toLowerCase();
  if (inputWord == correctWord) {
    // Logique pour vérifier si l'utilisateur a terminé tous les mots du niveau actuel
    if (currentImageIndex == images.length - 1) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Congratulations!'),
            content: Text('You have completed Level ${widget.level}. Proceed to the next level?'),
            actions: [
              TextButton(
                onPressed: () {
                  // Passer au niveau suivant
                  Navigator.of(context).pop();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LookAndChoose(level: widget.level + 1)),
                  );
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
    } else {
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
                  previousImageIndex = currentImageIndex;
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

  @override
  void initState() {
    super.initState();
    // Initialiser les images et les mots en fonction du niveau sélectionné
    switch (widget.level) {
      case 1:
        images = [
          'images/apple.png',
          'banana.png',
          'orange.png',
          // Ajouter d'autres images de fruits si nécessaire
        ];
        words = [
          'Apple',
          'Banana',
          'Orange',
          // Ajouter les mots correspondants aux fruits
        ];
        break;
      case 2:
        images = [
          'Frt/dog.png',
          'Frt/cat.png',
          'Frt/rabbit.png',
          // Ajouter d'autres images d'animaux si nécessaire
        ];
        words = [
          'Dog',
          'Cat',
          'Rabbit',
          // Ajouter les mots correspondants aux animaux
        ];
        break;
      case 3:
        images = [
          'Vgt/carrot.png',
          'Vgt/tomato.png',
          'Vgt/broccoli.png',
          // Ajouter d'autres images de légumes si nécessaire
        ];
        words = [
          'Carrot',
          'Tomato',
          'Broccoli',
          // Ajouter les mots correspondants aux légumes
        ];
        break;
      default:
        // Si le niveau sélectionné n'est pas valide, afficher une erreur
        throw ArgumentError('Invalid level');
    }
  }

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
                  // Vos autres widgets ici
                  Container(
                    margin: EdgeInsets.only(top: 100),
                    child: SizedBox(
                      width: 210,
                      height: 50, // Définissez la hauteur souhaitée ici
                      child: ElevatedButton(
                        onPressed: validateWord,
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets
                              .zero, // Pas de remplissage à l'intérieur du bouton
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        child: Ink(
                          decoration: BoxDecoration(
                            color: Colors
                                .transparent, // Couleur de fond transparente
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
