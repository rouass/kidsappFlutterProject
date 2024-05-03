import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final ImageProvider image;
  final String label;

  const CustomCard({Key? key, required this.image, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: 90,
        height: 90,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Align items vertically centered
          crossAxisAlignment: CrossAxisAlignment.center, // Align items horizontally centered
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8), // Add some space between image and label
            Text(

              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20// Set text to bold
              ),
            ),
          ],
        ),
      ),
    );
  }
}
