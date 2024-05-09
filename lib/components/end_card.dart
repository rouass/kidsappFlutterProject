import 'package:flutter/material.dart';

class EndCard extends StatelessWidget {
  final bool isPast;
  final child;
  const EndCard({super.key, required this.isPast, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25),
      padding: EdgeInsets.all(20),
      
      decoration: BoxDecoration(
        
          color:
              isPast ? Colors.teal : const Color.fromARGB(255, 170, 205, 202),
          borderRadius: BorderRadius.circular(20),
         
          ),
      child: child,
    );
  }
}
