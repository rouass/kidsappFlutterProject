import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AlphabetList extends StatelessWidget {
  static final  String routeName = '/alphabetsList';

  List<String> alphabetImg = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'X',
    'Y',
    'Z',
    'W',
  ];
  final audioPlayer = AudioPlayer();
  void playAudio(String alphabet) async {
    await audioPlayer.play(UrlSource('sounds/A.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listen and Learn'),
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: GridView.builder(
          itemCount: alphabetImg.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, 
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                playAudio(alphabetImg[index]);
              },
              child: Container(
                padding: EdgeInsets.all(8),
                width: MediaQuery.of(context).size.width * 0.25,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFFF5F3FF),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Image.asset(
                        "images/${alphabetImg[index]}.png",
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
