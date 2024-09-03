import 'package:flutter/material.dart';
import '../widgets/drag_target_area.dart';
import 'result_screen.dart';

class SubLevelScreen extends StatefulWidget {
  final String level;

  SubLevelScreen({required this.level});

  @override
  _SubLevelScreenState createState() => _SubLevelScreenState();
}

class _SubLevelScreenState extends State<SubLevelScreen> {
  List<String> correctSequence = ['1', '2', '3']; // Example correct sequence
  List<String> shuffledImages = ['3', '1', '2']; // Example shuffled sequence
  List<String> userSequence = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.level} Level'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(3, (index) {
              return DragTargetArea(
                userSequence: userSequence,
                index: index,
                onAccept: (data) {
                  setState(() {
                    if (userSequence.length <= index) {
                      userSequence.add(data);
                    } else {
                      userSequence[index] = data;
                    }
                  });
                },
              );
            }),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: shuffledImages.map((image) {
              return Draggable<String>(
                data: image,
                feedback:
                    Image.asset('assets/$image.png', width: 100, height: 100),
                childWhenDragging: Container(width: 100, height: 100),
                child:
                    Image.asset('assets/$image.png', width: 100, height: 100),
              );
            }).toList(),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: checkSequence,
            child: Text('Check'),
          ),
        ],
      ),
    );
  }

  void checkSequence() {
    if (userSequence.length == correctSequence.length &&
        userSequence.every((element) => correctSequence.contains(element))) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ResultScreen(isCorrect: true)),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ResultScreen(isCorrect: false)),
      );
    }
  }
}
