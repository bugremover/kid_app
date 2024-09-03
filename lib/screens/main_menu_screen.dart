import 'package:flutter/material.dart';
import '../widgets/level_button.dart';
import 'sub_level_screen.dart';

class MainMenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Level'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LevelButton(
              levelName: 'Basic',
              isUnlocked: true,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SubLevelScreen(level: 'Basic')),
                );
              },
            ),
            LevelButton(
              levelName: 'Medium',
              isUnlocked: false, // Change this based on progress
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SubLevelScreen(level: 'Medium')),
                );
              },
            ),
            LevelButton(
              levelName: 'Hard',
              isUnlocked: false, // Change this based on progress
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SubLevelScreen(level: 'Hard')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
