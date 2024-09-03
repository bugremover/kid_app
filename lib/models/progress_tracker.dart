import 'package:shared_preferences/shared_preferences.dart';

class ProgressTracker {
  static Future<void> unlockLevel(String level) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(level, true);
  }

  static Future<bool> isLevelUnlocked(String level) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(level) ?? false;
  }
}
