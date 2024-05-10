import 'package:flutter/material.dart';
import 'package:kidsapp/components/end_card.dart';
import 'package:timeline_tile/timeline_tile.dart';

class MyTimeLineTime extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final Widget eCard;
  final VoidCallback onPressed;

  const MyTimeLineTime({
    Key? key,
    required this.isFirst,
    required this.isLast,
    required this.isPast,
    required this.eCard,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,
        beforeLineStyle: LineStyle(
          color: isPast
              ? const Color.fromARGB(255, 1, 171, 154)
              : const Color.fromARGB(255, 170, 205, 202),
        ),
        indicatorStyle: IndicatorStyle(
          width: 70, // Réglage de la largeur de l'indicateur
          height: 70, // Réglage de la hauteur de l'indicateur (ajouté)
          color: isPast
              ? const Color.fromARGB(255, 1, 171, 154)
              : const Color.fromARGB(255, 170, 205, 202),
          indicator: Image.asset(
            'assets/med.png',
            width: 50, // Réglage de la largeur de l'image
            height: 50, // Réglage de la hauteur de l'image
          ),
        ),
        endChild: InkWell(
          onTap: onPressed,
          child: EndCard(isPast: isPast, child: eCard),
        ),
      ),
    );
  }
}
