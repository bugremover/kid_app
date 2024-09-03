import 'package:flutter/material.dart';

class DragTargetArea extends StatelessWidget {
  final List<String> userSequence;
  final int index;
  final void Function(String) onAccept;

  const DragTargetArea({
    Key? key,
    required this.userSequence,
    required this.index,
    required this.onAccept,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DragTarget<String>(
      onAccept: onAccept,
      builder: (context, candidateData, rejectedData) {
        return Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          child: userSequence.length > index
              ? Image.asset('assets/${userSequence[index]}.png')
              : Container(),
        );
      },
    );
  }
}
