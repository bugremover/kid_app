import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final bool isCorrect;

  ResultScreen({required this.isCorrect});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isCorrect ? Colors.green : Colors.red,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isCorrect ? Icons.check_circle : Icons.cancel,
              color: Colors.white,
              size: 150.0,
            ),
            SizedBox(height: 20.0),
            Text(
              isCorrect ? 'Ta-da! Correct Answer!' : 'Oops! Try Again.',
              style: TextStyle(fontSize: 30.0, color: Colors.white),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Go back to the sub-level screen
              },
              child: Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
