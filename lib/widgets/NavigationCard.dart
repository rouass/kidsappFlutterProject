import 'package:flutter/material.dart';

class NavigationCard extends StatelessWidget {
  final String name;
  final String image;
  final String route;
  final Color color;

  const NavigationCard({
    required this.name,
    required this.image,
    required this.route,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },

      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: color, // Use the provided color
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,

          children: [
            Text(
              name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Image.asset(
              image,
              height: 80,
              width: 80,
            ),
          ],
        ),
      ),
    );
  }
}