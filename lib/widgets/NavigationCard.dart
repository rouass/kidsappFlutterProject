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
        color: color,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10), // Adjust the padding here
                child: Text(
                  name,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold ,color: Colors.white),
                ),
              ),
              SizedBox(width: 90), // Added spacing between image and text
              Padding(
                padding: const EdgeInsets.all(10), // Adjust the padding here
                child: Image.asset(
                  image,
                  height: 80,
                  width: 80,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
