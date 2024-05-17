import 'package:flutter/material.dart';
import 'package:kidsapp/components/my_timeline_time.dart';
import 'package:kidsapp/ui/LookAndChoose/LookAndChoose.dart';
import 'package:timeline_tile/timeline_tile.dart';

class StepperAct extends StatefulWidget {
  const StepperAct({Key? key}) : super(key: key);

  @override
  _StepperActState createState() => _StepperActState();
}

class _StepperActState extends State<StepperAct> {
  bool level1Completed = false;
  bool level2Completed = true;
  bool level3Completed = true;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Level'),
      ),
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
  isPast: level1Completed,
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
      MaterialPageRoute(builder: (context) => LookAndChoose(level: 1)),
    ).then((_) {
      setState(() {
        level1Completed = true;
      });
    });
  },
),
MyTimeLineTime(
  isFirst: false,
  isLast: false,
  isPast: level1Completed && level2Completed,
  eCard: Text(
    "Level 2",
    style: TextStyle(
      fontSize: 25,
      color: const Color.fromARGB(255, 255, 255, 255),
    ),
  ),
  onPressed: () {
    if (level1Completed && level2Completed) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LookAndChoose(level: 2)),
      ).then((_) {
        setState(() {
          level2Completed = true;
        });
      });
    }
  },
),
MyTimeLineTime(
  isFirst: false,
  isLast: false,
  isPast: !level2Completed && level3Completed,
  eCard: Text(
    "Level 3",
    style: TextStyle(
      fontSize: 25,
      color: const Color.fromARGB(255, 255, 255, 255),
    ),
  ),
  onPressed: () {
    if (level2Completed && level3Completed) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LookAndChoose(level: 3)),
      ).then((_) {
        setState(() {
          level3Completed = true;
        });
      });
    }
  },
),
          ],
        ),
      ),
    );
  }
}
