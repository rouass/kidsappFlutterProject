import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    required this.text,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Color(0xFFCF25), // Text color
        padding: EdgeInsets.symmetric(vertical: 13, horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: Color(0xFFDF6D), // Border color
            width: 10, // Border width
          ),
        ),
        elevation: 5, // Add elevation for shadow
        shadowColor: Color(0xFFD84C), // Shadow color
      ),
      child: Text(
        text.toUpperCase(),
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.8,
          fontFamily: 'Seymour One', // You may need to adjust the font family
        ),
      ),
    );
  }
}
