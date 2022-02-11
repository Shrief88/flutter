import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
            title: const Center(child: Text('Ask Me anything')),
            backgroundColor: Colors),
        body: MagicBall(),
      ),
    ),
  );
}

class MagicBall extends StatefulWidget {
  const MagicBall({Key? key}) : super(key: key);

  @override
  _MagicBallState createState() => _MagicBallState();
}

class _MagicBallState extends State<MagicBall> {
  int ballImage = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: TextButton(
          child: Image.asset("images/ball$ballImage.png"),
          onPressed: () {
            setState(() {
              ballImage = Random().nextInt(5) + 1;
            });
          },
        ),
      ),
    );
  }
}
