import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("I Am Rich")),
          backgroundColor: Colors.blueGrey[900],
        ),
        backgroundColor: Colors.grey,
        body: const Center(
          child: Image(image: AssetImage("images/lana.jpg")),
        ),
      ),
    ),
  );
}
