// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jumbled Image Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Nunito',
      ),
      home: LoginPage(),
    );
  }
}

// import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/loginbackground.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Login Form
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome to the Fun Game!',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[800],
                    ),
                  ),
                  SizedBox(height: 30),
                  Image.asset('assets/loginbackground.png', height: 150),
                  SizedBox(height: 20),
                  _buildTextField(label: 'Username'),
                  _buildTextField(label: 'Password', isPassword: true),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LevelSelectionPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      backgroundColor: Colors.purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      'Sign In',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({required String label, bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        filled: true,
        fillColor: Colors.white
            .withOpacity(0.8), // Slightly transparent for visibility
      ),
    );
  }
}

class LevelSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[50],
      appBar: AppBar(
        title: Text('Choose Your Level!'),
        backgroundColor: Colors.green[600],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildLevelButton(context, 'Basic Level', Colors.orange[400]),
          _buildLevelButton(context, 'Medium Level', Colors.blue[300]),
          _buildLevelButton(context, 'Hard Level', Colors.red[300]),
        ],
      ),
    );
  }

  Widget _buildLevelButton(BuildContext context, String text, Color? color) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => GamePage(level: text)),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class GamePage extends StatefulWidget {
  final String level;

  GamePage({required this.level});

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<String> images = [];
  List<String> correctOrder = [];
  List<String> userOrder = [];

  @override
  void initState() {
    super.initState();
    _loadLevel(widget.level);
  }

  void _loadLevel(String level) {
    if (level == 'Basic Level') {
      images = [
        'assets/images/image1.png',
        'assets/images/image2.png',
        'assets/images/image3.png',
        'assets/images/image4.png'
      ];
      correctOrder = [
        'assets/images/image2.png',
        'assets/images/image3.png',
        'assets/images/image1.png',
        'assets/images/image4.png'
      ];
    } else if (level == 'Medium Level') {
      images = [
        'assets/images/image1.png',
        'assets/images/image2.png',
        'assets/images/image3.png',
        'assets/images/image4.png',
        'assets/images/image5.png',
        'assets/images/image6.png'
      ];
      correctOrder = [
        'assets/images/image1.png',
        'assets/images/image2.png',
        'assets/images/image3.png',
        'assets/images/image4.png',
        'assets/images/image5.png',
        'assets/images/image6.png'
      ];
    } else if (level == 'Hard Level') {
      images = [
        'assets/images/image1.png',
        'assets/images/image2.png',
        'assets/images/image3.png',
        'assets/images/image4.png',
        'assets/images/image5.png',
        'assets/images/image6.png',
        'assets/images/image7.png',
        'assets/images/image8.png'
      ];
      correctOrder = [
        'assets/images/image1.png',
        'assets/images/image2.png',
        'assets/images/image3.png',
        'assets/images/image4.png',
        'assets/images/image5.png',
        'assets/images/image6.png',
        'assets/images/image7.png',
        'assets/images/image8.png'
      ];
    }
    images.shuffle();
    userOrder = List.from(images);
  }

  void _checkOrder() {
    if (listEquals(userOrder, correctOrder)) {
      _showResultDialog('Awesome! You got it right!');
    } else {
      _showResultDialog('Oops! Try Again!');
    }
  }

  void _showResultDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Colors.purple[100],
        title: Text(
          message,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.purple[800],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'OK',
              style: TextStyle(fontSize: 18, color: Colors.purple[900]),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        title: Text('${widget.level}'),
        backgroundColor: Colors.pink[400],
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Draggable<String>(
                  data: userOrder[index],
                  child: ImageContainer(imagePath: userOrder[index]),
                  feedback: ImageContainer(imagePath: userOrder[index]),
                  childWhenDragging: Container(),
                  onDragCompleted: () {},
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: _checkOrder,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'Submit',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ImageContainer extends StatelessWidget {
  final String imagePath;

  ImageContainer({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
