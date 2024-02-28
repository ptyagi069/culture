import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const MyButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(
              255, 178, 174, 174), // Adjust the background color as needed
          borderRadius: BorderRadius.circular(10), // Add rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3), // Add shadow for depth
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisSize: MainAxisSize.min, // Reduce unnecessary space
          children: [
            Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16, // Adjust the font size as needed
                fontWeight: FontWeight.bold, // Add bold style
              ),
            ),
            const SizedBox(width: 10),
            Icon(Icons.arrow_forward, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
