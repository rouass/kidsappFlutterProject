import 'package:flutter/material.dart';
import 'package:kidsapp/components/my_timeline_time.dart';
import 'package:kidsapp/ui/LookAndChoose/LookAndChoose.dart';
import 'package:timeline_tile/timeline_tile.dart';

class StepperAct extends StatelessWidget {
  const StepperAct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Level'),),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bgSA.png"),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: ListView(
          children: [
            MyTimeLineTime(
              isFirst: true,
              isLast: false,
              isPast: true,
              eCard: Text(
                "Level 1",
                style: TextStyle(
                  fontSize: 25,
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LookAndChoose(level: 1)),
                );
              },
            ),
            MyTimeLineTime(
                isFirst: false,
                isLast: false,
                isPast: true,
                eCard: Text(
                  "Level 2",
                  style: TextStyle(
                    fontSize: 25,
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                onPressed: () {
                  // Naviguer vers une autre interface (écran)
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LookAndChoose(level: 2)),
                  );
                }),
            MyTimeLineTime(
                isFirst: false,
                isLast: false,
                isPast: true,
                eCard: Text(
                  "Level 3",
                  style: TextStyle(
                    fontSize: 25,
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                onPressed: () {
                  // Naviguer vers une autre interface (écran)
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LookAndChoose(level: 3)),
                  );
                }),
                 MyTimeLineTime(
                isFirst: false,
                isLast: true,
                isPast: false,
                eCard: Text(
                  "Level 4",
                  style: TextStyle(
                    fontSize: 25,
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                onPressed: () {
                  // Naviguer vers une autre interface (écran)
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LookAndChoose(level: 3)),
                  );
                }),
          ],
        ),
      ),
    );
  }
}