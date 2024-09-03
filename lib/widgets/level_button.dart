import 'package:flutter/material.dart';

class LevelButton extends StatelessWidget {
  final String levelName;
  final bool isUnlocked;
  final VoidCallback onTap;

  const LevelButton({
    Key? key,
    required this.levelName,
    required this.isUnlocked,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isUnlocked ? onTap : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: isUnlocked ? Colors.blue : Colors.grey,
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
      ),
      child: Text(
        levelName,
        style: TextStyle(fontSize: 24.0),
      ),
    );
  }
}
